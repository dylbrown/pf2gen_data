	<!-- START Saving Throws Table -->
		   <table width="100%" summary="Saving Throws">
				<tr>
					<td align="center" width="30" class="font3">SAVING THROWS</td>
					<td align="center" width="25" class="font3">TOTAL</td>
					<td align="center" width="10"></td>
					<td align="center" width="25" class="font3">PROF.</td>
					<td align="center" width="10"></td>
					<td align="center" width="25" class="font3">ABILITY</td>
				</tr>
				<tr>
					<td align="center" bgcolor="black" class="font7"><font color="white"><b>Fortitude</b></font><font style="font-size:.2rem" color="white"><br />(Constitution)</font></td>
					<td align="center" name="${character.attributes.fortitude.total?string.@s}" class="border7"><b class="Fortitude CON-roll">${character.attributes.fortitude.total?string.@s}</b></td>
					<td align="center" class="font3"><b>=</b></td>
					<td align="center" class="border7"><b>${(character.attributes.fortitude.total - character.abilityMod.con)?string.@s}</b></td>
					<td align="center" class="font3"><b>+</b></td>
					<td align="center" class="border7"><b class="CON-roll">${character.abilityMod.con?string.@s}</b></td>
				</tr>
				<tr>
					<td align="center" bgcolor="black" class="font7"><font color="white"><b>Reflex</b></font><font style="font-size:.2rem" color="white"><br />(Dexterity)</font></td>
					<td align="center" name="${character.attributes.reflex.total?string.@s}" class="border7"><b class="Reflex DEX-roll">${character.attributes.reflex.total?string.@s}</b></td>
					<td align="center" class="font3"><b>=</b></td>
					<td align="center" class="border7"><b>${(character.attributes.reflex.total - character.abilityMod.dex)?string.@s}</b></td>
					<td align="center" class="font3"><b>+</b></td>
					<td align="center" class="border7"><b class="DEX-roll">${character.abilityMod.dex?string.@s}</b></td>
				</tr>
				<tr>
					<td align="center" bgcolor="black" class="font7"><font color="white"><b>Will</b></font><font style="font-size:.2rem" color="white"><br />(Wisdom)</font></td>
					<td align="center" name="${character.attributes.will.total?string.@s}" class="border7"><b class="Will WIS-roll">${character.attributes.will.total?string.@s}</b></td>
					<td align="center" class="font3"><b>=</b></td>
					<td align="center" class="border7"><b>${(character.attributes.will.total - character.abilityMod.wis)?string.@s}</b></td>
					<td align="center" class="font3"><b>+</b></td>
					<td align="center" class="border7"><b class="WIS-roll">${character.abilityMod.wis?string.@s}</b></td>
				</tr>
			</table>
			</table><!-- STOP Saving Throws Table -->