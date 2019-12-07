<script type="text/javascript">
function loggy(label,thingy){
	console.log(label+JSON.stringify(thingy));
}
var state = 0;
var oldfactor = 1;
var exactcalc = 0;
attr = {};
stats = {};
attr_current = {};
info = {
        HP: ${character.hp},
		GP: ${character.money},
		/*  Spell Cast
        CASTx
			Spell Prep
		PREPx
			Spell PrepCast
		USEDx
		*/
		STR:0,
		DEX:0,
		CON:0,
		INT:0,
		WIS:0,
		CHA:0,
    }
spells = {
}
spellsUsed = {
}
abilityUsed = {
}
roundCounters = {
}
roundDesc = {
}
conditions = {};
conditionsIndex = [];
consumables = {
}
addedItems = {
}
<#include "/JQuery/scripts/row-gen.js">
<#include "/JQuery/scripts/attr-functions.js">

$(document).ready(function() {
	<#include "/JQuery/scripts/startup.js">
	<#include "/JQuery/scripts/page-control.js">
	<#include "/JQuery/scripts/spell-handlers.js">
	<#include "/JQuery/scripts/condition-handlers.js">
	<#include "/JQuery/scripts/sorting-handlers.js">
	<#include "/JQuery/scripts/consumable-handlers.js">
	<#include "/JQuery/scripts/ability-round-counters.js">
	<#include "/JQuery/scripts/hp-gp.js">
	<#include "/JQuery/scripts/accordions.js">
	//Calculate Ability Mods
	$(".ability").change(function(){
		var new_val = $(this).val();
		var val_change = $(this).val() - parseInt(stats[$(this).prop("name")]);
		info[$(this).prop("name")] += val_change;
		$(this).val(stats[$(this).prop("name")]);
		ability_change(stats_names_long[stats_names.indexOf($(this).prop("name"))], val_change);
		stats[$(this).prop("name")] = new_val;
		saveData();
	});
	function isNumeric(n){
		return !isNaN(parseFloat(n)) && isFinite(n);
	}
	
	//Blood Money Adjustment
	$("b:contains('Blood Money')").parent().parent().find(".sptab1").html("You cut one of your hands, releasing a stream of blood that causes you to take 1d6 points of damage. When you cast another spell in that same round, your blood temporarily transforms into one material component required by that spell. Creating valuable material components requires an additional cost of 1 point of Strength damage, plus a further point of damage for every full 500 gp (0-499=1, 500-999=2).");
	
	//Save Data
	function saveData (){
		$(".spontaneous .castdata").each(function( index ) {
			info["CAST"+$(this).attr("data-level")] = parseInt($(this).text());
		});
		
		localStorage.setItem("saveData"+"${character.name}"+"${character.level}", JSON.stringify(info));
		if(spells != null) {
			localStorage.setItem("saveData"+"${character.name}"+"${character.level}"+"spells", JSON.stringify(spells));
		}
		if(spellsUsed != null) {
			localStorage.setItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed", JSON.stringify(spellsUsed));
		}
		if(abilityUsed != null) {
			localStorage.setItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed", JSON.stringify(abilityUsed));
		}
		if(roundCounters != null) {
			localStorage.setItem("saveData"+"${character.name}"+"roundCounters", JSON.stringify(roundCounters));
		}
		if(roundDesc != null) {
			localStorage.setItem("saveData"+"${character.name}"+"roundDesc", JSON.stringify(roundDesc));
		}
		if(conditions != null) {
			localStorage.setItem("saveData"+"${character.name}"+"conditions", JSON.stringify(conditions));
			localStorage.setItem("saveData"+"${character.name}"+"conditionsIndex", JSON.stringify(conditionsIndex));
		}
		if(consumables != null) {
			localStorage.setItem("saveData"+"${character.name}"+"consumables", JSON.stringify(consumables));
		}
		if(addedItems != null)  {
			localStorage.setItem("saveData"+"${character.name}"+"addedItems", JSON.stringify(addedItems));
		}
	}
	
});
</script>