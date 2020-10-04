<#ftl encoding="UTF-8" strip_whitespace=true >
<!doctype html>

<html lang="en">
<div id="data"></div>
<head>
	<meta charset="utf-8">

	<title>Pathfinder - ${pcstring('NAME')}</title>
	<link rel="stylesheet" href="css/jquery-ui.min.css">
	<style>
<#include "/JQuery/style.css">
	</style>
	<link rel="stylesheet" href="css/rpg-awesome.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/select2-flat.css">
	<link href="css/material-design.css" rel="stylesheet">
	<script src="js/jquery-3.2.0.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.ui.touch-punch.min.js"></script>
	<meta name="viewport" content="width=device-width, user-scalable=no" />
</head>

<body>
<#include "/JQuery/condition-dialog.ftl">
<div id="container">
	<div id="t-info" class="tile"><div class="icon"><i class="ra ra-player"></i></div><div class="title">Info</div></div>
	<div id="t-stats" class="tile"><div class="icon"><i class="ra ra-dice-three"></i></div><div class="title">Stats</div></div>
	<div id="t-inv" class="tile"><div class="icon"><i class="ra ra-ammo-bag"></i></div><div class="title">Stuff</div></div>
	<div id="t-battle" class="tile"><div class="icon"><i class="ra ra-relic-blade"></i></div><div class="title">Battle</div></div>
	<div id="t-skills" class="tile"><div class="icon"><i class="ra ra-hammer"></i></div><div class="title">Skills</div></div>
	<div id="t-qual" class="tile"><div class="icon"><i class="ra ra-wooden-sign"></i></div><div class="title">Traits</div></div>
	<div id="t-Sspell" class="tile"><div class="icon"><i class="ra ra-crystal-wand"></i></div><div class="title">Prep Spells</div></div>
	<div id="t-Aspell" class="tile"><div class="icon"><i class="ra ra-scroll-unfurled"></i></div><div class="title">All Spells</div></div>
</div>

<div id="back" class="hidden"><i class="ra ra-cancel"></i></div>
<div id="pages" class="hidden gone">
	<div id="info" class="page hidden">
		<div id="resetAll" class="reset"><i class="ra ra-cog"></i></div>
		<#include "/JQuery/info.ftl">	
	</div>
	<div id="stats" class="page hidden gone">
		<div id="stats-ability">
			<#include "/JQuery/stats/ability.ftl">	
		</div>
		<div id="stats-ac">
			<#include "/JQuery/stats/ac.ftl">	
		</div>
		<div id="stats-saves">
			<#include "/JQuery/stats/saves.ftl">
		</div>
		<div id="stats-bonus">
			<#include "/JQuery/stats/bonus.ftl">
		</div>
		<div id="stats-misc">
			<#include "/JQuery/stats/misc.ftl">
		</div>
	</div>	
	<div id="inv" class="page hidden gone"><div id="inv-scroll">
	<!-- START Equipment Table -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="Master Equipment Table"> <!-- Master Equipment Table -->
		<tr>
			<td bgcolor="black" align="center" colspan="10"><font color="white" style="font-size: 9pt"><b>EQUIPMENT</b></font></td>
		</tr>
		<tr>
			<td width="50%" valign="top">
				<#include "/JQuery/item/item.ftl">
			</td>
		</tr>
		<tr>
			<td width="50%" valign="top">
				<#include "/JQuery/item/weight.ftl">
				<#include "/JQuery/item/money.ftl">
				<font style="font-size:2pt"><br /></font>
				<#include "/JQuery/item/companion.ftl">
				</td>
		</tr>
	</table>
	</div></div>
	<div id="battle" class="page hidden gone">
		<div id="battle-weapons"><div id="battle-scroll-1" class="scrollable">
			<#include "/JQuery/battle/weapons.ftl">
		</div></div>
		<div id="battle-rolls-1">
			<#include "/JQuery/battle/rolls-1.ftl">		
		</div>
		<div id="battle-rolls-2">
			<#include "/JQuery/battle/rolls-2.ftl">	
		</div>
		<div id="battle-hp">
			<#include "/JQuery/battle/hp.ftl">	
			</div>
		<div id="battle-counters"><div id="battle-scroll-2" class="scrollable">
			<#include "/JQuery/battle/counters.ftl">
		</div></div>
	</div>
	<div id="skills" class="page hidden gone">
		<#include "/JQuery/skills.ftl">	
	</div>
	<div id="qual" class="page hidden gone scrollable"><div id="qual-scroll" class="scrollable">
		<#include "/JQuery/qual.ftl">	
	</div></div>
	<div id="Sspell" class="page hidden gone"><div class="scrollable spell-scroll">
		<div id="resetUsed" class="reset"><i class="ra ra-cog"></i></div>
		<#include "/JQuery/sspell/domain.ftl">
		<#include "/JQuery/sspell/innate.ftl">
		<#include "/JQuery/sspell/spells.ftl">
	</div></div>
	<div id="Aspell" class="page hidden gone"><div class="scrollable spell-scroll">
		<#include "/JQuery/aspell/domain.ftl">
		<#include "/JQuery/aspell/innate.ftl">
		<#include "/JQuery/aspell/spells.ftl">
	</div></div>
</div>	
<#include "/JQuery/script.ftl">
</body>
</html>
