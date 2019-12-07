function enable_drag() {
	$( ".sortable1" ).sortable({
	items: "tr:not(.state-disabled)",
	helper: 'clone',
	handle: ".reorder-cont, .condLabel",
	appendTo: 'body',
	opacity: 1,
	containment: "document",
	cursor: "move",
	zIndex: 999999,
	connectWith: ".sortable1",
	tolerance: "pointer",
	dropOnEmpty: true,
	stop: function(e, ui) {
        handle_drag(ui["item"]);
      },
	});
	//console.log("Drag");
}
function refresh_drag () {
	$( ".sortable1" ).sortable("refresh");
}
function handle_drag (moved_obj) {
	
	//Jquery object for moved tr
		var moved_t = moved_obj;
	//Name of moved object
		var entry_t;
	//Temporary copy of Tree
		var indices_t = conditionsIndex;
	//Old index of moved tr
		var index_t = moved_t.attr("data-index");
	//Path to old position of tr
		var path = moved_t.attr("data-path").split("`");
		path.shift();
	//Path to new position of tr
		var path_new;
	
	// Removing Old Entry------------------------------------
	if (path.length == 0) {
		//Store object name
		entry_t = indices_t[index_t];
		//Remove Old entry
		indices_t.splice(index_t, 1);
		//Renumerate
		renumerate_level($("#sortable1Root"));
	} else {
		//This function traverses to the destination and keeps a path
			var return_t = tree_crawl(indices_t,path);
		//Array which contains each layer of the tree with its children
			var array_t = return_t[0];
		//Index list to get you to the old entry level
			var guide_t = return_t[1];
		
		//Now we save the entry for later and splice it out
		//console.log("ENTRY TESTING");
		//console.log(array_t);
		//console.log(array_t.length-1);
		//console.log(index_t);
		entry_t = array_t[(array_t.length-1)][index_t];
		array_t[(array_t.length-1)].splice(index_t, 1);
		
		//Then we re-nest the updated entry until we're back at top level
		for (var k = (array_t.length-1); k > 0; k--) {
			array_t[k-1][guide_t[k-1]]["contents"] = array_t[k];
		}
		indices_t = array_t[0];
		
		//This traverses the DOM to find the layer which needs reindexing and sends it off
		var container_t = $("#sortable1Root");
		for (var level_t in guide_t) {
			container_t = container_t.children("[data-index="+guide_t[level_t]+"]").children("td").children("table").children(".sortable1");
		}
		renumerate_level(container_t);
	}
	//Replacing Entry In New Location------------------------
	//First we renumerate the level we are at.
	renumerate_level(moved_t.parent());
	
	//Then we get the path of its new location
	var parent_t = moved_t.parent().parent().parent().parent();
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
	
	//Now we splice in our saved entry
	array_t[(array_t.length-1)].splice(moved_t.attr("data-index"), 0, entry_t);
	
	//Then we re-nest the updated entry until we're back at top level
	for (var k = (array_t.length-1); k > 0; k--) {
		array_t[k-1][guide_t[k-1]]["contents"] = array_t[k];
	}
	indices_t = array_t[0];
	
	//Finally we change the data-path property to reflect its new position
	var path_string = path_new.join("`");
	if (path_string != "") {path_string = "`"+path_string}
	moved_t.attr("data-path", path_string);
	
	conditionsIndex = indices_t;
	//loggy("ConditionsIndex: ",conditionsIndex);
	saveData();
}

function tree_crawl (indices_m, path_m) {
	//loggy("New Path: ",path_m)
	//First we crawl down to where it is, storing as we go before we delete it's old entry
	var array_t = [];
	array_t[0] = indices_m;
	var guide_t = [];
	for (var k = 0; k < path_m.length; k++) {
		//console.log("We Crawled!");
		for (var item_t in array_t[k]) {
			//console.log("We looped!"+k);
			if (array_t[k][item_t]["name"] == path_m[k]) {
				guide_t.push(parseInt(item_t));
				array_t[k+1] = array_t[k][item_t]["contents"];
				break;
			}
		}
	}
	return [array_t, guide_t];
}

function renumerate_level(container_t) {
	var counter_t = 0;
	container_t.children("tr:not(.state-disabled)").each(function(){
		$(this).attr("data-index",counter_t);
		counter_t++;
	});
}
$( ".add-folder" ).click(function() {
	var folder_t = {};
	folder_t["name"] = prompt("Enter Folder Name.");
	folder_t["contents"] = [];
	if (typeof folder_t["name"] == 'string') {
		var used_t = 0;
		for (var item_t in conditionsIndex) {
			if (typeof conditionsIndex[item_t] == 'object' && conditionsIndex[item_t]["name"] == folder_t["name"]) {
				used_t = 1;
				break;
			}
		}
		if (used_t) {
			alert("Name Already Used");
		} else if (folder_t["name"].includes("`") || folder_t["name"].includes("'") || folder_t["name"].includes('"')){
			alert("Invalid Character Used!");
		} else {
			conditionsIndex.push(folder_t);
			$(".condHolder").append(folderRow(folder_t["name"], conditionsIndex.indexOf(folder_t), ""));
			enable_drag();
			refresh_drag();
			saveData();
		}
	}
});
$(document).on('click', '.foldbut', function(){ 
	if(confirm("Remove This Folder?")) {
		var indices_t = conditionsIndex;
		//First we get the path of its location
		var moved_t = $(this).parent().parent().parent()
		var parent_t = moved_t.parent().parent().parent().parent();
		//console.log("data-path:"+parent_t.attr("data-path"))
		var path_new = parent_t.attr("data-path");
		path_new = path_new.split("`")
		path_new.shift();

		//Then we use that path to update the indices
		//This function traverses to the destination and keeps a path
			var return_t = tree_crawl(indices_t,path_new);
		//Array which contains each layer of the tree with its children
			var array_t = return_t[0];
			//loggy("return_t: ",return_t);
			//loggy("Entry: ",entry_t);
		//Index list to get you to the old entry level
			var guide_t = return_t[1];
		if (array_t[(array_t.length-1)][parent_t.attr("data-index")]["contents"].length >= 1){
			alert("You can only remove empty folders!");
		}else{
			//Now we splice out the folder
			array_t[(array_t.length-1)].splice(parent_t.attr("data-index"), 1);
			
			//Then we re-nest the updated entry until we're back at top level
			for (var k = (array_t.length-1); k > 0; k--) {
				array_t[k-1][guide_t[k-1]]["contents"] = array_t[k];
			}
			indices_t = array_t[0];
			conditionsIndex = indices_t;
			parent_t.remove();
			refresh_drag();
			saveData();
		}
	}
});