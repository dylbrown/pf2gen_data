<table summary="Hit Point Table" width="80%" height="100%"> <!-- START -->
	<tr>
		<td align="center" width="50"></td>
		<td align="center" width="25" valign="bottom"></td>
		<td align="center" width="100" class="font5">HP</td>
		<td align="center" width="50" class="font5">SUBDUAL</td>
		<td align="center" width="75" class="font5">SPEED</td>
	</tr>
	<tr>
		<td align="center" bgcolor="black"><font style="font-size:9pt" color="white"><b>HP</b></font>
		<font style="font-size:5pt" color="white"><br />Hit Points</font></td>
		<td align="center" class="border9"><span id="totalhp" data-max=${character.hp}>${character.hp}</span><br><font style="font-size:.4rem" id="inithp">/${character.hp}</font></td>
		<td align="center" class="border9" id="dmgcount"><div id="healthy"><input id="hp-add" type="button" value="+"><input id="hp-mod" type="number" name="change" min="0"><input id="hp-sub" type="button" value="-"></div></td>
		<td align="center" class="border9"><input style="width:45px" type="number" min="0" name="subdual"></td>
		<td align="center" class="border7">
			${character.speed} ft.
		</td>
	</tr>
</table> <!-- STOP Hit Point Table -->
<div id="round-count"><i class='ra ra-stopwatch'></i></div>