//console.log(${character.ac});
if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}") != null) {
	info = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"${character.level}"));
	$("#totalhp").text(info["HP"]);
	$('#totalgp').text(info["GP"]);
	$(".spontaneous .castdata").each(function( index ) {
		if (info["CAST"+$(this).attr("data-level")]) {
			$(this).text(info["CAST"+$(this).attr("data-level")]);
		}
	});
	console.log(info);
}
//Spells---------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spells") != null) {
	spells = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spells"));
	if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spells") == "{}") {
		spells = {};
	}
	$.each(spells,function(index, value){
		console.log("Prepped "+index+"x"+value);
		var t_spn = index;
		var t_obj = $("#Aspell").find(".spelly[data-spn='"+t_spn+"']");
		var t_spl = t_obj.attr('data-spl');
		var t_count = t_obj.parent().find(".sp-count");
		var t_twin = $("#Sspell").find(".spelly[data-spn='"+t_spn+"'] input.sp-count");
		t_count.val(parseInt(value));
		t_twin.val(t_count.val()+"/"+t_count.val());
		t_twin.parent().parent().parent().addClass("prepped");
		t_twin.parent().parent().parent().prev().addClass("prepped");
		t_twin.parent().parent().parent().prev().prev().addClass("prepped");
		t_twin.parent().parent().parent().siblings(".accord5").addClass("prepped");
	});
}
//SpellsUsed------------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed") != null) {
	spellsUsed = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed"));
	if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed") == "{}") {
		spellsUsed = {};
	}
	$.each(spellsUsed,function(index, value){
		console.log("Prepped "+index+"x"+value);
		var t_spn = index;
		var t_obj = $("#Sspell").find(".spelly[data-spn='"+t_spn+"']");
		var t_count = t_obj.parent().find(".sp-count");
		var t_count_array = t_count.val().split("/");
		t_count.val(t_count_array[1]-value);
		t_count.val(t_count.val()+"/"+t_count_array[1]);
	});
}
//AbilityUsed------------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed") != null) {
	abilityUsed = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed"));
	if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed") == "{}") {
		abilityUsed = {};
	}
	$.each(abilityUsed,function(index, value){
		console.log("Set "+index+"x"+value);
		var t_abn = index;
		var t_obj = $(".abilitydisp[data-name*='"+t_abn+"']");
		t_obj.text(value);
	});
}
updateCounters();
//Character Sheet Base Conditions
baseconds = [["AC", "Armor", 0, "Base"], ["AC", "Enhancement (Armor)", 0, "Base"], ["AC", "Natural", 0 - 0, "Base"], ["AC", "Enhancement (Natural)", 0, "Base"], ["AC", "Shield", 0, "Base"], ["AC", "Enhancement (Shield)", 0, "Base"], ["AC", "Deflection", 0, "Base"], ["AC", "Dodge", 0, "Base"], ["AC", "Size", 0, "Base"], ["AC", "Misc", 0, "Base"]];
for (var index in baseconds) {
	if (typeof attr_current[baseconds[index][0]] !== 'object') {
		attr_current[baseconds[index][0]] = {};
	}
	if (typeof attr_current[baseconds[index][0]][baseconds[index][1]] !== 'object') {
		attr_current[baseconds[index][0]][baseconds[index][1]] = [];
	}
	attr_current[baseconds[index][0]][baseconds[index][1]][0]={};
	attr_current[baseconds[index][0]][baseconds[index][1]][0]["mod"] = baseconds[index][2];
	attr_current[baseconds[index][0]][baseconds[index][1]][0]["source"] = baseconds[index][3];
}
$(".STR-roll-OH, .STR-roll-2H").each(function (){
	$(this).prop("data-str", parseInt($("[name='STR'].ability").html()));
})
//Conditions------------------------------------------------------
function addLayer (branch, row_container, path) {
	//console.log("AddLayer")
	//loggy("Branch: ", branch);
	//console.log(row_container);
	//loggy("Path: ", path);
	for (var index_t in branch) {
		if (typeof branch[index_t] == 'string'){
			var key = branch[index_t];
			var value = conditions[key];
			console.log("Set "+key+" to "+value);
			if (value["switch"]){
				include_attrs (key, value["attr"])
			}
			row_container.append(condRow(key, value["rounds"], index_t, path));
		} else {
			row_container.append(folderRow(branch[index_t]["name"], index_t, path));
			addLayer(branch[index_t]["contents"], row_container.children(":last").children("td").children("table").children("tbody"), (path+"`"+branch[index_t]["name"]));
		}
	};
}
if (localStorage.getItem("saveData"+"${character.name}"+"conditions") != null) {
	console.log("conditions detected");
	conditions = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"conditions"));
	conditionsIndex = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"conditionsIndex"));
	if (localStorage.getItem("saveData"+"${character.name}"+"conditions") == "{}") {
		conditions = {};
	}
	addLayer(conditionsIndex, $("#sortable1Root"), "");
}
enable_drag();
//Round Counters------------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"roundCounters") != null) {
	console.log("counter detected");
	roundCounters = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"roundCounters"));
	roundDesc = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"roundDesc"));
	if (localStorage.getItem("saveData"+"${character.name}"+"roundCounters") == "{}") {
		roundCounters = {};
	}
	if (localStorage.getItem("saveData"+"${character.name}"+"roundDesc") == "{}") {
		roundDesc = {};
	}
	$.each(roundCounters,function(index, value){
		console.log("Set "+index+" to "+value);
		$(".counterHolder").append(counterRow(index, value));
	});
}
//Equipment Table------------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"addedItems") != null) {
	addedItems = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"addedItems"));
	if (localStorage.getItem("saveData"+"${character.name}"+"addedItems") == "{}") {
		addedItems = {};
	}
	$.each(addedItems,function(index, value){
		console.log("Set "+index+" to "+value);
		$("#consumable-Table").append(consumableRow(index, value));
	});
}
//Consumables--------------------------------------------------------
if (localStorage.getItem("saveData"+"${character.name}"+"consumables") != null) {
	consumables = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"consumables"));
	if (localStorage.getItem("saveData"+"${character.name}"+"consumables") == "{}") {
		consumables = {};
	}
	$.each(consumables,function(index, value){
		console.log("Set "+index+" to "+value);
		$(".consumable-data[data-name='"+index+"']").html(value);
	});
}
//Spells -- Remove Apostrophe
$( "#Aspell .sp-add" ).each(function(){
	var t_spn = $(this).parent().attr('data-spn');
	$(this).parent().attr('data-spn', t_spn.replace("'", ""));
});
$( "#Sspell .sp-add" ).each(function(){
	var t_spn = $(this).parent().attr('data-spn');
	$(this).parent().attr('data-spn', t_spn.replace("'", ""));
});
// Ability Displays and Handlers
var stats_names = ["STR", "DEX", "CON", "INT", "WIS", "CHA"];
var stats_names_long = ["Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"];
for (var index in stats_names) {
	ability_change(stats_names_long[index], parseInt(info[stats_names[index]]));
}
fixStriping();
//Show When Ready
$(document.getElementsByTagName("html")[0]).css("visibility","visible");
//Color Prep Accordions