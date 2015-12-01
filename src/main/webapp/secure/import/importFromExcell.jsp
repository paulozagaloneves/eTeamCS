<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="editContact.title" /></title>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>  
      <td><html:link onclick="javascript:;" href="javascript:history.back(-1);" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('cancel','','${ctx}/images/nuvola/medium/no.png',1);"><img src="${ctx}/images/nuvola/medium/no_gray.png" id="cancel" class="icon" title="Cancelar operação"/> <br/>Cancelar</html:link>&nbsp;</td>
      <c:if test="${readonly eq false or empty readonly}">
         <td><html:link onclick="javascript:;" href="javascript: if (validateSaveContactForm(document.saveContactForm)) document.saveContactForm.submit();" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('apply','','${ctx}/images/nuvola/medium/ok.png',1);"><img src="${ctx}/images/nuvola/medium/ok_gray.png" id="apply" class="icon" title="Gravar Dados"/> <br/>Ok</html:link>&nbsp;</td>     
      </c:if>
      <td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
   </tr>
   </table>
</div>
<script type="text/javascript">
   function popup_companies() {
     var window_defs="width=600,height=300,titlebar=no,status=no,scrollbars=yes,resizable=yes,menubar=no,location=no,hotkeys=no";
      window.open('${ctx}/secure/contacts/popup_companies.do?varname=companyName&varid=hidden_companyId','popup_companies',window_defs);
      
      return true;
   }
</script>
<div id="fullTransparentDIV" style="display: none; z-index: 1000; visibility: visible; position: absolute; opacity: 0.6; width: 100%; height: 100%; left: 0px; top: 0px;"></div>
<div id="content">

  <style type="text/css">
        img { border:0; }
        fieldset { border:0; }
        legend { font-weight: bold; font-size: 1.2em; }
        /*form { padding: 0.5em; width: 50%; background: #eee; }*/
        /*form div { clear: both; padding: 0.5em 0 0 0; }*/
        label { float: left; width: 20%; text-align: right; font-weight: bold; }
        textarea { height: 8em; }
        #mySubmit { float: none; margin: 0 0 0 30%; width: 20%; text-align: center; }
        #left-form { float:left; width:48%; }
        #right-form { float:right; width:48%; }
        #unique-form { float:left; width:96%; }
        .form-line { padding-bottom: 4px; clear: both; }
        .form-group {   }
        input[readonly="readonly"],textarea[readonly="readonly"] {background: #ffd;}
        <c:if test="${readonly eq true}">
        #left-form input,#left-form textarea,#left-form select  {background: #ffd;}
        #right-form input,#right-form textarea,#right-form select  {background: #ffd;}
        </c:if>
        hr { border-top: 1px solid silver; border-bottom:1px solid #eee; width:100%;  }
        div.spacer {
            clear: both;
        }
    </style>
   
<logic:messagesPresent>
<div id="errors"> 
    <html:messages id="error">
        <bean:write name="error"/><BR>
    </html:messages>
</div>    
</logic:messagesPresent>     

<div class="box-body" style="width:99%">
  <div class="box-title">&nbsp;&nbsp;<fmt:message key="app.import.excell.frmtitle"/></div>
  <div class="icon_box"><img src="${ctx}/images/contacts/add_contact.png" width="32" height="32" title="<fmt:message key="app.import.excell.frmtitle"/>"/></div>
  <div style="padding: 2px">

    <html:form action="/secure/import/importContacts" method="post" enctype="multipart/form-data">
    <div id="unique-form">
        <div class="form-line"><label for="lblfileupload"><fmt:message key="app.import.excell.lblfileupload"/>:</label>&nbsp;&nbsp;<html:file property="fileName" size="40"/> &nbsp;<html:submit>Upload File</html:submit></div>
    </div>
    <div class="spacer">&nbsp;</div>
    <div class="spacer">&nbsp;</div>
    </html:form>
   </div>
   </div>
   </div>
