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
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}");
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}"+"spells");
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}"+"spellsUsed");
	localStorage.removeItem("saveData"+"${character.name}"+"${character.level}"+"abilityUsed");
	localStorage.removeItem("saveData"+"${character.name}"+"conditions");
	localStorage.removeItem("saveData"+"${character.name}"+"roundCounters");
	localStorage.removeItem("saveData"+"${character.name}"+"roundDesc");
	localStorage.removeItem("saveData"+"${character.name}"+"consumables");
	localStorage.removeItem("saveData"+"${character.name}"+"addedItems");
	console.log("Reset");
	location.reload(true);
});
//Shortcut Reset
/*$("#go > input").change(function(){
	$("#go > input").val("");
});*/
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
	if ($("form *").find($( document.activeElement )).length == 0 ) {
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
	}		
});
//Control Scrolling
$('.scrollable').on('touchstart', function (e) {
	 e.stopPropagation();
});
$('.scrollable').on('touchmove', function (e) {
	 e.stopPropagation();
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