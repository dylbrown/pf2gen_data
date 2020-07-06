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
//Calculate GP-------------------------------------------------
var totalgp = parseFloat($("#totalgp").text());
//Update GP
$("#gp-add").click(function(){
	var gpMod = prompt("Insert gold value to be added");
	if(isNumeric(gpMod)){
		console.log(parseFloat($("#totalgp").text())+"+"+parseFloat("gpMod"));
		$("#totalgp").text(parseFloat($("#totalgp").text())+parseFloat(gpMod));
		info["GP"] = parseFloat($("#totalgp").text());
		saveData();
	}else{
		alert("Please insert a valid numerical value");
	}
});
$("#gp-sub").click(function(){
	var gpMod = prompt("Insert gold value to be removed");
	if(isNumeric(gpMod)){
		$("#totalgp").text(parseFloat($("#totalgp").text())-parseFloat(gpMod));
		info["GP"] = parseFloat($("#totalgp").text());
		saveData();
	}else{
		alert("Please insert a valid numerical value");
	}
});