//Ability Counters--------------------------------------------
//Adjust
$( ".abilitybut" ).click(function() {
	console.log("Ability Used");
	var temp = $(this).attr('data-name');
	$(".abilitydisp[data-name*='"+temp+"']").each(function(index){
	console.log("Object Found");
		if (parseInt($(this).text())-1 >= 0) {
			$(this).text(parseInt($(this).text())-1);
			abilityUsed[temp]=$(this).text();
		}else {
			alert("No uses left!");
		}
	});
	saveData();
});
//Reset
$( "#ability-reset" ).click(function( event ) {
	var temp = $(this).attr('data-name');
	$(".abilitydisp").each(function(index){
		$(this).text($(this).attr("data-max"));
	});
	for (var member in abilityUsed) delete abilityUsed[member];
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed");
	saveData();
});