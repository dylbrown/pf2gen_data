//Accordions---------------------------------------------------	
/*function accordionTiling () {
	var EvenElem = $('.accord6:visible:even');
	var OddElem = $('.accord6:visible:odd');
	EvenElem = EvenElem.add(EvenElem.next()).add(EvenElem.next().next());
	OddElem = OddElem.add(OddElem.next()).add(OddElem.next().next());
	EvenElem = EvenElem.add(EvenElem.find("td"));
	OddElem = OddElem.add(OddElem.find("td"));
	EvenElem.css('background', '#DDDDDD').css('border', '1px solid #DDDDDD');
	OddElem.css('background', '#FFFFFF').css('border', '1px solid #FFFFFF'); 
}*/

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
/*var $accordion2 = $('#accord2');
$accordion2.find("tr").not('.accord2').hide();

$accordion2.find(".accord2").click(function(){
	$accordion2.find('.accord2').not(this).next().fadeOut(0);
	$(this).next().fadeToggle(0);
});*/
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
	var isSelected = $(this).attr("data-selected");
	$accordion5.find('.accord5').not(this).siblings().fadeOut(0);
	if (!(isSelected == 'selected')) {
		console.log("wasSelected");
		$(this).siblings().filter(".accord6").fadeToggle(0);
		$('.accord5').attr("data-selected", "");
		$(this).attr("data-selected", "selected");
	}else {
		$(this).siblings().fadeOut(0);
		$('.accord5').attr("data-selected", "");
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
//7
var $accordion7 = $('.condHolder');

$accordion7.find(".secHead").click(function(){
	$accordion7.find('.accord7').fadeToggle(0);
});
//8
var $accordion8 = $('.sAttackHolder');

$accordion8.find(".secHead").click(function(){
	$accordion8.find('.accord8').fadeToggle(0);
});
//9
var $accordion9 = $('.counterHolder');

$accordion9.find(".secHead").click(function(){
	$accordion9.find('.accord9').fadeToggle(0);
});
//10
var $accordion10 = $('.consumableHolder');

$('.consumableHolder').on('click', '.secHead', function(){
	$accordion10.find('.accord10').fadeToggle(0);
});

//11
var $accordion11 = $('.folderToggle');
$accordion11.parent().parent().siblings().hide();

$(document).on('click', '.folderToggle', function(){ 
	if (parseInt($(this).attr("data-show")) == 0) {
		$(this).parent().parent().siblings().fadeIn(0);
		$(this).attr("data-show", 1);
	}else {
		$(this).parent().parent().siblings().fadeOut(0);
		$(this).attr("data-show", 0);
	}
});
var $actionAccord = $('.actionHide');

$('.actionAccord').click(function(){
	$actionAccord.not($(this).next(".actionHide")).fadeOut(0);
	$(this).next(".actionHide").fadeToggle(0);
	
});
$actionAccord.fadeOut(0);