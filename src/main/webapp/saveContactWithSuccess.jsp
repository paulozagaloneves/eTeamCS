<%@ include file="/taglibs.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>
      <td><html:link action="/secure/contacts/listContact" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('contacts','','${ctx}/images/contacts/ab_browse.png',1);"><img src="${ctx}/images/contacts/ab_browse_gray.png" id="contacts" class="icon" title="Contacts"/> <br/>Contatos</html:link>&nbsp;</td>     
       <td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
   </tr>
   </table>
</div>
<style type="text/css">
.divMessage {
   border: 2px solid #fc7116; 
   padding: 10px; 
   width: 350px;
   background-color: #ffffdd;
   font-size: 14px;
   font-weight: bold;
}
</style>
<br/><br/><br/><br/>
<center>
	<div align="center" class="divMessage">
      <div style="float:left; width:58px;"><img src="${ctx}/images/info.png" border="0" align="middle"/></div>
      <div style="float:left; width:250px; vertical-align: top;"><br/>&nbsp; Contacto salvo com sucesso!<br/> <br/><html:link action="/secure/contacts/listContact"><input type="button" class="button_info" onClick="javascript:document.location='${ctx}/secure/contacts/listContact.do'" value="Continuar"/></html:link></div>
      <div style="clear: both;">&nbsp;</div>
	</div>
</center>