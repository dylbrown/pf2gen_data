<#assign class=1>
<#if character.casterType == CasterType.Prepared>
<!-- START Spell list Header Table (Known) -->
		<div class="asp-table memorized">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
				<tr>
					<td bgcolor="black" class="sptop" width="5%"><b>LEVEL</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td bgcolor="black" class="sptop"><b>${level}</b></td>
</#list>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>Per Day</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td class="sptab"><div class="countcont"><div class="castdata castdata${level}" data-level=${level} data-max="${character.spellSlots[level]}">${character.spellSlots[level]}</div></div></td>
</#list>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>Uncast/Prepped</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td class="sptab"><div class="countcont"><div class="prepdata prepdata${level}" data-level=${level} data-max="${character.spellSlots[level]}">0/0</div></div></td>
</#list>
				</tr>
			</table>
		</div>
<#else>
<!-- START Spell list Header Table (Known) -->
		<div class="asp-table spontaneous">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
				<tr>
					<td bgcolor="black" class="sptop" width="5%"><b>LEVEL</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td bgcolor="black" class="sptop"><b>${level}</b></td>
</#list>
					<td bgcolor="black" class="sptop" width="5%"><b></b></td>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>PER DAY</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td class="sptab"><div class="countcont "><div class="castdata castdata${level}" data-level=${level} data-max="${character.spellSlots[level]}">${character.spellSlots[level]}</div></div></td>
</#list>
					<td class="sptab" rowspan="2" style="vertical-align:middle; padding:0px 2px;"><input class="spellreset spellreset${class}"type="button" value="Reset"></td>
				</tr>
				<tr bgcolor="#DDDDDD">
					<td class="sptab font8" style="vertical-align:middle;color:black;"><b>CAST</b></td>
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
					<td class="sptab"><div class="castcont"><input class="castbut castbut${level}" type="button" value="-"></div></td>
</#list>
				</tr>
			</table>
		</div>
<!-- End Spell List Header Table (Known) -->
</#if>
<!-- Start Known Spells -->
		<div class="asp-table asp-accord">
			<table width="100%" cellspacing="0" cellpadding="2" summary="Spell List">
<#list (0..10)?filter(l -> character.spellSlots[l] > 0) as level>
<#if (character.spellSlots[level] > 0)>
				<tbody>
					<tr class="accord3">
						<td colspan="10" class="splevel"><b>LEVEL ${level}</b></td>
					</tr>
<#list character.spellsKnown[level] as spell>
<#if spell?is_even_item><tr class="accord4 evenRow"><#else><tr class="accord4 oddRow"></#if>
						<td class="spname" <#if character.casterType == CasterType.Spontaneous>colspan="2"</#if>><b>${spell.name}</b><br /></td>
						<td align="right">
						<#if spell.castTime != "">${spell.castTime} (</#if>
						<#list spell.cast as component>${component[0]}<#sep> </#sep></#list>
						<#if spell.castTime != "">)</#if>
						<br /></td>
<#if character.casterType == CasterType.Prepared>
						<td align="center" class="sptab2 spellyparent"><div class="spelly" data-spl=${level} data-spn="${spell.name}"><input class="sp-add" type="button" value="+"><input class="sp-count" type="number" name="change" min="0" value=0 disabled><input class="sp-sub" type="button" value="-"></div></td>
</#if>
					</tr>	
<#if spell?is_even_item><tr class="evenRow"><#else><tr class="oddRow"></#if>
						<td class="sptab" colspan="3"><#if spell.duration != ""><i>Dur:</i> ${spell.duration}&nbsp;&nbsp;</#if>
						<#if spell.range != ""><i>Rng:</i> ${spell.range}&nbsp;&nbsp;</#if>
						<#if spell.area != ""><i>Area:</i> ${spell.area}&nbsp;&nbsp;</#if>
						<#if spell.targets != ""><i>Targets:</i> ${spell.targets}&nbsp;&nbsp;</#if>
						<div style="display:inline-block"><i>Traits:</i> <#list spell.traits as trait>${trait}<#sep>, </#sep></#list></div></td>
					</tr>
<#if spell?is_even_item><tr class="evenRow"><#else><tr class="oddRow"></#if>
						<td class="spDesc" colspan="3" align="left">${spell.description?replace("\n", "<br/>")}</td>
					</tr>
</#list>
				</tbody>
</#if>
</#list>
			</table>
		</div>
<!-- ================================================================ -->