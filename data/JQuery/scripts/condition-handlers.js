//Conditions--------------------------------------------
var t_height = $( window ).height()*7/8;
var t_width = $( window ).width()*3/4;
$( ".cond-add" ).click(function() {
	$("#condition-dialog").dialog({
		draggable: false,
		resizable: false,
		height: t_height,
		width: t_width
	});
	attr = {};
	$( "#conditions-select" ).select2();
});
$('#submit-select').click(function() {
	var name = $('#name-select').val();
	var count = $('#rounds-select').val();
	var desc = $('#desc-select').val();
	name.replace(/"/g, "")
	$('.mod-type:not(#AC-type)').each(function(){ 
		var t_index = $(this).prop('name');
		t_index = t_index.substr(0,t_index.length-5);
		//console.log(t_index);
		if (typeof attr[t_index] !== 'object') {
			attr[t_index] = {};
		}
		attr[t_index]["type"] = $(this).find(":selected").text();
	});
	$("#AC-type option:selected").each(function(){
		attr["AC"][$(this).text()] = $("#"+$(this).text()+"-ac-select").val();
	});
	if (name != "" && !isNaN(count)) {
		if (conditionsIndex.indexOf(name) != -1) {
			alert("Name Already Used");
		} else {
			conditions[name] = {};
			//console.log(parseInt(count));
			conditions[name]["rounds"] = parseInt(count);
			conditions[name]["switch"] = false;
			conditions[name]["attr"] = attr;
			conditionsIndex.push(name);
			if (desc != "") {
				conditions[name]["desc"] = desc;
			}
			saveData();
			$('#condition-dialog form').trigger("reset");
			attr = {};
			render_attr();
			$( "#conditions-select" ).select2('destroy');
			$("#condition-dialog").dialog('destroy');
			$(".condHolder").append(condRow(name, count, conditionsIndex.indexOf(name),""));
			refresh_drag();
		}
	}
})
$("#conditions-select").on('select2:select select2:unselect', function() {
	var attr_new = {};
	$.each($("#conditions-select option:selected"), function(){  
		attr_new[$(this).val()] = {};
		if ($(this).val() == "Dice") {
			attr_new[$(this).val()]["mod"] = 1;
		}else if ($(this).val() != "AC") {
			attr_new[$(this).val()]["mod"] = 0;
		}
	});
	for (var index in attr) {
		if (index != "AC") {
			if (!(typeof attr_new[index] === 'undefined')) {
				attr_new[index]["mod"] = attr[index]["mod"];
				attr_new[index]["type"] = attr[index]["type"];
			}
		}else{
			if (!(typeof attr_new[index] === 'undefined')) {
				for (var index_2 in attr[index]) {
						attr_new[index][index_2] = attr[index][index_2];
				}
			}
		}
	}
	attr = attr_new;
	render_attr();
})
$(document).on('select2:select select2:unselect', '#AC-type', function() {
	var attr_ac_new = {};
	$.each($("#AC-type option:selected"), function(){  
		attr_ac_new[$(this).val()] = 0;
	});
	for (var index in attr["AC"]) {
		if (attr_ac_new[index] == 0) {
			attr_ac_new[index] = attr["AC"][index];
		}
	}
	//console.log(attr["AC"]);
	//console.log(attr_ac_new);
	attr["AC"] = attr_ac_new;
	console.log("RuhRo")
	render_attr();
})
$(document).on('change', '.value-select:not(.ac)', function(){ 
	var t_index = $(this).prop('name');
	t_index = t_index.substr(0,t_index.length-7);
	attr[t_index]["mod"] = $(this).val();
});
$(document).on('change', '.value-select.ac', function(){ 
	var t_index = $(this).prop('name');
	t_index = t_index.substr(0,t_index.length-10);
	attr["AC"][t_index] = $(this).val();
});
$(document).on('select2:select select2:unselect', '.mod-type', function(){ 
	var t_index = $(this).prop('name');
	console.log("t_index: "+t_index);
	t_index = t_index.substr(0,t_index.length-5);
	console.log("t_index: "+t_index);
	if (t_index != "AC") {
		attr[t_index]["type"] = $(this).find(":selected").text();
	}
});
$( "#round-count" ).click(function() {
	jQuery.each(conditions, function(name) {
		if (conditions[name]["rounds"] > 1) {
			conditions[name]["rounds"] -= 1;
		}else if (conditions[name]["rounds"] == 1 || conditions[name]["rounds"] == 0){
			if (conditions[name]["switch"] == true) {
				remove_attrs(name, conditions[name]["attr"]);
			}
			conditions[name]["rounds"] = 0;
			conditions[name]["switch"] = 0;
			$("input[data-name='"+name+"'][type='checkbox']").prop("checked", false);
		}
		$("span[data-name='"+name+"']").filter(".conddisp").html(conditions[name]["rounds"]);
	});
	saveData();
});
$(document).on('click', '.switch', function(){ 
	var new_t = $(this).children().filter("input").prop("checked");
	var name_t = $(this).children().filter("input").attr("data-name");
	if (new_t != conditions[name_t]["switch"]) {
		if (new_t) {
			include_attrs(name_t, conditions[name_t]["attr"]);
		}else{
			remove_attrs(name_t, conditions[name_t]["attr"]);
		}
	}
	conditions[name_t]["switch"] = new_t;
	saveData();
});
$(document).on('click', '.descbut.cond', function(){ 
	var str_t = "";
	for (var index in conditions[$(this).attr('data-name')]["attr"]) {
		str_t += index+": "+conditions[$(this).attr('data-name')]["attr"][index]["mod"]+" "+conditions[$(this).attr('data-name')]["attr"][index]["type"]+", ";
	}
	if (conditions[$(this).attr('data-name')]["desc"] != "") {
		str_t += conditions[$(this).attr('data-name')]["desc"];
	}else{
		str_t = str_t.substr(0, str_t.length-2);
	}
	alert(str_t);
});
$(document).on('click', '.condbut', function(){ 
	if($(this).val() == "-" && confirm("Remove This Condition?")) {
		var indices_t = conditionsIndex;
		//First we get the path of its location
		var moved_t = $(this).parent().parent().parent()
		var parent_t = moved_t.parent().parent().parent().parent();
		var path_new;
		if (moved_t.parent().attr("id") == "sortable1Root") {
			path_new = [];
			//console.log("The ROOT")
		} else {
			//console.log("data-path:"+parent_t.attr("data-path"))
			path_new = parent_t.attr("data-path") + "`" + moved_t.parent().attr("data-name");
			path_new = path_new.split("`")
			path_new.shift();
		}
		//Then we use that path to update the indices
		//This function traverses to the destination and keeps a path
			var return_t = tree_crawl(indices_t,path_new);
		//Array which contains each layer of the tree with its children
			var array_t = return_t[0];
			//loggy("return_t: ",return_t);
			//loggy("Entry: ",entry_t);
		//Index list to get you to the old entry level
			var guide_t = return_t[1];
		//Now we splice out the condition
		array_t[(array_t.length-1)].splice(moved_t.attr("data-index"), 1);
		
		//Then we re-nest the updated entry until we're back at top level
		for (var k = (array_t.length-1); k > 0; k--) {
			array_t[k-1][guide_t[k-1]]["contents"] = array_t[k];
		}
		indices_t = array_t[0];
		conditionsIndex = indices_t;
		moved_t.remove();
		refresh_drag();
		delete conditions[$(this).attr("data-name")];
		saveData();
	} else if($(this).val() == "S") {
		new_val = prompt("Insert New Value");
		if (!isNaN(new_val)) {
			new_val = Math.max(new_val, -1);
			$(".conddisp[data-name='"+$(this).attr("data-name")+"']").html(new_val);
			conditions[$(this).attr("data-name")]["rounds"] = new_val;
		}
	}
	saveData();
});