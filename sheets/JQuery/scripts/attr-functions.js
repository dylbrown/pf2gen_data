function render_attr() {
	var str_t = "<table id='values-table'>";
	if (typeof attr === 'object') {
		str_t += "<th colspan=3><label>Modifier Values</label></th>";
	}
	for (var index in attr) {
		var str_t_t = "";
		loggy("attr: ",attr);
		str_t_t += "<tr><td><label for='"+index+"-select'>"+index+"</label></td>";
		switch (index) {
			case "Attack":
				str_t_t += "<td><select name='Attack-type' id='Attack-type' class='mod-type'>";
				str_t_t += 	"<option>Untyped</option>";
				str_t_t += 	"<option>Competence</option>";
				str_t_t += 	"<option>Enhancement</option>";
				str_t_t += 	"<option>Insight</option>";
				str_t_t += 	"<option>Luck</option>";
				str_t_t +=	"<option>Morale</option>";
				str_t_t += "</select></td>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				if (pos_t == -1) {
					pos_t = str_t_t.indexOf(">Untyped");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
			case "Damage":
				str_t_t += "<td><select name='Damage-type' id='Damage-type' class='mod-type'>";
				str_t_t += 	"<option>Untyped</option>";
				str_t_t += 	"<option>Competence</option>";
				str_t_t += 	"<option>Enhancement</option>";
				str_t_t += 	"<option>Luck</option>";
				str_t_t += 	"<option>Morale</option>";
				str_t_t += 	"<option>Profane</option>";
				str_t_t +=	"<option>Sacred</option>";
				str_t_t += "</select></td>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				if (pos_t == -1) {
					pos_t = str_t_t.indexOf(">Untyped");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
			case "Fortitude":
			case "Reflex":
			case "Will":
			case "Saves":
				str_t_t += "<td><select name='"+index+"-type' id='"+index+"-type' class='mod-type'>";
				str_t_t += 	"<option>Untyped</option>";
				str_t_t += 	"<option>Alchemical</option>";
				str_t_t += 	"<option>Competence</option>";
				str_t_t += 	"<option>Dodge</option>";
				str_t_t += 	"<option>Insight</option>";
				str_t_t += 	"<option>Luck</option>";
				str_t_t +=	"<option>Morale</option>";
				str_t_t += 	"<option>Profane</option>";
				str_t_t += 	"<option>Resistance</option>";
				str_t_t +=	"<option>Sacred</option>";
				str_t_t += "</select></td>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				console.log(pos_t);
				if (parseInt(pos_t) == -1) {
					pos_t = str_t_t.indexOf(">Untyped");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
			case "AC":
				str_t_t += "<td colspan=2><select multiple='multiple' name='AC-type' id='AC-type' class='mod-type ac'>";
				str_t_t += 	"<option>Armor</option>";
				str_t_t += 	"<option>Deflection</option>";
				str_t_t += 	"<option>Dodge</option>";
				str_t_t += 	"<option>Enhancement (Armor)</option>";
				str_t_t += 	"<option>Enhancement (Natural)</option>";
				str_t_t += 	"<option>Enhancement (Shield)</option>";
				str_t_t += 	"<option>Natural</option>";
				str_t_t += 	"<option>Shield</option>";
				str_t_t += 	"<option>Size</option>";
				str_t_t += 	"<option>Misc</option>";
				str_t_t += "</select></td></tr>";
				for (var index_t in attr[index]) {
					var pos_t = str_t_t.indexOf(">"+index_t);
					str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				}
				str_t_t += "<tr><td colspan=3>"+render_AC()+"</td></tr>";
				console.log("str_t_t: "+str_t_t)
				break;
			case "Strength":
			case "Dexterity":
			case "Constitution":
				str_t_t += "<td><select name='"+index+"-type' id='"+index+"-type' class='mod-type'>";
				str_t_t += 	"<option>Untyped</option>";
				str_t_t += 	"<option>Alchemical</option>";
				str_t_t += 	"<option>Enhancement</option>";
				str_t_t += 	"<option>Morale</option>";
				str_t_t +=	"<option>Size</option>";
				str_t_t += "</select></td>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				if (pos_t == -1) {
					pos_t = str_t_t.indexOf(">Untyped");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
			case "Intelligence":
			case "Wisdom":
			case "Charisma":
				str_t_t += "<td><select name='"+index+"-type' id='"+index+"-type' class='mod-type'>";
				str_t_t += 	"<option>Untyped</option>";
				str_t_t += 	"<option>Alchemical</option>";
				str_t_t += 	"<option>Enhancement</option>";
				str_t_t += "</select></td>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				if (pos_t == -1) {
					pos_t = str_t_t.indexOf(">Untyped");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
			case "Dice":
				str_t_t += "<td colspan=2><select name='"+index+"-type' id='"+index+"-type' class='mod-type'>";
				str_t_t += 	"<option>Vital Strike</option>";
				str_t_t += 	"<option>Improved Vital Strike</option>";
				str_t_t += 	"<option>Greater Vital Strike</option>";
				str_t_t += 	"<option>Size Increase</option>";
				str_t_t += 	"<option>Effective Size Increase</option>";
				str_t_t += "</select></td></tr>";
				var pos_t = str_t_t.indexOf(">"+attr[index]["type"]);
				if (pos_t == -1) {
					pos_t = str_t_t.indexOf(">Size Increase");
				}
				str_t_t = [str_t_t.slice(0, pos_t), " selected", str_t_t.slice(pos_t)].join("");
				break;
		}
		if (index != "AC" && index != "Dice"){
			str_t_t += "<td><input name='"+index+"-select' type='number' class='value-select' id='"+index+"-select' value="+attr[index]["mod"]+" min='1'></input></td></tr>";
		}
		str_t += str_t_t;
	}
	str_t += "</table>";
	//console.log(str_t);
	$(".mod-type").select2('destroy');
	$("#values-select").html(str_t);
	$(".mod-type").select2();
}
function render_AC () {
	var str_t = "<table id='ac-mod-table'>";
	var temp_t = Object.keys(attr["AC"]);
	console.log("temp_t"+temp_t);
	if (temp_t.length > 0) {
		str_t += "<tr><th colspan=2><label>AC Modifier Values</label></th></tr>";
	}
	for (var index in attr["AC"]) {
		str_t += "<tr><td>"+index+"</td>";
		str_t += "<td><input name='"+index+"-ac-select' type='number' class='value-select ac' id='"+index+"-ac-select' value="+attr["AC"][index]+" min='1'></input></td></tr>";
	}
	str_t += "</table>";
	return str_t;
}
function sub_attr(name_t, val_t, type_t) {
	add_attr(name_t, -1 * parseInt(val_t), type_t);
}
function add_attr(name_t, val_t, type_t) {
	switch (name_t) {
		case "Attack":
			$(".tohit").each(function (){
				var old_t = $(this).html().split("/");
				var new_t = [];
				for (var i in old_t) {
					new_t[i] = parseInt(old_t[i]) + parseInt(val_t);
					if (new_t[i] > 0) {
						new_t[i] = "+"+new_t[i];
					}
				}
				$(this).html(new_t.join("/"))
			})
			break;
		case "Damage":
			$(".dmg").each(function (){
				if ($(this).html().includes("+")) {
					var old_t = $(this).html().split("+");
					var new_t = parseInt(old_t[1]) + parseInt(val_t);
					if (new_t > 0) {
						$(this).html(old_t[0]+"+"+new_t);
					}else if (new_t == 0){
						$(this).html(old_t[0]);
					}else{
						$(this).html(old_t[0]  +  new_t);
					}
				}else{
					var old_t = $(this).html().split("-");
					if (typeof old_t[1] === 'undefined') {old_t[1]=0}
					var new_t = parseInt(old_t[1]) + parseInt(val_t);
					if (new_t > 0) {
						$(this).html(old_t[0]+"+"+new_t);
					}else if (new_t == 0){
						$(this).html(old_t[0]);
					}else{
						$(this).html(old_t[0]  +  new_t);
					}
				}
			})
			break;
		case "Fortitude":
			$(".Fortitude").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(val_t);
				if (new_t > 0) {
					$(this).html("+"+new_t);
				}else{
					$(this).html(new_t);
				}
			})
			break;
		case "Reflex":
			$(".Reflex").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(val_t);
				if (new_t > 0) {
					$(this).html("+"+new_t);
				}else{
					$(this).html(new_t);
				}
			})
			break;
		case "Will":
			$(".Will").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(val_t);
				if (new_t > 0) {
					$(this).html("+"+new_t);
				}else{
					$(this).html(new_t);
				}
			})
			break;
		case "Saves":
			$(".Fortitude, .Reflex, .Will").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(val_t);
				if (new_t > 0) {
					$(this).html("+"+new_t);
				}else{
					$(this).html(new_t);
				}
			})
			break;
		case "AC":
			$(".AC:not(.mod-type)").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(val_t);
				$(this).html(new_t);
			})
			switch (type_t) {
				case "Armor":
				case "Enhancement (Armor)":
					$(".Armor").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Deflection":
					$(".Deflection").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Dodge":
					$(".Dodge").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Natural":
				case "Enhancement (Natural)":
					$(".Natural").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Shield":
				case "Enhancement (Shield)":
					$(".Shield").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Size":
					$(".Size").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
				case "Misc":
					$(".Misc").each(function (){
						var new_t = parseInt($(this).html()) + parseInt(val_t);
						$(this).html(new_t);
					})
					break;
			}
			var flat = ["Armor", "Enhancement (Armor)", "Deflection", "Natural", "Enhancement (Natural)", "Shield", "Enhancement (Shield)", "Size", "Misc"];
			var touch = ["Deflection", "Dodge", "Misc"];
			if (flat.includes(type_t)) {
				$(".Flat-AC").each(function (){
					var new_t = parseInt($(this).html()) + parseInt(val_t);
					$(this).html(new_t);
				})
			}
			if (touch.includes(type_t)) {
				$(".Touch-AC").each(function (){
					var new_t = parseInt($(this).html()) + parseInt(val_t);
					$(this).html(new_t);
				})
			}
			break;
		case "Strength":
		case "Dexterity":
		case "Constitution":
		case "Intelligence":
		case "Wisdom":
		case "Charisma":
			ability_change(name_t, val_t);
			break;
		case "Dice":
			switch (type_t) {
				case "Vital Strike":
				case "Improved Vital Strike":
				case "Greater Vital Strike":
					$(".dmg").each(function (){
						if ($(this).html().includes("+")) {
							var old_t = $(this).html().split("+");
							old_dice_t = old_t[0].split("d");
							var new_t = old_dice_t;
							switch (type_t) {
								case "Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 2;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 2;
									}
									break;
								case "Improved Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 3;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 3;
									}
									break;
								case "Greater Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 4;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 4;
									}
									break;
							}
							$(this).html(new_t.join("d")+"+"+old_t[1]);
						}else{
							var old_t = $(this).html().split("-");
							if (typeof old_t[1] === 'undefined') {old_t[1]=0}
							old_dice_t = old_t[0].split("d");
							var new_t = old_dice_t;
							switch (type_t) {
								case "Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 2;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 2;
									}
									break;
								case "Improved Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 3;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 3;
									}
									break;
								case "Greater Vital Strike":
									if (parseInt(val_t) == 1) {
										new_t[0] = parseInt(new_t[0]) * 4;
									}else if (parseInt(val_t) == -1) {
										new_t[0] = parseInt(new_t[0]) / 4;
									}
									break;
							}
							if (old_t[1] == 0){
								$(this).html(new_t.join("d"));
							}else{
								$(this).html(new_t.join("d")+old_t[1]);
							}
						}
					})
					break;
				case "Size Increase":
				case "Effective Size Increase":
					break;
			}
			break;
	}
}
function include_attrs (source, attr_list) {
	for (attr_t in attr_list) {
		if (attr_t != "AC") {
			include_attr (source, attr_t, attr_list[attr_t]["mod"], attr_list[attr_t]["type"]);
		}else{
			for (var attr_2 in attr_list[attr_t]) {
				include_attr (source, attr_t, attr_list[attr_t][attr_2], attr_2);
			}
		}
	}
}
function include_attr (source_t, name, mod_t, type) {
	if (typeof attr_current[name] !== 'object') {
		add_attr(name, mod_t, type);
		attr_current[name] = {};
		attr_current[name][type] = [];
		attr_current[name][type][0]={};
		attr_current[name][type][0]["mod"] = mod_t;
		attr_current[name][type][0]["source"] = source_t;
	}else if (typeof attr_current[name][type] !== 'object') {
		add_attr(name, mod_t, type);
		attr_current[name][type] = [];
		attr_current[name][type][0]={};
		attr_current[name][type][0]["mod"] = mod_t;
		attr_current[name][type][0]["source"] = source_t;
	}else if (typeof attr_current[name][type][0] !== 'object') {
		add_attr(name, mod_t, type);
		attr_current[name][type][0]={};
		attr_current[name][type][0]["mod"] = mod_t;
		attr_current[name][type][0]["source"] = source_t;
	}else if (type == "Untyped" || type == "Misc" || type == "Dodge") {
		console.log(type);
		attr_current[name][type].push({mod: mod_t, source: source_t});
		add_attr(name, mod_t, type);
	}else if (attr_current[name][type][0]["mod"] < mod_t) {
		sub_attr(name, attr_current[name][type][0]["mod"], type);
		add_attr(name, mod_t, type);
		attr_current[name][type].unshift({mod: mod_t, source: source_t});
	}else{
		if (typeof attr_current[name][type][1] !== 'object') {
			attr_current[name][type][1] = {mod: mod_t, source: source_t};
			console.log("Only 1");
		}else{
			var i;
			for ( i = 1; i < attr_current[name][type].length; i++) {
				if (attr_current[name][type][i] <= mod_t) {
					break;
				}
			}
			attr_current[name][type].splice(pos, i, {mod: mod_t, source: source_t})
		}
	}
}
function remove_attrs (source, attr_list) {
	for (attr_t in attr_list) {
		if (attr_t != "AC") {
			remove_attr (source, attr_t, attr_list[attr_t]["mod"], attr_list[attr_t]["type"]);
		}else{
			for (attr_2 in attr_list[attr_t]) {
				remove_attr (source, attr_t, attr_list[attr_t][attr_2], attr_2);
			}
		}
	}
}
function remove_attr (source, name, mod, type) {
	if (attr_current[name][type][0]["source"] == source) {
		sub_attr(name, mod,  type);
		if (type == "Untyped" || type == "Misc" || type == "Dodge") {
			attr_current[name][type].shift();
		}else if (typeof attr_current[name][type][1] === 'object'){
			attr_current[name][type].shift();
			add_attr(name, attr_current[name][type][0]["mod"], type);
		}else{
			attr_current[name][type] = [];
		}
	}else{
		if (type == "Untyped" || type == "Misc" || type == "Dodge") {
			sub_attr(name, mod,  type);
		}
		var attrs_t = attr_current[name][type];
		for (index_t in attrs_t) {
			if (attrs_t[index_t]["source"] == source){
				attr_current[name][type].splice(index_t, 1);
			}
		}
	}
}

function ability_change(name_t, val_t) {
	var temp_mod;
	var old_mod;
	var new_mod;
	$("[name='"+name_t.substr(0,3).toUpperCase()+"']").each(function (){
		var new_t = parseInt($(this).html()) + parseInt(val_t);
		old_mod = Math.floor(($(this).html()-10)/2);
		$(this).html(new_t);
		stats[$(this).prop("name")] = $(this).html();
		new_mod = Math.floor(($(this).html()-10)/2);
		temp_mod = new_mod - old_mod;
		if (new_mod > 0) {
			new_mod = "+" + new_mod;
		}
		$("." + $(this).attr("name")+"-box").text(new_mod);
	})
	$("."+name_t.substr(0,3).toUpperCase()+"-mod").each(function (){
		var new_t = parseInt($(this).html()) + parseInt(temp_mod);
		$(this).html(new_t);
	})
	$("."+name_t.substr(0,3).toUpperCase()+"-roll").each(function (){
		var old_t;
		var new_t;
		var contents = $(this).html();
		if (contents.includes("d")) {
			if (contents.includes("+")) {
				old_t = contents.split("+")
			}else if (contents.includes("-")) {
				old_t = contents.split("-")
			}else {
				old_t = [contents, 0];
			}
			new_t = parseInt(old_t[1]) + parseInt(temp_mod);
			if (new_t > 0) {
				$(this).html(old_t[0]+"+"+new_t);
			}else if (new_t < 0) {
				$(this).html(old_t[0]+new_t);
			}else{
				$(this).html(old_t[0]);
			}
		}else if (contents.includes("/")) {
			old_t = contents.split("/")
			new_t=[];
			for (var index in old_t) {
				new_t[index] = parseInt(old_t[index]) + parseInt(temp_mod);
				if (new_t[index] > 0) {
					new_t[index] = "+" + new_t[index];
				}
			}
			$(this).html(new_t.join("/"));
		}else{
			new_t = parseInt(contents) + parseInt(temp_mod);
			if (new_t > 0) {
				$(this).html("+"+new_t);
			}else{
				$(this).html(new_t);
			}
		}
	})
	switch (name_t) {
		case "Strength":
			$(".STR-roll-OH").each(function (){
				var contents = $(this).html();
				if (contents.includes("+")) {
					old_t = contents.split("+")
				}else if (contents.includes("-")) {
					old_t = contents.split("-")
				}else {
					old_t = [contents, 0];
				}
				new_t = parseInt(old_t[1]) - Math.floor(parseInt(old_mod) / 2) + Math.floor(parseInt(new_mod) / 2);
				if (new_t > 0) {
					$(this).html(old_t[0]+"+"+new_t);
				}else if (new_t < 0) {
					$(this).html(old_t[0]+new_t);
				}else{
					$(this).html(old_t[0]);
				}
			})
			$(".STR-roll-2H").each(function (){
				var contents = $(this).html();
				if (contents.includes("+")) {
					old_t = contents.split("+")
				}else if (contents.includes("-")) {
					old_t = contents.split("-")
				}else {
					old_t = [contents, 0];
				}
				new_t = parseInt(old_t[1]) - Math.floor(parseInt(old_mod) * 1.5) + Math.floor(parseInt(new_mod) * 1.5);
				if (new_t > 0) {
					$(this).html(old_t[0]+"+"+new_t);
				}else if (new_t < 0) {
					$(this).html(old_t[0]+new_t);
				}else{
					$(this).html(old_t[0]);
				}
			})
			break;
		case "Dexterity":
			break;
		case "Constitution":
			$("#totalhp").each(function (){
				var new_t = parseInt($(this).html()) + parseInt(temp_mod) * parseInt(${character.level});
				$(this).html(new_t);
			});
			$("#inithp").each(function (){
				var old_t = $(this).html();
				var new_t = parseInt(old_t.substr(1)) + parseInt(temp_mod) * parseInt(${character.level});
				$(this).html("/"+new_t);
			});
			break;	
		case "Intelligence":
			break;
		case "Wisdom":
			break;
		case "Charisma":
			break;
	}
}