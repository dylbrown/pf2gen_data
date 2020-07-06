<!-- START Money Table -->
			<table width="100%" cellspacing="0" cellpadding="3" summary="Money Table">
				<tr>
					<td bgcolor="black" align="center" colspan="2" id="moneyCount"><font color="white" style="font-size: 9pt"><b>MONEY</b></font></td>
					<div id="wealthy">
						<td>
							<input id="gp-add" type="button" value="+" align="right">
						</td>
						<td>
							<input id="gp-sub" type="button" value="-" align="right">
						</td>
					</div>
				</tr>
				<tr>
					<td valign="top" class="border8" align="right"><b>Carried</b></td>
					<td valign="top" class="border8">
						${character.money}
					</td>
					<td valign="top" class="border8" align="right"><b>Items</b></td>
					<td valign="top" class="border8">
						<span id="totalgp" data-max=${character.totalvalue}>${character.totalvalue}</span> sp
					</td>
				</tr>
			</table>
<!-- STOP Money Table -->