<%@ include file="/taglibs.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>  
      <td><html:link onclick="javascript:;" href="javascript:history.back(-1);" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('cancel','','${ctx}/images/nuvola/medium/back.png',1);"><img src="${ctx}/images/nuvola/medium/back_gray.png" id="cancel" class="icon" title="Voltar"/> <br/>Voltar</html:link>&nbsp;</td>
      <td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
   </tr>
   </table>
</div>
<style type="text/css">
.divAccessDenied {
   border: 2px solid red; 
   padding: 10px; 
   width: 300px;
   background-color: #ffffdd;
   font-size: 14px;
   font-weight: bold;
}
</style>
<br/><br/><br/><br/>
<center>
	<div align="center" class="divAccessDenied">
		<img src="${ctx}/images/nuvola/extralarge/agent.png" border="0" align="middle"/>
		&nbsp; Acesso negado!
	</div>
</center>