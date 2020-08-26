<script type="text/javascript">
var state = 0;
var oldfactor = 1;
var exactcalc = 0;
info = {
        HP: ${pcstring('HP')},
		/*  Spell Cast
        CASTx
			Spell Prep
		PREPx
			Spell PrepCast
		USEDx
		*/
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
consumables = {
}
function counterRow (name_t, count_t) {
	str_t = "";
	if (Object.keys(roundCounters).length % 2 == 0) {
	str_t += "<tr bgcolor='#DDDDDD'>";
	}else{
	str_t += "<tr bgcolor='white'>";
	}
	str_t +=	"<td valign='top' class='font8'><b>"+name_t
	str_t +=		"</b></td>"
	str_t +=	"<td class='countdesc'>"
	if (roundDesc[name_t]) {
		str_t +="<span class='desccont'><input class='descbut' data-name='"+name_t+"' type='button' value='?'></span>"	
	}else{
		str_t +="<span class='desccont' style='visibility:hidden;'><input class='descbut' data-name='"+name_t+"' type='button' value='?'></span>"	
	}
	str_t +=	"</td>"
	str_t +=	"<td class='countdata'>"
	str_t +=		"<span class='roundcont'><input class='countbut' data-name='"+name_t+"' type='button' value='-'></span>"
	str_t +=		"<span class='countdisp font8' data-name='"+name_t+"'>"+count_t+"</span>"
	str_t +=	"</td></tr>"
	return str_t;
}
$(document).ready(function() {
	console.log(${pcvar('COUNT[WEAPON.CARRIED]')});
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}") != null) {
		info = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"));
		$("#totalhp").text(info["HP"]);
		$(".spontaneous .castdata").each(function( index ) {
			if (info["CAST"+$(this).attr("data-level")]) {
				$(this).text(info["CAST"+$(this).attr("data-level")]);
			}
		});
		console.log(info);
	}
	//Spells---------------------------------------------------
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells") != null) {
		spells = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells"));
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
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spellsUsed") != null) {
		spellsUsed = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spellsUsed"));
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
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"abilityUsed") != null) {
		abilityUsed = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"abilityUsed"));
		$.each(abilityUsed,function(index, value){
			console.log("Set "+index+"x"+value);
			var t_abn = index;
			var t_obj = $(".abilitydisp[data-name*='"+t_abn+"']");
			t_obj.text(value);
		});
	}
	updateCounters();
	//Round Counters------------------------------------------------------
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"roundCounters") != null) {
	console.log("counter detected");
		roundCounters = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"roundCounters"));
		$.each(roundCounters,function(index, value){
			console.log("Set "+index+" to "+value);
			$(".counterHolder").append(counterRow(index, value));
		});
	}
	//Consumables--------------------------------------------------------
	if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"consumables") != null) {
		consumables = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"consumables"));
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
	//Show When Ready
    $(document.getElementsByTagName("html")[0]).css("visibility","visible");
	//Open Page
	$(".tile").click(function(){
		if(state == 0){
			state = -1;
			temp = $(this).attr('id');
			$("#container").addClass("flip");
			$("#" + temp.substr(2)).removeClass("hidden gone");
			$("#pages").removeClass("hidden gone");
				$("#back").removeClass("hidden gone");
				$("#container").addClass("hidden gone");
				state=1;
		}
	});
	//Close Pages
	$("#back > i").click(function(){
		if(state == 1) {
			state = -1;
			$("#container").removeClass("flip gone");
			$("#pages, .page, #back").addClass("hidden gone");
			$("#container").removeClass("hidden");
			state=0;
		}
	});
	//Reset All
	$("#resetAll > i").click(function(){
	console.log("Resetting...");
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}");
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells");
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spellsUsed");
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"abilityUsed");
		console.log("Reset");
		location.reload(true);
	});
	//Shortcut Reset
	/*$("#go > input").change(function(){
		$("#go > input").val("");
	});*/
	//Reset Cast
	$("#resetUsed > i").click(function(){
	console.log("Resetting Used Spells...");
		spellsUsed = {};
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spellsUsed");
		console.log("Reset Used Spells");
		if (localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells") != null) {
		spells = JSON.parse(localStorage.getItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells"));
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
		for(i = 0; i < 10; i++) {
			delete info["USED"+i];
		}
		saveData();
		updateCounters();
	}
	});
	//Keyboard Shortcuts
	function key_page(tab) {
		state = -1;
		$(".page").addClass("hidden gone");
		$("#container").addClass("flip");
		$("#" + tab).removeClass("hidden gone");
		$("#pages").removeClass("hidden gone");
		$("#back").removeClass("hidden gone");
		$("#container").addClass("hidden gone");
		state=1;
	}
	$(document).on("keydown", function(e) {
		//Pages
		if (e.which==82) {key_page("info");};
		if (e.which==84) {key_page("stats");};
		if (e.which==89) {key_page("inv");};
		if (e.which==85) {key_page("battle");};
		if (e.which==70) {key_page("skills");};
		if (e.which==71) {key_page("qual");};	
		if (e.which==72) {key_page("Sspell");};
		if (e.which==74) {key_page("Aspell");};	
		if (e.which==90) {alert("Exit?");};	
		//Home
		if (e.which==27) {
			state = -1;
			$("#container").removeClass("flip gone");
			$("#pages, .page, #back").addClass("hidden gone");
			$("#container").removeClass("hidden");
			state=0;
		};				
	});
	//Control Scrolling
	$('.scrollable').on('touchstart', function (e) {
         e.stopPropagation();
	});
	$('.scrollable').on('touchmove', function (e) {
         e.stopPropagation();
	});
	//Calculate Ability Mods
	$(".ability").change(function(){
		tempdata = String(Math.floor(($(this).val()-10)/2));
		if (tempdata > 0) {
			tempdata = "+" + tempdata;
		}
		$("." + $(this).attr("name")).text(tempdata);
	});
	//Calculate Save Mods
	$(".save").change(function(){
		tempdata = parseInt($(this).val()) + parseInt($("." + $(this).attr("name")).attr("name"));
		if (tempdata > 0) {
			tempdata = "+" + tempdata;
		}
		if ($(this).val() == 0) {
			$(this).val("");
		}
		$("." + $(this).attr("name")).children().text(tempdata);
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
		t_count.val(parseInt(t_count.val())+1);
		t_twin.val(t_count.val()+"/"+t_count.val());
		t_twin.parent().parent().parent().addClass("prepped");
		t_twin.parent().parent().parent().prev().addClass("prepped");
		t_twin.parent().parent().parent().prev().prev().addClass("prepped");
		t_twin.parent().parent().parent().siblings(".accord5").addClass("prepped");
		
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
		if(parseInt(t_count.val()) <= 1) {
			t_count.val(0);
			t_twin.parent().parent().parent().removeClass("prepped");
			t_twin.parent().parent().parent().prev().removeClass("prepped");
			t_twin.parent().parent().parent().prev().prev().removeClass("prepped");
		}else{
			t_count.val(parseInt(t_count.val())-1);
		}
		t_twin.val(t_count.val()/t_count.val());
		if (info["PREP"+t_spl] > 1) {
			info["PREP"+t_spl] -= 1;
		}else{
			delete info["PREP"+t_spl];
		}
		if (spells[t_spn] > 1) {
			spells[t_spn] -= 1;
		}else{
			delete spells[t_spn];
		}
		if (info["USED"+t_spl] > 0 && spellsUsed[t_spn] > 0) {
			info["USED"+t_spl] -= 1;
		}
		if (spellsUsed[t_spn] > 1) {
			spellsUsed[t_spn] -= 1;
		}else{
			delete spellsUsed[t_spn];
		}
		if(!info.hasOwnProperty("PREP"+t_spl)) {
				t_twin.parent().parent().parent().siblings(".accord5").removeClass("prepped");
		}
		updateCounters();
		saveData();
	});
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
		localStorage.removeItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"abilityUsed");
		saveData();
	});
	//Round Counters--------------------------------------------
	$( ".round-add" ).click(function() {
		var name = prompt("Enter Ability Name (Required)");
		var count = prompt("Enter Number Of Rounds (Required)");
		var desc = prompt("Enter Description (Optional)");
		if (name != "" && !isNaN(count)) {
			roundCounters[name] = parseInt(count);
			if (desc != "") {
				roundDesc[name] = desc;
			}
			$(".counterHolder").append(counterRow(name, count));
			saveData();
		}
	});
	$( ".round-count" ).click(function() {
		jQuery.each(roundCounters, function(index) {
			roundCounters[index] -= 1;
			if (roundCounters[index] > 0) {
				$("span[data-name="+index+"]").html(roundCounters[index]);
			}else{
				$("span[data-name="+index+"]").parent().parent().remove();
				delete roundCounters[index];
				delete roundDesc[index];
			}
		});
		saveData();
	});
	$(document).on('click', '.descbut', function(){ 
		alert(roundDesc[$(this).attr('data-name')]);
	});
	$(document).on('click', '.countbut', function(){ 
		if(confirm("Remove This Counter?")) {
			$(".countbut[data-name="+$(this).attr("data-name")+"]").parent().parent().parent().remove();
			delete roundCounters[$(this).attr("data-name")];
			delete roundDesc[$(this).attr("data-name")];
		}
		saveData();
	});
	//Consumables--------------------------------------------------
	$( ".consumable-add" ).click(function() {
		var t_name = $(this).attr('data-name');
		$(this).parent().parent().next().html(parseInt($(this).parent().parent().next().html())+1);
		consumables[t_name]=$(this).parent().parent().next().html();
		saveData();
	});
	$( ".consumable-sub" ).click(function() {
		var t_name = $(this).attr('data-name');
		if (parseInt($(this).parent().parent().prev().html()) > 0) {
			$(this).parent().parent().prev().html(parseInt($(this).parent().parent().prev().html())-1);
			consumables[t_name]=$(this).parent().parent().prev().html();
			saveData();
		}
	});
	//Calculate HP-------------------------------------------------
	var totalhp = parseInt($("#totalhp").text());
	//Update HP
	$("#hp-add").click(function(){
		if(Number.isInteger(parseInt($("#hp-mod").val()))) {
			$("#totalhp").text(parseInt($("#totalhp").text())+parseInt($("#hp-mod").val()));
			/*if (parseInt($("#totalhp").text()) > totalhp) {
				$("#totalhp").text(totalhp);
			}*/
			$("#hp-mod").val("");
			info["HP"] = parseInt($("#totalhp").text());
			saveData();
		}
	});
	$("#hp-sub").click(function(){
		if(Number.isInteger(parseInt($("#hp-mod").val()))) {
			$("#totalhp").text(parseInt($("#totalhp").text())-parseInt($("#hp-mod").val()));
			$("#hp-mod").val("");
			info["HP"] = parseInt($("#totalhp").text());
			saveData();
		}
	});
	//Scaling------------------------------------------------------
	$(window).on("resize", function () {
		xscale = $("#data").css("width").split('px')[0] / 100000;
		yscale = $("#data").css("height").split('px')[0] / 100000;
		console.log("xscale: "+xscale);
		console.log("yscale: "+yscale);
		console.log("size: "+(40 * xscale^(.5) * yscale^(.5)) + "px");
		$(":root").css("font-size",(40 * xscale^(.5) * yscale^(.5)) + "px");
	}).resize();
	//Accordions---------------------------------------------------	
	//1
	var $accordion = $('.q-table table');
    $accordion.find("tr").not('.accord1').hide();

    $accordion.find(".accord1").click(function(){
        $accordion.find('.accord1').not(this).siblings().fadeOut(0);
        $(this).siblings().fadeToggle(0);
		$accordion.find('.accord1').not(this).parent().siblings().children().fadeOut(0);
        $(this).parent().siblings().children().filter(".accord2").fadeToggle(0);
    });
	//2
	var $accordion2 = $('#accord2');
    $accordion2.find("tr").not('.accord2').hide();

    $accordion2.find(".accord2").click(function(){
        $accordion2.find('.accord2').not(this).next().fadeOut(0);
        $(this).next().fadeToggle(0);
    });
	//3
	var $accordion3 = $('.asp-table:last-child table');
    $accordion3.find("tr").not('.accord3').hide();

    $accordion3.find(".accord3").click(function(){
        $accordion3.find('.accord3').not(this).siblings().fadeOut(0);
		if ($(this).next().css("display") == "none") {
			$(this).siblings().filter(".accord4").fadeToggle(0);
		}else {
			$(this).siblings().fadeOut(0);
		}
    });
	//4
	var $accordion4 = $('.asp-accord table');
    //$accordion4.find("tr").not('.accord4').hide();

    $accordion4.find(".accord4").click(function(){
        $accordion4.find('.accord4').not(this).next().fadeOut(0);
		$accordion4.find('.accord4').not(this).next().next().fadeOut(0);
        $(this).nextAll().slice(0, 2).fadeToggle(0);
    });
	//5
	var $accordion5 = $('.ssp-table:last-child table');
    $accordion5.find("tr").not('.accord5').hide();
	
    $accordion5.find(".accord5").click(function(){
        $accordion5.find('.accord5').not(this).siblings().fadeOut(0);
		if ($(this).next().css("display") == "none") {
			$(this).siblings().filter(".accord6").fadeToggle(0);
		}else {
			$(this).siblings().fadeOut(0);
		}
    });
	//6
	var $accordion6 = $('.ssp-accord table');
    //$accordion6.find("tr").not('.accord6').hide();

    $accordion6.find(".accord6").click(function(){
        $accordion6.find('.accord6').not(this).next().fadeOut(0);
		$accordion6.find('.accord6').not(this).next().next().fadeOut(0);
        $(this).nextAll().slice(0, 2).fadeToggle(0);
    });
	
	//Blood Money Adjustment
	$("b:contains('Blood Money')").parent().parent().find(".sptab1").html("You cut one of your hands, releasing a stream of blood that causes you to take 1d6 points of damage. When you cast another spell in that same round, your blood temporarily transforms into one material component required by that spell. Creating valuable material components requires an additional cost of 1 point of Strength damage, plus a further point of damage for every full 500 gp (0-499=1, 500-999=2).");
	
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
	//Save Data
	function saveData (){
		$(".spontaneous .castdata").each(function( index ) {
			info["CAST"+$(this).attr("data-level")] = parseInt($(this).text());
		});
		
		localStorage.setItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}", JSON.stringify(info));
		if(spells != null) {
			localStorage.setItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spells", JSON.stringify(spells));
		}
		if(spellsUsed != null) {
			localStorage.setItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"spellsUsed", JSON.stringify(spellsUsed));
		}
		if(abilityUsed != null) {
			localStorage.setItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"abilityUsed", JSON.stringify(abilityUsed));
		}
		if(roundCounters != null) {
			localStorage.setItem("saveData"+"${pcstring('NAME')}"+"${pcstring('ECL')}"+"roundCounters", JSON.stringify(roundCounters));
		}
		if(consumables != null) {
			localStorage.setItem("saveData"+"${pcstring('NAME')}"+"consumables", JSON.stringify(consumables));
		}
	}
	
});
</script>