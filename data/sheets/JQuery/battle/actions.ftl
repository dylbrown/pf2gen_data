<#macro actionBlock action>
<#assign reaction=false>
	<tr class="actionAccord">
		<td class="item-name font8"><b>${action.name}</b></td>
		<td class="border font8"><b><#switch action.cost>
			<#case "Free">Ⓕ<#break>
			<#case "Reaction">Ⓡ<#assign reaction=true><#break>
			<#case "One">①<#break>
			<#case "Two">②<#break>
			<#case "Three">③<#break>
		</#switch></b></td>
	</tr>
	<tr class="actionHide">
		<td colspan="2" class="font6">
		<#if reaction>
			<b>Trigger</b> ${action.getExtensionByName("Activity").trigger}<br><br>
		</#if>
		${action.desc}
		</td>
	</tr>
</#macro>
<!-- START Actions Table -->
<table cellpadding="0" cellspacing="0" border="0" width="100%" summary="Actions Table" class="actions-table actions-info font5">
<#list character.attacks as attack>
		<@weaponBlock weapon=attack/>
</#list>
<#list character.abilities as ability>
		<#if Activity.isInstance(ability)><@actionBlock action=ability /></#if>
	</#list>
</table>
<!-- STOP Actions Table -->