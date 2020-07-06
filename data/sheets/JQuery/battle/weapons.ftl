<#macro weaponBlock weapon>
	<tr>
		<td class="item-name" rowspan="2"><font class="font8"><b>${weapon.name}</b></font></td>
		<td class="border"><font class="font6"><b class="tohit">${weapon.attack?string.@s}<br /></b></font></td> 
		<td class="border"><font class="font6"><b class="damage">${weapon.damage}${weapon.damagemod?string.@s} ${weapon.damageType?string[0]}<br /></b></font></td>
		<td class="border"><font class="font6"><b>${weapon.hands}</b></font></td>
		<td class="border"><font class="font6"><b>${weapon.group}<br /></b></font></td>
	</tr>
	<tr>
		<!--<td><font class="font4"><b>TRAITS</b></font></td>-->
		<td colspan="4"><font class="border6"><b>
		<#list weapon.traits as trait>
			${trait}<#sep>, </#sep>
		</#list>
		</b></font></td>
	</tr>
</#macro>
<!-- START Weapon Table -->
<table cellpadding="0" cellspacing="0" border="0" width="100%" summary="Weapon Table" class="weapons-table weapons-info font5">
		<tr>
			<td><font class="font4"><b>NAME</b></font></td>
			<td><font class="font4"><b>TO HIT</b></font></td>
			<td><font class="font4"><b>DAMAGE</b></font></td>
			<td><font class="font4"><b>HANDS</b></font></td>
			<td><font class="font4"><b>GROUP</b></font></td><#-- width="15%" height="15"-->
		</tr>
<#list character.attacks as attack>
		<@weaponBlock weapon=attack/>
</#list>
<#list character.inventory as item>
	<#if Weapon.isInstance(item.stats)>
		<@weaponBlock weapon=item/>
	</#if>
</#list>
</table>
<!-- STOP Weapon Table -->
<!-- START Armor Table -->
<#if (character.getSlot[Slot.Armor])??>
<#assign armor=character.getSlot[Slot.Armor]>
<table cellpadding="0" cellspacing="0" width="100%" border="0" summary="Armor Table" class="armour-info">
	<tr>
		<td rowspan="4" class="item-name" data-name="${armor.stats.name}" data-type="click">
			<b class="font7">${armor.stats.name}</b></td>
		<td><font class="font4"><b>TYPE</b></font></td>
		<td><font class="font4"><b>ARMOR BONUS</b></font></td>
		<td><font class="font4"><b>MAX DEX</b></font></td>
		<td><font class="font4"><b>SPEED PENALTY</b></font></td>
	</tr>
	<tr>
		<td class="border8 font5"><b>${armor.stats.proficiency}</b></td>
		<td class="border8 font5"><b>${armor.stats.ac}</b></td>
		<td class="border8 font5"><b>${armor.stats.maxdex}</b></td>
		<td class="border8 font5"><b>${armor.stats.speedpenalty}</b></td>
	</tr>
	<tr>
		<td><font class="font4"><b>ACP</b></font></td>
		<td><font class="font4"><b>STRENGTH</b></font></td>
		<td><font class="font4"><b>GROUP</b></font></td>
		<td><font class="font4"><b>TRAITS</b></font></td>
	</tr>
	<tr>
		<td class="border7"><b>${armor.stats.acp}</b></td>
		<td class="border7"><b>${armor.stats.strength}</b></td>
		<td class="border7"><b>${armor.stats.group}</b></td>
		<td class="border7 font5"><b>
			<#list armor.stats.traits as trait>
				${trait}<#sep>, </#sep>
			</#list>
		</b></td>
	</tr>
</table>
</#if>
<!-- STOP Armor Table -->