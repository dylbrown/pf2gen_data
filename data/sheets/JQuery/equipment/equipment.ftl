<#macro equipmentRow item, isEven>
 <#if isEven><tr bgcolor="#DDDDDD"><#else><tr bgcolor="white"></#if>
        <td valign="top" class="border7">${item.stats.name}</td>
        <td valign="top" class="border7" align="center">${item.location}<br /></td>
        <td valign="top" class="border7" align="center">${item.count}<br /></td>
        <td valign="top" class="border7" align="center">${item.stats.prettyWeight}<br /></td>
        <td valign="top" class="border7" align="center">${item.stats.value} sp<br /></td>
       </tr>
</#macro>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="Equipment Table Left Column"> <!-- Equipment Table left pane -->
       <tr>
        <td valign="top" width="70%" class="border8"><b>ITEM</b></td>
        <td valign="top" width="12%" class="border8" align="center"><b>LOCATION</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>QTY</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>WT.</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>COST</b></td>
       </tr>
<#if (character.items?size > 0)>
	<#assign x=character.items?size / 2 - 1>
	<#list 0..x as i>
	  <@equipmentRow item=character.items[i] isEven=(i % 2 == 0)/>
	</#list>
</#if>
      </table>
     </td>
     <td width="50%" valign="top">
      <table width="100%" cellspacing="0" cellpadding="0" border="0" summary="Equipment Table Right Column"> <!-- Equipment Table right pane -->
       <tr>
        <td valign="top" width="70%" class="border8"><b>ITEM</b></td>
        <td valign="top" width="12%" class="border8" align="center"><b>LOCATION</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>QTY</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>WT.</b></td>
        <td valign="top" width="6%" class="border8" align="center"><b>COST</b></td>
       </tr>
<#if (character.items?size > 1)>
	<#list (x+1)..(character.items?size-1) as i>
	  <@equipmentRow item=character.items[i] isEven=(i % 2 == 0)/>
	</#list>
</#if>
      </table>
     </td>
    </tr>
   </table>
<!-- STOP Equipment Table -->