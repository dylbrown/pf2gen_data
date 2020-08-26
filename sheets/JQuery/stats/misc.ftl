			<table width="100%" summary="Misc Table">
				<tr height="20%">
					<td align="center"></td>
					<td align="center" class="font7">TOTAL</td>
					<td align="center"></td>
					<td align="center" class="font5">DEX<br />MOD</td>
					<td align="center" class="font5">MISC<br />MOD</td>
				</tr>
				<tr height="40%">
					<td align="center" bgcolor="black"  class="font3"><font color="white"><b>INITIATIVE</b></font><font color="white"><br />Modifier</font></td>
					<td align="center" class="border9"><b class="DEX-roll">${pcstring('INITIATIVEMOD')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b class="DEX-roll">${pcstring('STAT.1.MOD')}</b></td>
					<td align="center" class="border9"><b>${pcstring('INITIATIVEBONUS')}</b></td>
				</tr>
				<tr height="40%">
					<td align="center" bgcolor="black" class="font3"><font color="white"><b>BASE ATTACK</b></font><font color="white"><br />Bonus</font></td>
					<td align="center" class="border10"><b>${pcstring('ATTACK.MELEE')}<br /></b></td>
						<td align="center" class="font7"></td>
					<td align="center" bgcolor="black" class="font3"><font color="white"><b>Concentration</b></font><font color="white"><br />Bonus</font></td>
					<td align="center" class="border10"><b class="${pcstring('SPELLLISTDCSTAT.0')}${pcstring('SPELLLISTDCSTAT.1')}-mod">${pcstring('SPELLLISTCLASS.0.CONCENTRATION')}${pcstring('SPELLLISTCLASS.1.CONCENTRATION')}<br /></b></td>
				</tr>
			</table><!-- STOP Misc Table -->