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
.divMessage {
   border: 2px solid red; 
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
   
      <div style="float:left; width:138px;"><img src="${ctx}/images/nuvola/extralarge/important.png" border="0" align="middle"/></div>
      <div style="float:left; width:190px;"><br/><br/><br/>&nbsp; Ocorreu um erro numa operação do banco de dados!<br/> Copie a mensagem de erro abaixo e envie para o seu administrador!</div>
      <div style="clear: both;">&nbsp;</div>
   </div>
</center>

<pre>
Mensagem de erro:
    <c:out value="${requestScope['org.apache.struts.action.EXCEPTION'].message}"/>
</pre>