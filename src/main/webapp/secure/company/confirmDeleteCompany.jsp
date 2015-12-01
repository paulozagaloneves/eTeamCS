<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="editCompany.title" /></title>
<%--@ include file="submenu.jsp"--%>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>  
      <td><html:link onclick="javascript:;" href="javascript:history.back(-1);" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('cancel','','${ctx}/images/nuvola/medium/no.png',1);"><img src="${ctx}/images/nuvola/medium/no_gray.png" id="cancel" class="icon" title="Cancelar operação"/> <br/>Cancelar</html:link>&nbsp;</td>
      <c:if test="${empty contactsByCompany}">
         <td><html:link page="/secure/company/deleteCompany.do?id=${param.id}" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('delete','','${ctx}/images/contacts/delete_big.png',1);"><img src="${ctx}/images/contacts/delete_big_gray.png" id="delete" class="icon" title="Delete"/> <br/>Apagar</html:link>&nbsp;</td>
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
        legend { font-weight: bold; font-size: 1.2em; } --%>
        label {  float:left; width: 20%; vertical-align: top; text-align: right; font-weight: bold; }
        .tabtitle { font-weight: bold;}
        textarea { height: 8em; }
        <%--#mySubmit { float: none; margin: 0 0 0 30%; width: 20%; text-align: center; } 
        #left-form { width:48%;}
        #right-form {  width:48%; } --%>
        .form-line { padding-bottom: 4px; clear: both; }
        .form-group {   }
        <%-- hr { border-top: 1px solid silver; border-bottom:1px solid #eee; width:100%;  } --%>
        div.spacer {
            clear: both;
        }
    </style>

<c:if test="${!(empty contactsByCompany)}">
<center>   
   <div id="messageWarning" align="center">
      <img src="${ctx}/images/nuvola/extralarge/important.png" align="middle" width="32" height="32"/> Não pode remover esta empresa porque existem contatos associados!
   </div>
</center>
</c:if>
<c:if test="${empty contactsByCompany}">    
<center>   
   <div id="messageWarning" align="center">
      <img src="${ctx}/images/note.png" align="middle" width="16" height="16"/> Confirme os dados antes de remover!
   </div>
</center>
</c:if>   
<br/>  
<html:form action="/secure/company/saveCompany" method="post">   
<div class="box-body" style="width:99%">
  <div class="box-title">&nbsp;&nbsp;<fmt:message key="app.company.edit.frmtitle"/></div>
  <div class="icon_box"><img src="${ctx}/images/contacts/ab_add_company.png" width="32" height="32" title="<fmt:message key="app.contact.edit.frmtitle"/>"/></div>
  <div style="padding-left: 4px;">
   <div class="tab-pane" id="tab-pane-1">

   <div class="tab-page">
      <h2 class="tab">Ficha</h2>
         <table width="98%" cellspacing="0" cellpadding="0">
         <tr>
         <td>
		      <div class="form-line"><label for="companyId"><fmt:message key="app.company.edit.lblcompanyid"/>:</label>&nbsp;&nbsp;<html:text property="companyId" disabled="true" maxlength="5" size="5"/></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblname"/>:</label>&nbsp;&nbsp;<html:text property="name" disabled="true" maxlength="50" size="35"/></div>
		      <div class="form-line"><label for="streetAddress"><fmt:message key="app.company.edit.lblstreetaddress"/>:</label>&nbsp;&nbsp;<html:textarea property="streetAddress" disabled="true" cols="30" rows="5" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbairro"/>:</label>&nbsp;&nbsp;<html:text property="bairro" disabled="true" maxlength="50" size="35"/></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblpostalcode"/>:</label>&nbsp;&nbsp;<html:text property="postalCode" disabled="true" maxlength="20" size="20" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblcity"/>:</label>&nbsp;&nbsp;<html:text property="city" disabled="true" maxlength="20" size="20" /></div>      
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblstate"/>:</label>&nbsp;&nbsp;<html:text property="state" disabled="true" maxlength="50" size="20" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblcountry"/>:</label>&nbsp;&nbsp;
		                                       <html:select property="country" style="width: 250px" disabled="true">
		                                             <html:option value="-999">---</html:option>
		                                             <html:optionsCollection label="name" value="acronym" name="countries"/>
		                                       </html:select>
		      </div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblphone"/>:</label>&nbsp;&nbsp;<html:text property="phone" disabled="true" maxlength="20" size="20" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblfax"/>:</label>&nbsp;&nbsp;<html:text property="fax" disabled="true" maxlength="20" size="20" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblemail"/>:</label>&nbsp;&nbsp;<html:text property="email" disabled="true" maxlength="50" size="35" /></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lblurl"/>:</label>&nbsp;&nbsp;<html:text property="url" disabled="true" maxlength="50" size="35" /></div>
		      <div class="form-line"><label for="name"></label></div>
		      <div class="form-line"><label for="name"><fmt:message key="app.company.edit.lbllastupdate"/>:</label>&nbsp;&nbsp;<html:text property="lastUpdate" disabled="true" maxlength="10" size="10"/>&nbsp;(dd/mm/aaaa)</div>
		      
		   </td>
         <td>
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcategory"/>:</label>&nbsp;&nbsp;      
		         <html:select property="category" disabled="true" >
		            <html:option value="-999">---</html:option>
		            <html:optionsCollection label="name" value="categoryId" name="categories"/>
		         </html:select>
		         <%--html:text property="company.companyId" disabled="true" maxlength="50" size="40"/--%>
		      </div>
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblrelations"/>:</label>&nbsp;</div>
		      <div class="form-group">                  
		         <c:forEach var="item" items="${relations}" varStatus="status">
		            <div class="form-line"><label for="name">&nbsp;</label><input type="checkbox" name="relations" value="${item.relationId}" ${item.checked} disabled="true"/>&nbsp;<b>${item.name}</b></div> 
		         </c:forEach>
		      </div>
		      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcomments"/>:</label>&nbsp;&nbsp;<html:textarea property="comments" disabled="true" cols="30" rows="5" /></div>  
		      
		   </td>
         </tr>
         </table>
         <div class="spacer">&nbsp;</div>
   </div>

   <div class="tab-page">
      <h2 class="tab">Contatos Assoc.</h2>
 	   <div class="form-line"><div class="tabtitle">Contatos Associados</div></div>
			<display:table name="contactsByCompany" class="list" requestURI="" id="contactsByCompanyList">
			    <display:column property="name" sort="true" titleKey="contact.name" href="${ctx}/secure/contacts/editContact.do?readonly=true"
			         paramId="id" paramProperty="contactId"  />
			    <display:column property="phone" sort="false" titleKey="contact.phone"/>
			    <display:column property="cellular" sort="false" titleKey="contact.cellular"/>
			</display:table>
			
			<script type="text/javascript">highlightTableRows("contactsByCompanyList");</script> 
            
   </div>
   <script type="text/javascript">setupAllTabs();</script>
</div>  
   <div class="spacer">
  		&nbsp;
		</div>     
   
    </div>
     </html:form>
    </div>
    </div>