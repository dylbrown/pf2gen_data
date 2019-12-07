			<table summary="Stat Block"> <!-- START Abilities Table -->
				<tr>
					<td align="center" width="20%" class="font3">ABILITY<br />NAME</td>
					<td align="center" width="20%" class="font3">ABILITY<br />SCORE</td>
					<td align="center" width="20%" class="font3">ABILITY<br />MOD</td>
				 </tr>
				<tr>
					<td class="ab"><b>STR</b><br /><font style="font-size:.4rem">Strength</font></td>
					<td class="abb" name="STR">${character.abilityScore.str}</td>
					<td class="abb">${character.abilityMod.str?string.@s}</td>
				</tr>
				<tr>
					<td class="ab"><b>DEX</b><br /><font style="font-size:.4rem">Dexterity</font></td>
					<td class="abb" name="DEX">${character.abilityScore.dex}</td>
					<td class="abb">${character.abilityMod.dex?string.@s}</td>
				</tr>
				<tr>
					<td class="ab"><b>CON</b><br /><font style="font-size:.4rem">Constitution</font></td>
					<td class="abb" name="CON">${character.abilityScore.con}</td>
					<td class="abb">${character.abilityMod.con?string.@s}</td>
				</tr>
				<tr>
					<td class="ab"><b>INT</b><br /><font style="font-size:.4rem">Intelligence</font></td>
					<td class="abb" name="INT">${character.abilityScore.int}</td>
					<td class="abb">${character.abilityMod.int?string.@s}</td>
				</tr>
				<tr>
					<td class="ab"><b>WIS</b><br /><font style="font-size:.4rem">Wisdom</font></td>
					<td class="abb" name="WIS">${character.abilityScore.wis}</td>
					<td class="abb">${character.abilityMod.wis?string.@s}</td>
				</tr>
				<tr>
					<td class="ab"><b>CHA</b><br /><font style="font-size:.4rem">Charisma</font></td>
					<td class="abb" name="CHA">${character.abilityScore.cha}</td>
					<td class="abb">${character.abilityMod.cha?string.@s}</td>
				</tr>
			</table> <!-- STOP Abilities Table -->