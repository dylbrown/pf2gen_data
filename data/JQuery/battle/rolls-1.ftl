<table width="100%" height="100%">
	<tr>
		<td align="center" bgcolor="black" class="font8"><font color="white"><b>AC</b></font></td>
		<td align="center" class="border9"><b class="AC DEX-mod">${character.ac}</b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="black" class="font7"><font color="white"><b>FORTITUDE</b></font></td>
		<td align="center" name="${character.attributes.fortitude.total?string.@s}" class="border10"><b class="CON-roll Fortitude">${character.attributes.fortitude.total?string.@s}</b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="black" class="font7"><font color="white"><b>REFLEX</b></font></td>
		<td align="center" name="${character.attributes.reflex.total?string.@s}" class="border10"><b class="DEX-roll Reflex">${character.attributes.reflex.total?string.@s}</b></td>
	</tr>
	<tr>
		<td align="center" bgcolor="black" class="font7"><font color="white"><b>WILL</b></font></td>
		<td align="center" name="${character.attributes.will.total?string.@s}" class="border10"><b class="WIS-roll Will">${character.attributes.will.total?string.@s}</b></td>
</table>