<!-- START Language Table -->
		<div class="q-table"><table width="100%" cellspacing="0" cellpadding="3" summary="Language Table">
			<tr class="accord1">
				<td align="center" colspan="1" class="font8 white-text"><b>LANGUAGES</b></td>
			</tr>
			<tr>
				<td bgcolor="#DDDDDD" valign="top" width="100%" class="border8">
				<#list character.languages as language>
					<#if language?string != "Free">${language}<#sep>, </#sep></#if>
				</#list>
				</td>
			</tr>
		</table></div>
		<!-- STOP Language Table -->
		<!-- Start Proficiency Table -->
		<div class="q-table"><table width="100%" cellspacing="0" cellpadding="3" summary="Proficiency Table">
			<tr class="accord1">
				<td align="center" colspan="4" class="font8 white-text"><b>PROFICIENCIES</b></td>
			</tr>
			<tr>
				<td valign="top" class="font8 white-text">Unarmored</td>
				<td valign="top" class="border8">${character.attributes.unarmored.proficiency}</td>
				<td valign="top" class="font8 white-text">Light Armor</td>
				<td valign="top" class="border8">${character.attributes.lightarmor.proficiency}</td>
			</tr>
			<tr>
				<td valign="top" class="font8 white-text">Medium Armor</td>
				<td valign="top" class="border8">${character.attributes.mediumarmor.proficiency}</td>
				<td valign="top" class="font8 white-text">Heavy Armor</td>
				<td valign="top" class="border8">${character.attributes.heavyarmor.proficiency}</td>
			</tr>
			<tr>
				<td valign="top" class="font8 white-text">Simple Weapons</td>
				<td valign="top" class="border8">${character.attributes.simpleweapons.proficiency}</td>
				<td valign="top" class="font8 white-text">Martial Weapons</td>
				<td valign="top" class="border8">${character.attributes.martialweapons.proficiency}</td>
			</tr>
			<tr>
				<td valign="top" class="font8 white-text">Advanced Weapons</td>
				<td valign="top" class="border8">${character.attributes.advancedweapons.proficiency}</td>
				<td valign="top" class="font8 white-text">Class DC</td>
				<td valign="top" class="border8">${character.attributes.classdc.proficiency}</td>
			</tr>
			<tr>
				<td valign="top" class="font8 white-text">Spell Attacks</td>
				<td valign="top" class="border8">
				    <#switch character.spells.tradition>
                        <#case "Arcane">
                            ${character.attributes.arcaneSpellAttacks.proficiency}
                            <#break>
                        <#case "Divine">
                            ${character.attributes.divineSpellAttacks.proficiency}
                            <#break>
                        <#case "Occult">
                            ${character.attributes.occultSpellAttacks.proficiency}
                            <#break>
                        <#case "Primal">
                            ${character.attributes.primalSpellAttacks.proficiency}
                            <#break>
				    </#switch>
				</td>
				<td valign="top" class="font8 white-text">Spell DCs</td>
				<td valign="top" class="border8">
				    <#switch character.spells.tradition>
                        <#case "Arcane">
                            ${character.attributes.arcaneSpellDCs.proficiency}
                            <#break>
                        <#case "Divine">
                            ${character.attributes.divineSpellDCs.proficiency}
                            <#break>
                        <#case "Occult">
                            ${character.attributes.occultSpellDCs.proficiency}
                            <#break>
                        <#case "Primal">
                            ${character.attributes.primalSpellDCs.proficiency}
                            <#break>
				    </#switch>
                </td>
			</tr>
		</table></div>
		<!-- STOP Proficiency Table -->
		<!-- START Feat Table -->
		<div class="q-table"><table width="100%" cellspacing="0" cellpadding="2" summary="Feat Table">
			<tr class="accord1">
				<td align="center" colspan="2" class="font8 white-text"><b>FEATS</b></td>
			</tr>
			<tr>
				<td valign="top" class="border8 feat-name"><b>NAME</b></td>
				<td valign="top" class="border8 feat-name" align="left"><b>DESCRIPTION</b></td>
			</tr>
<#list character.abilities as ability>
			<tr class="feat-row">
				<td valign="top" class="font8 feat-name"><b>${ability.name}</b></td>
				<td valign="top" align="left" class="font6 feat-desc">${ability.desc}</td>
			</tr>
</#list>
</table></div>
		<!-- STOP Feat Table -->