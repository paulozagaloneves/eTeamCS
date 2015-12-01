<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="editCompany.title" /></title>
<%--@ include file="submenu.jsp"--%>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>  
      <td><html:link onclick="javascript:;" href="javascript:history.back(-1);" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('cancel','','${ctx}/images/nuvola/medium/no.png',1);"><img src="${ctx}/images/nuvola/medium/no_gray.png" id="cancel" class="icon" title="Cancelar operação"/> <br/>Cancelar</html:link>&nbsp;</td>
      <c:if test="${readonly eq false or empty readonly}">
         <td><html:link onclick="javascript:;" href="javascript:if (validateSaveCompanyForm(document.saveCompanyForm)) document.saveCompanyForm.submit();" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('apply','','${ctx}/images/nuvola/medium/ok.png',1);"><img src="${ctx}/images/nuvola/medium/ok_gray.png" id="apply" class="icon" title="Gravar Dados"/> <br/>Ok</html:link>&nbsp;</td>     
      </c:if>
      <td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
   </tr>
   </table>
</div>

<div id="fullTransparentDIV" style="display: none; z-index: 1000; visibility: visible; position: absolute; opacity: 0.6; width: 100%; height: 100%; left: 0px; top: 0px;"></div>
<div id="content">

  <style type="text/css">
        <%-- img { border:0; }
        fieldset { border:0; }
        legend { font-weight: bold; font-size: 1.2em; }
        /*form { padding: 0.5em; width: 50%; background: #eee; }*/
        /*form div { clear: both; padding: 0.5em 0 0 0; }*/ --%>
        label { float: left; width: 20%; text-align: right; font-weight: bold; }
        .tabtitle { font-weight: bold;}
        textarea { height: 8em; }
       <%-- #mySubmit { float: none; margin: 0 0 0 30%; width: 20%; text-align: center; }
        #left-form { float:left; width:48%; }
        #right-form { float:right; width:48%; } --%>
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
    
<html:form action="/secure/company/saveCompany" method="post" onsubmit="return validateSaveCompanyForm(this);">     
<div class="box-body" style="width:99%">
  <div class="box-title">&nbsp;&nbsp;<fmt:message key="app.company.edit.frmtitle"/></div>
  <div class="icon_box"><img src="${ctx}/images/contacts/ab_add_company.png" width="32" height="32" title="<fmt:message key="app.contact.edit.frmtitle"/>"/></div>
  <div style="padding: 4px">	
  <div class="tab-pane" id="tab-pane-1">

      <div class="tab-page">
         <h2 class="tab">Ficha</h2>
         <table width="98%" cellspacing="0" cellpadding="0">
         <tr>
         <td>
				<div class="form-line"><label for="companyId"><fmt:message key="app.company.edit.lblcompanyid"/>:</label>&nbsp;&nbsp;<html:text property="companyId" readonly="true" maxlength="5" size="5"/></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblname"/>:</label>&nbsp;&nbsp;<html:text property="name" readonly="${readonly}" maxlength="50" size="35"/></div>
				<div class="form-line"><label for="streetAddress"><fmt:message key="app.company.edit.lblstreetaddress"/>:</label>&nbsp;&nbsp;<html:textarea property="streetAddress" readonly="${readonly}" cols="30" rows="5" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbairro"/>:</label>&nbsp;&nbsp;<html:text property="bairro" readonly="${readonly}" maxlength="50" size="35"/></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblpostalcode"/>:</label>&nbsp;&nbsp;<html:text property="postalCode" readonly="${readonly}" maxlength="20" size="20" /></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblcity"/>:</label>&nbsp;&nbsp;<html:text property="city" readonly="${readonly}" maxlength="20" size="20" /></div>		
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblstate"/>:</label>&nbsp;&nbsp;<html:text property="state" readonly="${readonly}" maxlength="50" size="20" /></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblcountry"/>:</label>&nbsp;&nbsp;
															<html:select property="country" style="width: 250px">
																	<html:option value="-999">---</html:option>
																	<html:optionsCollection label="name" value="acronym" name="countries"/>
															</html:select>
				</div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblphone"/>:</label>&nbsp;&nbsp;<html:text property="phone" readonly="${readonly}" maxlength="20" size="20" /></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblfax"/>:</label>&nbsp;&nbsp;<html:text property="fax" readonly="${readonly}" maxlength="20" size="20" /></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblemail"/>:</label>&nbsp;&nbsp;<html:text property="email" readonly="${readonly}" maxlength="50" size="35" /></div>
				<div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblurl"/>:</label>&nbsp;&nbsp;<html:text property="url" readonly="${readonly}" maxlength="50" size="35" /></div>
		      <div class="form-line"><label for="name"></label></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lbllastupdate"/>:</label>&nbsp;&nbsp;<html:text property="lastUpdate" readonly="true" maxlength="10" size="10"/>&nbsp;(dd/mm/aaaa)</div>
         </td>         
         <td valign="top">		     
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcomments"/>:</label>&nbsp;&nbsp;<html:textarea property="comments" readonly="${readonly}" cols="30" rows="5" /></div>  
         </td>
         </tr>
         </table>
         <div class="spacer">&nbsp;</div>
   </div>

   <div class="tab-page">
      <h2 class="tab">Contatos Assoc.</h2>
	      <div class="form-line"><div class="tabtitle">Contatos Associados</div></div>
	         <display:table name="contactsByCompany" class="list" requestURI="" id="contactsByCompanyList">
	             <display:column property="name" sortable="true" titleKey="contact.name" href="${ctx}/secure/contacts/editContact.do?readonly=true"
	                  paramId="id" paramProperty="contactId"  />
	             <display:column property="phone" sortable="false" titleKey="contact.phone"/>
	             <display:column property="cellular" sortable="false" titleKey="contact.cellular"/>
	         </display:table>
	         
	         <script type="text/javascript">highlightTableRows("contactsByCompanyList");</script> 
	            
   </div>
   <script type="text/javascript">setupAllTabs();</script>
   
   <div class="spacer">&nbsp;</div>
     <!-- Begin Validator Javascript Function-->
      <html:javascript formName="saveCompanyForm"/>
     <!-- End of Validator Javascript Function-->      
    </html:form>
    </div>
    </div>
    </div>