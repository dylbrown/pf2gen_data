<!-- START Skills Table -->
<#macro skillRow skill isEven>
<#if (isEven)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
				<td align="center"  class="font7"></td>
				<td align="left" class="font8">&nbsp;&nbsp;${skill.name}</td>
				<td align="center" class="font7">${skill.ability}</td>
				<td align="center" class="borderbottom8" valign="bottom"><b class="${skill.ability}-mod">${skill.mod?string.@s}</b></td>
				<td align="center" valign="bottom" class="font8"><b>=</b></td>
				<td align="center" class="borderbottom8 ${skill.ability}-mod" valign="bottom">${character.abilityMod[skill.ability]?string.@s}<br /></td>
				<td align="center" valign="bottom" class="font8"><b>+</b></td>
				<td align="center" class="borderbottom8" valign="bottom">${(skill.mod-character.abilityMod[skill.ability])?string.@s} <br /></td>
			</tr>
</#macro>
		<div class="s-table"><table cellpadding="0" cellspacing="0" height="100%" width="100%" border="0" summary="Skills Table">
			<tr>
				<td style="height:10%" bgcolor="black"></td>
				<td bgcolor="black" align="center" class="font8"><font color="white"><b>SKILLS</b></font></td>
				<td colspan="3" bgcolor="black" align="center"></td>
				<td bgcolor="black" align="right" ></td>
				<td bgcolor="black" align="center"></td>
				<td colspan="2" bgcolor="black" align="center"></td>
			</tr>
			<tr>
				<td style="height:5%" colspan="2" align="center" width="40%" class="border4">SKILL NAME</td>
				<td align="center" width="5%" class="border4">ABILITY</td>
				<td align="center" width="13%" colspan="1" class="border4">SKILL<br />MODIFIER</td>
				<td align="center" width="13%" colspan="2" class="border4">ABILITY<br />MODIFIER</td>
				<td align="center" width="13%" colspan="2" class="border4">PROFICIENCY</td>
			</tr>
<#if (character.skills?size > 0)>
	<#assign x=character.skills?size>
	<#list 0..(x/2) as i>
		<@skillRow skill=character.skills[i] isEven=(i % 2 == 0)/>
	</#list>
</#if>
	   </table></div>
	   <div class="s-table"><table cellpadding="0" cellspacing="0" height="100%" width="100%" border="0" summary="Skills Table">
			<tr>
				<td style="height:10%" bgcolor="black"></td>
				<td bgcolor="black" align="center" class="font8"><font color="white"><b>SKILLS</b></font></td>
				<td colspan="3" bgcolor="black" align="center"></td>
				<td bgcolor="black" align="right" ></td>
				<td bgcolor="black" align="center"></td>
				<td colspan="2" bgcolor="black" align="center"></td>
			</tr>
			<tr>
				<td style="height:5%" colspan="2" align="center" width="40%" class="border4">SKILL NAME</td>
				<td align="center" width="5%" class="border4">ABILITY</td>
				<td align="center" width="13%" colspan="1" class="border4">SKILL<br />MODIFIER</td>
				<td align="center" width="13%" colspan="2" class="border4">ABILITY<br />MODIFIER</td>
				<td align="center" width="13%" colspan="2" class="border4">PROFICIENCY</td>
			</tr>
<#if (character.skills?size > 1)>
	<#list (x/2+1)..(x-1) as i>
		<@skillRow skill=character.skills[i] isEven=(i % 2 == 0)/>
	</#list>
</#if>
<#if (character.skills?size > 1 && character.skills?size % 2 == 1)>
	<tr bgcolor="white">
		<td align="center"  class="font7">&nbsp;&nbsp;</td>
		<td align="left" class="font8"></td>
		<td align="center" class="font7"></td>
		<td align="center" class="font8" valign="bottom"></td>
		<td align="center" valign="bottom" class="font8"></td>
		<td align="center" class="font8" valign="bottom"></td>
		<td align="center" valign="bottom" class="font8"></td>
		<td align="center" class="font8" valign="bottom"></td>
	</tr>
</#if>
	   </table></div>
	<!-- STOP Skills Table -->