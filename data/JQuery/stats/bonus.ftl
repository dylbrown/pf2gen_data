			<table width="100%" summary="Roll Bonus Table">
				<tr height="10%" class="font3">
					<td align="center" width="50"></td>
					<td align="center" width="25">TOTAL</td>
					<td align="center" width="10"></td>
					<td align="center" width="25">BAB</td>
					<td align="center" width="25">STAT</td>
					<td align="center" width="25">SIZE</td>
					<td align="center" width="25">EPIC</td>
					<td align="center" width="25">MISC</td>
					<td align="center" width="50"></td>
					<td align="center" width="25">TOTAL</td>
					<td align="center" width="10"></td>
					<td align="center" width="25">BAB</td>
					<td align="center" width="25">STAT</td>
					<td align="center" width="25">SIZE</td>
					<td align="center" width="25">EPIC</td>
					<td align="center" width="25">MISC</td>
				</tr>
				<tr height="45%">
					<td align="center" bgcolor="black"><font style="font-size:.3rem" color="white"><b>MELEE</b></font><font style="font-size:.1rem" color="white"><br />ATTACK BONUS</font></td>
					<td align="center" class="border9 melee" name="${pcstring('ATTACK.MELEE.TOTAL')}"><b>${pcstring('ATTACK.MELEE.TOTAL')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b class="STR-mod">${pcstring('ATTACK.MELEE')}<br /></b></td>
					<td align="center" class="border9"><b class="STR-mod">${pcstring('ATTACK.MELEE.STAT')}</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.MELEE.SIZE')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.MELEE.EPIC')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.MELEE.MISC')}<br /></b></td>
<#if (pcvar("VAR.UseCombatManueverBonus") = 1)>
					<td align="center" bgcolor="black"><font style="font-size:.3rem" color="white"><b>CMB</b></font><font style="font-size:.1rem" color="white"><br />ATTACK BONUS</font></td>
					<td align="center" class="border9 CMB" name="${pcstring('VAR.CMB.INTVAL.SIGN')}"><b class="STR-mod">${pcstring('VAR.CMB.INTVAL.SIGN')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.MELEE.BASE')}<br /></b></td>
					<td align="center" class="border9"><b class="STR-mod">${pcstring('VAR.CMB_STAT.INTVAL.SIGN')}</b></td>
					<td align="center" class="border9"><b>${pcstring('VAR.CM_SizeMod.INTVAL.SIGN')}<br /></b></td>
					<td align="center" class="border9"><b>+0<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('VAR.CMB.INTVAL.SIGN - ATTACK.MELEE.BASE - VAR.CMB_STAT - VAR.CM_SizeMod.INTVAL')}<br /></b></td>
<#else>
					<td align="center" bgcolor="black"><font style="font-size:.3rem" color="white"><b>GRAPPLE</b></font><font style="font-size:.1rem" color="white"><br />ATTACK BONUS</font></td>
					<td align="center" class="border9 grapple" name="${pcstring('ATTACK.GRAPPLE.TOTAL')}"><b class="STR-mod">${pcstring('ATTACK.GRAPPLE.TOTAL')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.GRAPPLE')}<br /></b></td>
					<td align="center" class="border9"><b class="STR-mod">${pcstring('ATTACK.GRAPPLE.STAT')}</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.GRAPPLE.SIZE')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.GRAPPLE.EPIC')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.GRAPPLE.MISC')}<br /></b></td>
</#if>
				</tr>
				<tr height="45%">
					<td align="center" bgcolor="black"><font style="font-size:.3rem" color="white"><b>RANGED</b></font><font style="font-size:.1rem" color="white"><br />ATTACK BONUS</font></td>
					<td align="center" class="border9 ranged" name="${pcstring('ATTACK.RANGED.TOTAL')}"><b class="DEX-mod">${pcstring('ATTACK.RANGED.TOTAL')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.RANGED')}<br /></b></td>
					<td align="center" class="border9"><b class="DEX-mod">${pcstring('ATTACK.RANGED.STAT')}</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.RANGED.SIZE')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.RANGED.EPIC')}<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.RANGED.MISC')}<br /></b></td>
					<td align="center" bgcolor="black"><font style="font-size:.3rem" color="white"><b>CMD</b></font><font style="font-size:.1rem" color="white"><br />ATTACK BONUS</font></td>
					<td align="center" class="border9 CMD" name="${pcstring('VAR.CMD.INTVAL.SIGN')}"><b class="STR-mod DEX-mod">${pcstring('VAR.CMD.INTVAL')}</b></td>
					<td align="center" class="font7"><b>=</b></td>
					<td align="center" class="border9"><b>${pcstring('ATTACK.MELEE.BASE')}<br /></b></td>
					<td align="center" class="border9"><b class="STR-mod DEX-mod">${pcstring('VAR.CMD_STAT.INTVAL.SIGN')}</b></td>
					<td align="center" class="border9"><b>${pcstring('VAR.CM_SizeMod.INTVAL.SIGN')}<br /></b></td>
					<td align="center" class="border9"><b>+0<br /></b></td>
					<td align="center" class="border9"><b>${pcstring('VAR.CMD.INTVAL.SIGN - ATTACK.MELEE.BASE - VAR.CMD_STAT.INTVAL - VAR.CM_SizeMod.INTVAL')}<br /></b></td>
				</tr>
			</table><!-- STOP Melee and Range Attack Table -->