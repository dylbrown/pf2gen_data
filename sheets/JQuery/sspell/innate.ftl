<!-- Start Racial Innate Spells -->
<#assign spellrace = pcvar('COUNT[SPELLRACE]') />
<#if (spellrace = 0)>
	<!-- No innate spells -->
<#else>
<br />
<!-- Test1 -->
<#assign spellbook = 1 />
<#assign class = 0 />
<#assign level = 0 />
<!-- Test2 -->
<#if (pcvar("COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]") > 0) >
<!-- Test3 -->
<!-- START Spell list Header Table (Racial Innate) -->
<div class="ssp-table"><table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
 <tr>
  <td colspan="11" class="sphead"><b>Innate Spell-like Abilities</b></td>
 </tr>
</table></div>
<!-- End Spell List Header Table (Racial Innate) -->
<!-- Start Racial Innate Spell listing -->
<div class="ssp-table"><table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
<@loop from=0 to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]-1') ; spell , spell_has_next>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td class="spname"><b>${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.NAME')}</b><br /></td>
  <td class="sptab">
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO") = "None")>
<#else>
  <i>DC:</i>${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DC')}<br />
</#if>  
  	</td>
  <td class="sptab"><i>Save:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO')}<br /></td>
  <td class="sptab"><i>Time:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTINGTIME')}, 
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMES") = "At Will")>
at will
<#else>
${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMES')}/${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMEUNIT')}
</#if>
   <br /></td>
  <td class="sptab"><i>Duration:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DURATION')}<br /></td>
  <td class="sptab"><i>Rng:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.RANGE')}<br /></td>
  <td class="sptab"><i>Comp:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.COMPONENTS')}<br /></td>
  <td class="sptab"><i>SR:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SR')}<br /></td>
  <td class="sptab"><i>School:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SCHOOL')}<br /></td>
 </tr>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td colspan="7" class="sptab1"><i>Effect:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.EFFECT')}<br /></td>
  <td colspan="2" class="sptab2"><i>Source:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SOURCEPAGE')}<br /></td>
 </tr>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td colspan="7" class="sptab1"><i>Target Area:</i>&nbsp;&nbsp; ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TARGET')}<br /></td>
  <td colspan="2" class="sptab2"><i>Caster Level:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTERLEVEL')}<br /></td>
   </tr>
</@loop>
 <tr>
  <td colspan="9" bgcolor="black"><br /></td>
 </tr>
</table></div>
</#if>
<!-- End Racial Innate Spells -->
<!-- Start Other Innate Spells -->
<@loop from=2 to=pcvar('COUNT[SPELLBOOKS]-1') ; spellbook , spellbook_has_next>
<#assign class = 0 />
<#assign level = 0 />
<#if (pcvar("SPELLLISTBOOK.${class}.${level}.${spellbook}") > 0) >
<!-- START Spell list Header Table (Other Innate) -->
<br />
		<div class="ssp-table">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
				<tr>
					<td colspan="9" class="sphead"><b>${pcstring('SPELLBOOKNAME.${spellbook}')} Spell-like Abilities</b></font></td>
				</tr>
			</table>
		</div>
<div class="ssp-table"><table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
<@loop from=0 to=pcvar('COUNT[SPELLSINBOOK.${class}.${spellbook}.${level}]-1') ; spell , spell_has_next>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td class="spname"><b>${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.NAME')}</b><br /></td>
  <td class="sptab">
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO") = "None")>
<#else>
  <i>DC:</i> <span  class="${pcstring('SPELLLISTDCSTAT.0')}${pcstring('SPELLLISTDCSTAT.1')}-mod">${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DC')}</span><br />
</#if>  
  	</td>
  <td class="sptab"><i>Save:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SAVEINFO')}<br /></td>
  <td class="sptab"><i>Time:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTINGTIME')}, 
<#if (pcstring("SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMES") = "At Will")>
at will
<#else>
${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMES')}/${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TIMEUNIT')}
</#if>
   <br /></td>
  <td class="sptab"><i>Duration:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.DURATION')}<br /></td>
  <td class="sptab"><i>Rng:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.RANGE')}<br /></td>
  <td class="sptab"><i>Comp:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.COMPONENTS')}<br /></td>
  <td class="sptab"><i>SR:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SR')}<br /></td>
  <td class="sptab"><i>School:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SCHOOL')}<br /></td>
 </tr>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td colspan="7" class="sptab1"><i>Effect:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.EFFECT')}<br /></td>
  <td colspan="2" class="sptab2"><i>Source:</i>&nbsp;&nbsp;${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.SOURCEPAGE')}<br /></td>
 </tr>
<#if (spell % 2 = 0)><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
  <td colspan="7" class="sptab1"><i>Target Area:</i>&nbsp;&nbsp; ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.TARGET')}<br /></td>
  <td class="sptab2" colspan="2"><i>Caster Level:</i> ${pcstring('SPELLMEM.${class}.${spellbook}.${level}.${spell}.CASTERLEVEL')}<br /></td>
 </tr>
</@loop>
 <tr>
  <td colspan="9" bgcolor="black"><font style="font-size: 8pt" color="white"><br /></font></td>
 </tr>
</table></div>
</#if>
</@loop>
<!-- End Other Innate Spells -->
</#if>
<!-- End Innate Spells -->