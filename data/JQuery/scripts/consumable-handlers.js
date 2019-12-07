//Equipment Table--------------------------------------------
$( "#itemAdd" ).click(function() {
	var itName = prompt("Please Enter Item Name");
	var Charges = prompt("Please Enter Number Of Charges");
	addedItems[itName] = parseInt(Charges);
	$("#consumable-Table").append(consumableRow(itName, Charges));
	saveData();
});

$(document).on('click', '.delItem', function(){ 
	if(confirm("Remove This Counter?")) {
		$(this).parent().parent().remove();
		delete addedItems[$(this).parent().next().next().attr("data-name")];
		delete consumables[$(this).parent().next().next().attr("data-name")];
	}
	saveData();
});
	//Consumables--------------------------------------------------
$(document).on('click', ".consumable-add" , function() {
	var t_name = $(this).attr('data-name');
	$(this).parent().parent().next().html(parseInt($(this).parent().parent().next().html())+1);
	consumables[t_name]=$(this).parent().parent().next().html();
	saveData();
});
$(document).on('click', ".consumable-sub", function() {
	var t_name = $(this).attr('data-name');
	if (parseInt($(this).parent().parent().prev().html()) > 0) {
		$(this).parent().parent().prev().html(parseInt($(this).parent().parent().prev().html())-1);
		if (typeof addedItems[t_name] === 'undefined') {
			consumables[t_name]=$(this).parent().parent().prev().html();
		}else{
			addedItems[t_name]=$(this).parent().parent().prev().html();
		}
		saveData();
	}
});