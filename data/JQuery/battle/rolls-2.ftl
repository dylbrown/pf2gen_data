<table width="100%" height="100%">
	<tr>
		<td align="center" bgcolor="black" class="font8"><font color="white"><b>SHIELD</b></font></td>
		<td align="center" class="border9"><b>
		<#if (character.getSlot[Slot.PrimaryHand])?? && Shield.isInstance(character.getSlot[Slot.PrimaryHand].stats)>
			${character.getSlot[Slot.PrimaryHand].stats.ac?string.@s}
		<#elseif (character.getSlot[Slot.OffHand])?? && Shield.isInstance(character.getSlot[Slot.OffHand].stats)>
			${character.getSlot[Slot.OffHand].stats.ac?string.@s}
		</#if>
		</td>
	</tr>
	<tr>
		<td align="center" bgcolor="black"  class="font7"><font color="white"><b>PERCEPTION</b></font></td>
		<td align="center" class="border10"><b class="DEX-roll">${character.attributes.perception.total?string.@s}</b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="black" class="font7"><font color="white"><b>STR ATTACK</b></font></td>
		<td align="center" class="border10 melee" style="line-height:.6" name="${character.abilityMod.str + character.level + 2}"><b class="STR-roll tohit">${(character.abilityMod.str + character.level + 2)?string.@s}</b><span class="font4"><br>Trained</span></td>
	</tr>
	<tr>
		<td align="center" bgcolor="black" class="font7"><font color="white"><b>DEX ATTACK</b></font></td>
		<td align="center" class="border10 ranged" style="line-height:.6" name="${character.abilityMod.dex + character.level + 2}"><b class="DEX-roll tohit">${(character.abilityMod.dex + character.level + 2)?string.@s}</b><span class="font4"><br>Trained</span></td>
	</tr>
</table>