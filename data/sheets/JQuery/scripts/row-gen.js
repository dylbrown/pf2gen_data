function condRow (name_t, count_t, index_t, path_t) {
	var str_t = "";
	str_t += "<tr class='condRow accord7' data-index="+index_t+" data-path='"+path_t+"'>";
	str_t +=	"<td class='font8 condLabel padme'><b>"+name_t+"</b>"
	str_t +=    "<label class='switch'>"
	if (conditions[name_t]["switch"]){
	str_t +=    '  <input type="checkbox" data-name="'+name_t+'" checked>'
	}else{
	str_t +=    '  <input type="checkbox" data-name="'+name_t+'">'
	}
	str_t +=    "  <span class='slider'></span>"
	str_t +=    "</label>"
	str_t +=	"</td>"
	str_t +=	"<td class='conddesc'>"
	str_t +='<span class="desccont"><input class="descbut cond" data-name="'+name_t+'" type="button" value="?"></span>'	
	str_t +=	"</td>"
	str_t +=	"<td class='conddata'>"
	str_t +=		'<span class="condcont"><input class="condbut" data-name="'+name_t+'" type="button" value="S"></span>'
	str_t +=	"</td><td class='conddata'>"
	str_t +=		'<span class="condcont"><input class="condbut" data-name="'+name_t+'" type="button" value="-"></span>'
	str_t +=	"</td><td class='conddata'>"
	str_t +=		'<span class="conddisp font8" data-name="'+name_t+'">'+count_t+'</span>'
	str_t +=	"</td></tr>"
	return str_t;
}

function folderRow (name_t, index_t, path_t) {
	var str_t = "";
	str_t += "<tr class='condRow accord7' data-index="+index_t+" data-path='"+path_t+"'>";
	str_t +=	"<td colspan=5 class='font8 foldLabel'>";
	str_t +=		"<div class='reorder-cont'><i class='material-icons reorder-bar'>reorder</i></div>";
	str_t +=		"<table class='folder-table'><tbody class='sortable1' data-name='"+name_t+"'>";
	str_t +=		"<tr class='state-disabled'><th class='foldtitle padme'><button class='folderToggle' type='button' data-show=0>"+name_t+"</button></th><th colspan=2 class='foldfiller'></th><th colspan=2 class='foldLabel foldDelete'>";
	str_t +=			'<span class="condcont"><input class="foldbut" data-name="'+name_t+'" type="button" value="-"></span>';
	str_t +=		"</th></tr></tbody></table>";
	str_t +=	"</td></tr>";
	return str_t;
}

function consumableRow (name_t, count_t) {
	str_t = "";
	if (Object.keys(addedItems).length % 2 == 0) {
	str_t += "<tr bgcolor='#DDDDDD' class='accord10'>";
	}else{
	str_t += "<tr bgcolor='white' class='accord10'>";
	}
	str_t +=	" <td class='font7'>&nbsp;"+name_t
    str_t +=	"<input type='button' class='delItem' align='right' value='del'><br /></td>"
	str_t +=	"<td class='font7' style='width:8%;'><span class='consumablecont'><input class='consumablebut consumable-add' data-name='"+name_t+"' type='button' value='+'></span></td>"
	str_t +=	"<td class='font7 consumable-data' style='width:9%;text-align:center;' data-name='"+name_t+"'>"+count_t+"</td>"
	str_t +=	"<td class='font7' style='width:8%;'><span class='consumablecont'><input class='consumablebut consumable-sub' data-name='"+name_t+"' type='button' value='-'></span></td>"
	str_t +=	"</tr>"
	return str_t;
}