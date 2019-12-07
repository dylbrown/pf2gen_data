//Reset Cast
$("#resetUsed > i").click(function(){
console.log("Resetting Used Spells...");
	spellsUsed = {};
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed");
	console.log("Reset Used Spells");
	if (localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spells") != null) {
	spells = JSON.parse(localStorage.getItem("saveData"+"${character.name}"+"${character.level}"+"spells"));
	$.each(spells,function(index, value){
		console.log("Prepped "+index+"x"+value);
		var t_spn = index;
		var t_obj = $("#Aspell").find(".spelly[data-spn='"+t_spn+"']");
		var t_spl = t_obj.attr('data-spl');
		var t_count = t_obj.parent().find(".sp-count");
		var t_twin = $("#Sspell").find(".spelly[data-spn='"+t_spn+"'] input.sp-count");
		t_count.val(parseInt(value));
		t_twin.val(t_count.val()+"/"+t_count.val());
		var t_addPrepped = t_twin.parent().parent().parent();
		t_addPrepped = t_addPrepped.add(t_addPrepped.prev()).add(t_addPrepped.prev().prev()).add(t_addPrepped.siblings(".accord5"));
		t_addPrepped.addClass("prepped");
	});
	for(i = 0; i < 10; i++) {
		delete info["USED"+i];
	}
	saveData();
	updateCounters();
}
});
//Spontaneous Spell Counters-----------------------------------------------
//Adjust
$( ".spontaneous .castbut" ).click(function() {
	console.log("Spell Cast");
	var temp = $(this).attr('class').split(' ')[1];
	$(".castdata" + temp.substr(temp.length -1)).each(function(index){
		if (parseInt($(this).text())-1 >= 0) {
			$(this).text(parseInt($(this).text())-1);
		}else {
			alert("All Spells Used!");
		}
	});
	saveData();
});
//Reset
$( ".spontaneous .spellreset" ).click(function( event ) {
	console.log($(this).attr('class').split(' ')[1]);
	var temp = $(this).attr('class').split(' ')[1];
	console.log(".castdata" + temp.substr(temp.length -1));
	$(".castdata").each(function(index){
		$(this).text($(this).attr("data-max"));
	});
	saveData();
});
//Use/Prep Counters--------------------------------------------
//Use
$( "#Sspell .sp-add" ).click(function() {
	var t_count = $(this).parent().find(".sp-count");
	var t_spn = $(this).parent().attr('data-spn');
	var t_spl = $(this).parent().attr('data-spl');
	var t_count_array = t_count.val().split("/");
	if(parseInt(t_count_array[0]) < parseInt(t_count_array[1])) {
		t_count.val((parseInt(t_count_array[0])+1));
		t_count.val(t_count.val()+"/"+t_count_array[1]);
		console.log("Spell unCast");
		info["USED"+t_spl] -= 1;
		spellsUsed[t_spn] -= 1;
		if (info["USED"+t_spl] == 0) {
			delete info["USED"+t_spl];
			delete spellsUsed[t_spn];
		}
	}
	updateCounters();
	saveData();
});
$( "#Sspell .sp-sub" ).click(function() {
	var t_count = $(this).parent().find(".sp-count");
	var t_spn = $(this).parent().attr('data-spn');
	var t_spl = $(this).parent().attr('data-spl');
	var t_count_array = t_count.val().split("/");
	if(parseInt(t_count_array[0]) > 0) {
		t_count.val((parseInt(t_count_array[0])-1));
		t_count.val(t_count.val()+"/"+t_count_array[1]);
		console.log("Spell Cast");
		if(!info.hasOwnProperty("USED"+t_spl)) {
			info["USED"+t_spl] = 1;	
		}else{
			info["USED"+t_spl] += 1;
		}
		if(!spellsUsed.hasOwnProperty(t_spn)) {
			spellsUsed[t_spn] = 1;
		}else{
			spellsUsed[t_spn] += 1;
		}
	}
	updateCounters();
	saveData();
});

//Prep
$( "#Aspell .sp-add" ).click(function() {
	console.log("Prepped Spell");
	var t_spn = $(this).parent().attr('data-spn');
	var t_spl = $(this).parent().attr('data-spl');
	var t_count = $(this).parent().find(".sp-count");
	var t_twin = $("#Sspell").find(".spelly[data-spn='"+t_spn+"'] input.sp-count");
	var t_twinVal = t_twin.val().split("/");
	t_count.val(parseInt(t_count.val())+1);
	t_twin.val((parseInt(t_twinVal[0])+1)+"/"+t_count.val());
	var t_addPrepped = t_twin.parent().parent().parent();
	t_addPrepped = t_addPrepped.add(t_addPrepped.prev()).add(t_addPrepped.prev().prev()).add(t_addPrepped.siblings(".accord5"));
	t_addPrepped.addClass("prepped");
	fixStriping();
	
	if (info["PREP"+t_spl] >= 0) {
		info["PREP"+t_spl] += 1;
	}else{
		info["PREP"+t_spl] = 1;
	}
	if (spells[t_spn] >= 0) {
		spells[t_spn] += 1;
	}else{
		spells[t_spn] = 1;
	}
	if (info["PREP"+t_spl] <= $(".memorized .castdata"+t_spl).attr("data-max") || !(info.hasOwnProperty("PREP"+t_spl))) {
	}else{
		alert("All Level "+t_spl+" Spells Prepped Already")
	}
	updateCounters();
	saveData();
});
$( "#Aspell .sp-sub" ).click(function() {
	console.log("unPrepped Spell");
	var t_spn = $(this).parent().attr('data-spn');
	var t_spl = $(this).parent().attr('data-spl');
	var t_count = $(this).parent().find(".sp-count");
	var t_twin = $("#Sspell").find(".spelly[data-spn='"+t_spn+"'] input.sp-count");
	var t_twinVal = t_twin.val().split("/");
	var t_addPrepped = t_twin.parent().parent().parent();
		t_addPrepped = t_addPrepped.add(t_addPrepped.prev()).add(t_addPrepped.prev().prev());
	if(parseInt(t_count.val()) <= 1) {
		t_count.val(0);
		t_addPrepped.removeClass("prepped");
		fixStriping();
	}else{
		t_count.val(parseInt(t_count.val())-1);
	}
	t_twin.val(Math.max((parseInt(t_twinVal[0])-1), 0)+"/"+t_count.val());
	if (info["PREP"+t_spl] > 1) {
		info["PREP"+t_spl] -= 1;
	}else{
		delete info["PREP"+t_spl];
	}
	if (spells[t_spn] > 1) {
		spells[t_spn] -= 1;
	}else{
		delete spells[t_spn];
		delete spellsUsed[t_spn];
	}
	if (info["USED"+t_spl] > 0 && spellsUsed[t_spn] > 0) {
		info["USED"+t_spl] -= 1;
	}
	if (spellsUsed[t_spn] > spells[t_spn]) {
		spellsUsed[t_spn] = spells[t_spn];
	}
	if(!info.hasOwnProperty("PREP"+t_spl)) {
			t_twin.parent().parent().parent().siblings(".accord5").removeClass("prepped");
	}
	updateCounters();
	saveData();
});

//Update Memorized Counters--------------------------------------------
	function updateCounters (){
		var AspCounters = $("#Aspell .prepdata");
		var SspCounters = $("#Sspell .prepdata");
		$.each(AspCounters, function(){
			var t_spl = $(this).attr("data-level");
			if (!info.hasOwnProperty("PREP"+t_spl)) {
				var t_val = 0+"/"+0;
			}else if(!info.hasOwnProperty("USED"+t_spl)){
				var t_val = info["PREP"+t_spl]+"/"+info["PREP"+t_spl];
			}else{
				var t_calc = info["PREP"+t_spl] - info["USED"+t_spl];
				if (t_calc < 0) {t_calc = 0;};
				var t_val = t_calc+"/"+info["PREP"+t_spl];
			}
			$(this).html(t_val);
		});
		$.each(SspCounters, function(){
			var t_spl = $(this).attr("data-level");
			if (!info.hasOwnProperty("PREP"+t_spl)) {
				var t_val = 0+"/"+0;
			}else if(!info.hasOwnProperty("USED"+t_spl)){
				var t_val = info["PREP"+t_spl]+"/"+info["PREP"+t_spl];
			}else{
				var t_calc = info["PREP"+t_spl] - info["USED"+t_spl];
				if (t_calc < 0) {t_calc = 0;};
				var t_val = t_calc+"/"+info["PREP"+t_spl];
			}
			$(this).html(t_val);
		});
	}
	
	function fixStriping() {
		var i=1;
		$(".ssp-table .prepped").not("accord5").each(function(){
			if((i % 6) < 3)
				$(this).css("background-color", "white");
			else
				$(this).css("background-color", "#DDDDDD");
			i++;
		});
	}