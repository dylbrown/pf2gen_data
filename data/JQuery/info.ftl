		<div class="d-cont"><table class="d-table" cellpadding="0" cellspacing="0" height="100%" width="100%" border="0" summary="Character Info">
		<tr>
		  <td colspan="2" class="info-item font9">${character.qualities.name}</td>
		  <td colspan="2" class="info-item font9">${character.qualities.player}</td>
		  <td colspan="1" class="info-item font9">Lawful Neutral</td>
		</tr>
		<tr>
			<td colspan="2" class="topline">CHARACTER NAME</td>
			<td colspan="2" class="topline">PLAYER</td>
			<td colspan="1" class="topline">ALIGNMENT</td>
		</tr>
		<tr>
			<td colspan="1" class="info-item font9">TODO:DEITY</td>
			<td colspan="1" class="info-item font9">${character.pclass.name}</td>
			<td colspan="2" class="info-item font9">${character.ancestry.name} <#list character.abilities as ability>
				<#if ability.type == "Heritage"> ${ability.name}</#if>
			</#list></td>
			<td class="info-item font9">${character.ancestry.size}</td>
		</tr>
		<tr>
			<td colspan="1" class="topline">DEITY</td>
			<td colspan="1" class="topline">CLASS</td>
			<td colspan="2" class="topline">ANCESTRY</td>
			<td class="topline">SIZE</td>
		</tr>
		<tr>
			<td class="info-item font9">${character.qualities.height}</td>
			<td class="info-item font9">${character.qualities.weight}</td>
			<td colspan="3" class="info-item font9">TODO:VISION</td>
		</tr>
		<tr>
			<td class="topline">HEIGHT</td>
			<td class="topline">WEIGHT</td>
			<td colspan="3" class="topline">VISION</td>
		</tr>
		<tr>
			<td class="info-item font9">${character.qualities.age}</td>
			<td class="info-item font9">${character.qualities.gender}</td>
			<td class="info-item font9">${character.qualities.eyes}</td>
			<td class="info-item font9">${character.qualities.hair}</td>
			<td class="info-item font9">${character.level}</td>
		</tr>
		<tr>
			<td class="topline">AGE</td>
			<td class="topline">GENDER</td>
			<td class="topline">EYES</td>
			<td class="topline">HAIR</td>
			<td class="topline">LEVEL</td>
		</tr>
		</table></div>