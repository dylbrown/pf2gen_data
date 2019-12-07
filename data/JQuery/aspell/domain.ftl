<!-- START Domain Table -->
<#if (pcstring("DOMAIN.1") != "") >
		<div class="asp-table"><table width="100%" cellspacing="0" cellpadding="3" summary="Domain List">
			<tr>
				<td bgcolor="black" align="center" colspan="2" class="ab"><b>Cleric of ${pcstring('DEITY')}</b></td>
			</tr>
			<tr>
				<td valign="top" class="border10"><b>Domain</b><br /></td>
				<td valign="top" class="border10"><b>Granted Power</b><br /></td>
			</tr>
			<!--Bjorn Ehlert: The use of COUNT[DOMAINS]+1 doesn't result in empty TDs at the end of the TABLE-->
<@loop from=1 to=pcvar('COUNT[DOMAINS]') ; domainspell , domainspell_has_next >
	<tr><td valign="top" class="border10">${pcstring('DOMAIN.${domainspell}')}<br /></td><td valign="top" class="border10">${pcstring('DOMAIN.${domainspell}.POWER')}<br /></td></tr>
</@loop>
		</table></div>
</#if><!-- STOP Domain Table -->