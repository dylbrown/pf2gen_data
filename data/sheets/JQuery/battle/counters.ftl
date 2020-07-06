<!-- START Conditions Table -->
<table width="100%" cellspacing="0" cellpadding="2" summary="Conditions Table" class="condHolder"><tbody id="sortable1Root"class="sortable1">
	<thead class="state-disabled">
		<td bgcolor="black" align="center" class="font8 secHead"><font color="white"><b>CONDITIONS</b></font></td>
		<td colspan=2 class="condSec"><div class="cond-but"><input class="cond-add" type="button" value="+"></div></td>
		<td colspan=2 class="condSec"><div class="cond-but"><input class="add-folder material-icons" type="button" value="folder_open"></div></td>
	</thead>
</tbody></table>
<!-- STOP Conditions Table -->
<!-- START Special Attacks Table -->
<#--
<#if (pcvar('count("ABILITIES","CATEGORY=Special Ability","VISIBILITY=DEFAULT[or]VISIBILITY=OUTPUT_ONLY")') > 0)>
		<table width="100%" cellspacing="0" cellpadding="2" summary="Special Attack Table" class="sAttackHolder">
			<tr>
				<td bgcolor="black" align="center" class="font8 secHead"><font color="white"><b>SPECIAL ATTACKS</b></font></td>
				<td colspan=2><div class="ability-reset"><input id="ability-reset" type="button" value="Reset"></div></td>
			</tr>
				<#assign attackCounter=0>
				<@loop from=0 to=pcvar('count("ABILITIES","CATEGORY=Special Ability","VISIBILITY=DEFAULT[or]VISIBILITY=OUTPUT_ONLY")-1') ; specialAttack , specialAttack_has_next>
				<#if pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}.ASPECT.CheckCount') != "">
				<#assign attackCounter+=1>
				<#if (attackCounter % 2 = 0)><tr bgcolor="#DDDDDD" class="accord8"><#else><tr bgcolor="white" class="accord8"></#if>
				<td valign="top" class="font8"><b>${pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}')}
					<#if (pcstring("ABILITYALL.Special Ability.VISIBLE.${specialAttack}.TYPE")?contains("EXTRAORDINARY"))> 
					 (Ex)
					</#if>
					<#if (pcstring("ABILITYALL.Special Ability.VISIBLE.${specialAttack}.TYPE")?contains("SUPERNATURAL"))> 
					 (Su)
					</#if>
					<#if (pcstring("ABILITYALL.Special Ability.VISIBLE.${specialAttack}.TYPE")?contains("SPELLLIKE"))> 
					 (Sp)
					</#if>
					<#if (pcstring("ABILITYALL.Special Ability.VISIBLE.${specialAttack}.TYPE")?contains("PSILIKE"))> 
					 (Ps)
					</#if>
					</b>
				</td>
				<td class="abilityholder">
					<span class="abilitycont"><input class="abilitybut" data-name="${pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}')}" type="button" value="-"></span>
				</td><td class='abilityholder'>
					<span class="abilitydisp font8" data-name="${pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}')}" data-max="${pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}.ASPECT.CheckCount')}">${pcstring('ABILITYALL.Special Ability.VISIBLE.${specialAttack}.ASPECT.CheckCount')}</span>
				</td>
			</tr>
</#if>
</@loop>
<@loop from=0 to=pcvar("count[EQTYPE.Rod]-1") ; rod, rod_has_next >
	<#assign attackCounter+=1>
	<#if (attackCounter % 2 = 0)><tr bgcolor="#DDDDDD" class="accord8"><#else><tr bgcolor="white" class="accord8"></#if>
	<td valign="top" class="font8">
		<b>${pcstring('EQTYPE.Rod.${rod}.NAME')}</b>
	</td>
	<td class="abilityholder">
		<span class="abilitycont"><input class="abilitybut" data-name="${pcstring('EQTYPE.Rod.${rod}.NAME')}" type="button" value="-"></span>
	</td><td class='abilityholder'>
		<span class="abilitydisp font8" data-name="${pcstring('EQTYPE.Rod.${rod}.NAME')}" data-max="${pcstring('EQTYPE.Rod.${rod}.CHARGES')}">${pcstring('EQTYPE.Rod.${rod}.CHARGES')}</span>
	</td>
</tr>
</@loop>
		</table>
</#if>-->
<!-- STOP Special Attacks Table --><#--
<#macro consumableRow equip3>
 <#if (equip3 % 2 = 0)><tr bgcolor="#DDDDDD" class="accord10"><#else><tr bgcolor="white" class="accord10"></#if>
        <td class="font7"><b>&nbsp;${pcstring("EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NAME.MAGIC~~</b>")}<input type='button' class='delItem' align='right' value='del'><br />
 <#if (pcstring("EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.SPROP") != "")>
        <font class="font3">(${pcstring('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.SPROP')})</font>
 </#if>
 <#if (pcstring("EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NOTE") != "")>
        <span class="font3">(${pcstring('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NOTE')})</span><br />
 </#if>
 <#assign eqType = pcstring("EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.TYPE")?lower_case />
        </td>
<#if (eqType?contains("consumable") || eqType?contains("potion") || eqType?contains("ammunition"))>
	<#assign totalCharges = pcvar('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.CHECKBOXES')>
<#else>
	<#assign totalCharges = pcvar('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.CHARGES')>
</#if>
	<td class="font7" style="width:8%;"><span class="consumablecont"><input class="consumablebut consumable-add" data-name="${pcstring('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NAME')}" type="button" value="+"></span></td>
	<td class="font7 consumable-data" style="width:9%;text-align:center;" data-name="${pcstring('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NAME')}">${totalCharges}</td>
	<td class="font7" style="width:8%;"><span class="consumablecont"><input class="consumablebut consumable-sub" data-name="${pcstring('EQTYPE.MERGE.ALL.Potion.ADD.Consumable.ADD.Ammunition.ADD.Wand.${equip3}.NAME')}" type="button" value="-"></span></td>
       </tr>
</#macro>-->
<!-- START Consumables Table -->
<#--<table width="100%" cellspacing="0" cellpadding="2" summary="Consumables Table" class="consumableHolder" id="consumable-Table">
	<tr>
		<td bgcolor="black" align="center" class="font8 secHead"><font color="white"><b>CONSUMABLES</b></font></td>
		<td bgcolor="black" colspan=3><div class="cond-but"><input id="itemAdd" type="button" style="width:100%" value="+" align="right"></div></td>
	</tr>
<@loop from=0 to=pcvar("count[EQTYPE.Consumable]+count[EQTYPE.Ammunition]+count[EQTYPE.Wand]-1") ; equip3, equip3_has_next >
	<@consumableRow equip3=equip3 />
</@loop>
</table>-->
<!-- STOP Consumables Table -->