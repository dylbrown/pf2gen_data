<!-- START Weight Table -->
				<table width="100%" cellspacing="0" cellpadding="3" summary="Weight Allowance Table">
					<tr>
						<td bgcolor="black" align="center" colspan="8"><font color="white" style="font-size: 9pt"><b>WEIGHT ALLOWANCE</b></font></td>
					</tr>
					<tr>
						<td valign="top" class="border8" align="right"><b>Encumbered</b></td>
						<td valign="top" class="border8">${5 + character.abilityMod.str}</td>
						<td valign="top" class="border8" align="right"><b>Maxiumum</b></td>
						<td valign="top" class="border8">${10 + character.abilityMod.str}</td>
						<td valign="top" class="border8" align="right"><b>Carried</b></td>
						<td valign="top" class="border8">${character.totalweight?floor}</td>
					</tr>
				</table>
<!-- STOP Weight Table -->