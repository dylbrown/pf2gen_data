<!-- START Spell list Class Labels -->
<#if (pcvar('COUNT[SPELLRACE]') = 0)>
<#else>
<@loop from=0 to=0 ; spellbook , spellbook_has_next>
<br />
<@loop from=pcvar('COUNT[SPELLRACE]') to=pcvar('COUNT[SPELLRACE]+COUNT[CLASSES]-1') ; class , class_has_next><#-- TODO: Loop was of early exit type 1 -->
<#if (pcvar("SPELLLISTCLASS.${class}") > 0) >
</#if>
</@loop>
</@loop>
</#if>
<!-- END Spell list Class Labels -->
<#assign spellbook = 0 />
<br />
<@loop from=pcvar('COUNT[SPELLRACE]') to=pcvar('COUNT[SPELLRACE]+COUNT[CLASSES]-1') ; class , class_has_next><#-- TODO: Loop was of early exit type 1 -->
<#if (pcstring("SPELLLISTCLASS.${class}") != '') >
<#if (pcstring('SPELLLISTMEMORIZE.${class}') == 'true')>
<!-- START Spell list Header Table (Known) -->
		<div class="ssp-table">
			<table class="SCount" width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
				<tr>
					<td bgcolor="black" class="sptop" colspan="0"><b>${pcstring('CLASS.${class}')}</b></td>
				</tr>
				<tr>
					<td bgcolor="black" class="sptop" width="5%"><b>LEVEL</b></td>
<@loop from=0 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td bgcolor="black" class="sptop"><b>${level}</b></td>
</@loop>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>Per Day</b></td>
<@loop from=0 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td class="sptab"><div class="countcont "><div class="castdata castdata${level}" data-level=${level} data-max="${pcstring('SPELLLISTCAST.${class}.${level}')}">${pcstring('SPELLLISTCAST.${class}.${level}')}</div></div></td>
</@loop>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>Uncast/Prepped</b></td>
<@loop from=0 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td class="sptab"><div class="countcont "><div class="prepdata prepdata${level}" data-level=${level} data-max="${pcstring('SPELLLISTCAST.${class}.${level}')}">0/0</div></div></td>
</@loop>
				</tr>
			</table>
		</div>
<!-- End Spell List Header Table (Known) -->
<!-- Start Known Spells -->
		<div class="ssp-table ssp-accord">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
<@loop from=0 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next><#-- TODO: Loop was of early exit type 1 -->
<@loop from=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]') to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]') ; spellcount , spellcount_has_next>
<#if (spellcount = 0)>
<#else>
				<tbody>
					<tr class="accord5">
						<td colspan="10" class="splevel"><b>LEVEL ${level}</b></td>
					</tr>
<#if (pcvar('SPELLLISTMEMORIZE.${class}') == 0)>
<#--|FOR.0,COUNT[SPELLLISTCAST.%class.%level],1,1,1,&#9744;,,,0| <@loop from=0 to=pcvar('COUNT[SPELLLISTCAST.${class}.${level}]') ; class , class_has_next >-->
</#if>
<@loop from=0 to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]-1') ; spell , spell_has_next>
					<tr class="accord6">
						<td class="spname" colspan="2"><b>${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.BONUSSPELL')}${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.NAME')}</b><br /></td>
						<td colspan="7" class="sptab1"><i>Effect:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.EFFECT')}<br /></td>
					</tr>	
					<tr>
						<td class="sptab">
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO") = "None")>
<#else>
							<i>DC:</i> <span class="${pcstring('SPELLLISTDCSTAT.0')}${pcstring('SPELLLISTDCSTAT.1')}-mod">${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DC')}</span><br />
</#if>  
						</td>
						<td class="sptab"><i>Save:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO')}<br /></td>
						<td class="sptab"><i>Time:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTINGTIME')}<br /></td>
						<td class="sptab"><i>Duration:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DURATION')}<br /></td>
						<td class="sptab"><i>Rng:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.RANGE')}<br /></td>
						<td class="sptab"><i>Comp:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.COMPONENTS')}<br /></td>
						<td class="sptab"><i>SR:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SR')}<br /></td>
						<td class="sptab"><i>School:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SCHOOL')}<br /></td>
						<td class="sptab">
<#if (pcstring("SPELLLISTTYPE.${class}") = "Psionic")>
<@loop from=(level*2)-1 to=(level*2)-1 ; ppcost , ppcost_has_next >
<#if (pcstring("${ppcost}") = "-1")>
							<i>PP:</i> 0/1
<#else>
							<i>PP:</i> ${ppcost}
</#if>
</@loop>
						</td>
<#else>
</#if>
					</tr>
					<tr>
						<td colspan="2" align="center" class="sptab2 spellyparent"><div class="spelly" data-spl=${level} data-spn="${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.NAME')}"><input class="sp-add" type="button" value="+"><input class="sp-count" type="text" name="change" min="0" value=0 disabled><input class="sp-sub" type="button" value="-"></div></td>
						<td colspan="1" class="sptab2"><i>Src:</i>&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SOURCEPAGE')}<br /></td>
						<td colspan="1" class="sptab2"><i>CL:</i>&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTERLEVEL')}<br /></td>
						<td colspan="5" class="sptab2"><i>Target Area:</i>&nbsp; ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TARGET')}</td>	
					</tr>
</@loop>
				</tbody>
</#if>
</@loop>
</@loop>
				<tr>
					<td colspan="10" bgcolor="#FFFFFF" class="ablable" align="left">* = Domain/Specialty Spell</td>
				</tr>
			</table>
		</div>
<#else>
<!-- START Spell list Header Table (Known) -->
		<div class="ssp-table">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
				<tr>
					<td bgcolor="black" class="sptop" colspan="0"><b>${pcstring('CLASS.${class}')}</b></td>
				</tr>
				<tr>
					<td bgcolor="black" class="sptop" width="5%"><b>LEVEL</b></td>
<@loop from=1 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td bgcolor="black" class="sptop"><b>${level}</b></td>
</@loop>
					<td bgcolor="black" class="sptop" width="5%"><b></b></td>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>PER DAY</b></td>
<@loop from=1 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td class="sptab"><div class="countcont "><div class="castdata castdata${level}" data-level=${level} data-max="${pcstring('SPELLLISTCAST.${class}.${level}')}">${pcstring('SPELLLISTCAST.${class}.${level}')}</div></div></td>
</@loop>
					<td class="sptab" rowspan="2" style="vertical-align:middle; padding:0px 2px;"><input class="spellreset spellreset${class}"type="button" value="Reset"></td>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>CAST</b></td>
<@loop from=1 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
					<td class="sptab"><div class="castcont"><input class="castbut castbut${level}" type="button" value="-"></div></td>
</@loop>
				</tr>
			</table>
		</div>
<!-- End Spell List Header Table (Known) -->
<!-- Start Known Spells -->
		<div class="ssp-table ssp-accord">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
<@loop from=0 to=pcvar('MAXSPELLLEVEL.${class}') ; level , level_has_next> <#-- TODO: Loop was of early exit type 1 -->
<@loop from=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]') to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]') ; spellcount , spellcount_has_next>
<#if (spellcount = 0)>
<#else>
				<tbody>
					<tr class="accord5">
						<td colspan="10" class="splevel"><b>LEVEL ${level}</b></td>
					</tr>
<#if (pcvar('SPELLLISTMEMORIZE.${class}') = 1)>
<#else>
<#--|FOR.0,COUNT[SPELLLISTCAST.%class.%level],1,1,1,&#9744;,,,0|-->
</#if>
<@loop from=0 to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]-1') ; spell , spell_has_next>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD" class="accord6"><#else><tr bgcolor="white" class="accord6"></#if>
						<td class="spname" colspan="2"><b>${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.BONUSSPELL')}${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.NAME')}</b><br /></td>
						<td colspan="7" class="sptab1"><i>Effect:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.EFFECT')}<br /></td>
					</tr>	
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
						<td class="sptab">
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO") = "None")>
<#else>
							<i>DC:</i> <span class="${pcstring('SPELLLISTDCSTAT.0')}${pcstring('SPELLLISTDCSTAT.1')}-mod">${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DC')}</span><br />
</#if>  
						</td>
						<td class="sptab"><i>Save:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO')}<br /></td>
						<td class="sptab"><i>Time:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTINGTIME')}<br /></td>
						<td class="sptab"><i>Duration:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DURATION')}<br /></td>
						<td class="sptab"><i>Rng:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.RANGE')}<br /></td>
						<td class="sptab"><i>Comp:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.COMPONENTS')}<br /></td>
						<td class="sptab"><i>SR:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SR')}<br /></td>
						<td class="sptab"><i>School:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SCHOOL')}<br /></td>
						<td class="sptab">
<#if (pcstring("SPELLLISTTYPE.${class}") = "Psionic")>
<@loop from=(level*2)-1 to=(level*2)-1 ; ppcost , ppcost_has_next >
<#if (pcstring("${ppcost}") = "-1")>
							<i>PP:</i> 0/1
<#else>
							<i>PP:</i> ${ppcost}
</#if>
</@loop>
						</td>
<#else>
</#if>
					</tr>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
						<td colspan="2" class="sptab2"><i>Src:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SOURCEPAGE')}<br /></td>
						<td colspan="1" class="sptab2"><i>CL:</i>&nbsp;&nbsp; ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTERLEVEL')}<br /></td>
						<td colspan="7" class="sptab1"><i>Target Area:</i>&nbsp;&nbsp; ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TARGET')}
						</td>
					</tr>
</@loop>
				</tbody>
</#if>
</@loop>
</@loop>
				<tr>
					<td colspan="10" bgcolor="#FFFFFF" class="ablable" align="left">* = Domain/Specialty Spell</td>
				</tr>
			</table>
		</div>
</#if>
</#if>
</@loop>
<!-- End Known Spells -->
<!-- ================================================================ -->