<!-- START Companions Tables -->
<#if (pcvar("FOLLOWERTYPE.Familiar") > 0) >
    <table cellpadding="0" cellspacing="0" border="0" width="100%" summary="Familiar Table">
     <tr>
      <td bgcolor="black" align="left" class="border" colspan="12"><font color="white" style="font-size: 11pt"><b>Familiar: ${pcstring('FOLLOWERTYPE.FAMILIAR.0.NAME')} (${pcstring('FOLLOWERTYPE.FAMILIAR.0.RACE')})</b></font></td>
     </tr>
     <tr>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>FORT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.CHECK.FORTITUDE.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>REF:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.CHECK.REFLEX.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>WILL:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.CHECK.2.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>HP:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.HP')}</td>
      <td width="8%" bgcolor="black" align="center" class="border" ><font color="white" style="font-size: 8pt"><b>AC:</b></font></td>
      <td width="8%" align="center" class="border" >${pcstring('FOLLOWERTYPE.FAMILIAR.0.AC.Total')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>INIT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.INITIATIVEMOD')}</td>
     </tr>
<@loop from=0 to=pcvar('COUNT[FOLLOWERTYPE.FAMILIAR.0.EQTYPE.WEAPON]-1') ; wep , wep_has_next> <#-- TODO: Loop was of early exit type 1 -->
     <tr>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 10pt"><b>${pcstring('FOLLOWERTYPE.FAMILIAR.0.WEAPON.${wep}.NAME')}</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.WEAPON.${wep}.TOTALHIT')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>DAMAGE:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.WEAPON.${wep}.DAMAGE')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>CRITICAL:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.FAMILIAR.0.WEAPON.${wep}.CRIT')}/x${pcstring('FOLLOWERTYPE.FAMILIAR.0.WEAPON.${wep}.MULT')}</td>
      </tr>
</@loop>
     <tr>
      <td bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>Special:</b></font></td>
      <td align="left" class="border" colspan="12"><font style="font-size: 9pt">&nbsp;&nbsp;${pcstring('FOLLOWERTYPE.FAMILIAR.0.SPECIALLIST')}</font></td>
     </tr>
     <tr>
     </tr>
    </table>
   <font style="font-size:2pt"><br /></font>
</#if>
<#if (pcvar("FOLLOWERTYPE.SPECIAL MOUNT") > 0) >
    <table cellpadding="0" cellspacing="0" border="0" width="100%" summary="Special Mount Table">
     <tr>
      <td bgcolor="black" align="left" class="border" colspan="12"><font color="white" style="font-size: 11pt"><b>Special Mount: ${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.NAME')} (${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.RACE')})</b></font></td>
     </tr>
     <tr>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>FORT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.CHECK.FORTITUDE.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>REF:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.CHECK.REFLEX.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>WILL:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.CHECK.2.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>HP:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.HP')}</td>
      <td width="8%" bgcolor="black" align="center" class="border" ><font color="white" style="font-size: 8pt"><b>AC:</b></font></td>
      <td width="8%" align="center" class="border" >${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.AC.Total')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>INIT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.INITIATIVEMOD')}</td>
     </tr>
<@loop from=0 to=pcvar('COUNT[FOLLOWERTYPE.SPECIAL MOUNT.0.EQTYPE.WEAPON]-1') ; wep , wep_has_next> <#-- TODO: Loop was of early exit type 1 -->
     <tr>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 10pt"><b>${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.WEAPON.${wep}.NAME')}</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.WEAPON.${wep}.TOTALHIT')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>DAMAGE:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.WEAPON.${wep}.DAMAGE')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>CRITICAL:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.WEAPON.${wep}.CRIT')}/x${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.WEAPON.${wep}.MULT')}</td>
      </tr>
</@loop>
     <tr>
      <td bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>Special:</b></font></td>
      <td align="left" class="border" colspan="12"><font style="font-size: 9pt">&nbsp;&nbsp;${pcstring('FOLLOWERTYPE.SPECIAL MOUNT.0.SPECIALLIST')}</font></td>
     </tr>
     <tr>
     </tr>
    </table>
   <font style="font-size:2pt"><br /></font>
</#if>
<#if (pcvar("FOLLOWERTYPE.ANIMAL COMPANION") > 0) >
<@loop from=0 to=pcvar('COUNT[FOLLOWERTYPE.ANIMAL COMPANION]-1') ; anm , anm_has_next>
    <table cellpadding="0" cellspacing="0" border="0" width="100%" summary="Animal Companion Table">
     <tr>
      <td bgcolor="black" align="left" class="border" colspan="12"><font color="white" style="font-size: 11pt"><b>Animal Companion: ${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.NAME')} (${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.RACE')})</b></font></td>
     </tr>
     <tr>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>FORT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.CHECK.FORTITUDE.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>REF:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.CHECK.REFLEX.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>WILL:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.CHECK.2.TOTAL')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>HP:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.HP')}</td>
      <td width="8%" bgcolor="black" align="center" class="border" ><font color="white" style="font-size: 8pt"><b>AC:</b></font></td>
      <td width="8%" align="center" class="border" >${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.AC.Total')}</td>
      <td width="8%" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 8pt"><b>INIT:</b></font></td>
      <td width="8%" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.INITIATIVEMOD')}</td>
     </tr>
<@loop from=0 to=pcvar('COUNT[FOLLOWERTYPE.ANIMAL COMPANION.${anm}.EQTYPE.WEAPON]-1') ; wep , wep_has_next> <#-- TODO: Loop was of early exit type 1 -->
     <tr>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 10pt"><b>${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.WEAPON.${wep}.NAME')}</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.WEAPON.${wep}.TOTALHIT')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>DAMAGE:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.WEAPON.${wep}.DAMAGE')}</td>
      <td colspan="2" bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>CRITICAL:</b></font></td>
      <td colspan="2" align="center" class="border">${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.WEAPON.${wep}.CRIT')}/x${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.WEAPON.${wep}.MULT')}</td>
      </tr>
</@loop>
     <tr>
      <td bgcolor="black" align="center" class="border"><font color="white" style="font-size: 9pt"><b>Special:</b></font></td>
      <td align="left" class="border" colspan="11"><font style="font-size: 9pt">&nbsp;&nbsp;${pcstring('FOLLOWERTYPE.ANIMAL COMPANION.${anm}.SPECIALLIST')}<br /></font></td>
     </tr>
    </table>
   <font style="font-size:2pt"><br /></font>
</@loop>
<!-- STOP Companions Table1 -->
</#if>
<#if (pcvar("FOLLOWERTYPE.FOLLOWERS") > 0) >
    <table width="100%" cellspacing="0" cellpadding="3" summary="Henchmen Table">
     <tr>
      <td bgcolor="black" align="center" colspan="1"><font color="white" style="font-size: 9pt"><b>HENCHMEN</b></font></td>
     </tr>
     <tr>
      <td valign="top" width="70%" class="border8">
<@loop from=0 to=pcvar('COUNT[FOLLOWERTYPE.FOLLOWERS]-1') ; follower , follower_has_next> <#-- TODO: Loop was of early exit type 1 -->
${pcstring('FOLLOWERTYPE.FOLLOWERS.${follower}.NAME')},&nbsp;
</@loop>
      </td>
     </tr>
    </table>
<!-- STOP Companions Table1 -->
</#if>
<#if (pcvar("MISC.COMPANIONS") > 0) >
<!-- START Misc Companions Table -->
    <table width="100%" cellspacing="0" cellpadding="3" summary="Misc. Magic Table">
     <tr>
      <td bgcolor="black" align="center" colspan="1"><font color="white" style="font-size: 9pt"><b>OTHER COMPANIONS</b></font></td>
     </tr>
     <tr>
      <td valign="top" width="70%" class="border8"><span class="notes">${pcstring('MISC.COMPANIONS')}<span class="notes"></td>
     </tr>
    </table>
<font style="font-size:2pt"><br /></font>
<!-- STOP Misc Companions Table -->
</#if>