<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="deleteContact.title" /></title>
<div id="subMenu"> 
   <table border="0" cellpadding="0" cellspacing="0" align="right" width="250px">
   <tr>  
      <td><html:link onclick="javascript:;" href="javascript:history.back(-1);" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('cancel','','${ctx}/images/nuvola/medium/no.png',1);"><img src="${ctx}/images/nuvola/medium/no_gray.png" id="cancel" class="icon" title="Cancelar operação"/> <br/>Cancelar</html:link>&nbsp;</td>
      <td><html:link page="/secure/contacts/deleteContact.do?id=${param.id}" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('delete','','${ctx}/images/contacts/delete_big.png',1);"><img src="${ctx}/images/contacts/delete_big_gray.png" id="delete" class="icon" title="Delete"/> <br/>Apagar</html:link>&nbsp;</td>
      <td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
   </tr>
   </table>
</div>

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
        .form-line { padding-bottom: 4px; clear: both; }
        .form-group {   }

        hr { border-top: 1px solid silver; border-bottom:1px solid #eee; width:100%;  }
        div.spacer {
  			clear: both;
  		}
    </style>
   
<center>   
   <div id="messageWarning" align="center">
      <img src="${ctx}/images/note.png" align="middle" width="16" height="16"/> Confirme os dados antes de remover!
   </div>
</center>
   
<br/>
<div class="box-body" style="width:99%">
  <div class="box-title">&nbsp;&nbsp;<fmt:message key="app.contact.edit.frmtitle"/></div>
  <div class="icon_box"><img src="${ctx}/images/contacts/add_contact.png" width="32" height="32" title="<fmt:message key="app.contact.edit.frmtitle"/>"/></div>
  <div style="padding: 2px">

	<html:form action="/secure/contacts/saveContact" method="post">
	<div id="left-form">
		<div class="form-line"><label for="contactId"><fmt:message key="app.contact.edit.lblcontactid"/>:</label>&nbsp;&nbsp;<html:text property="contactId" readonly="true" maxlength="5" size="5" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblname"/>:</label>&nbsp;&nbsp;<html:text property="name" readonly="${readonly}" maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lbltitleinitials"/>:</label>&nbsp;&nbsp;<html:text property="title" readonly="${readonly}" maxlength="10" size="10" disabled="true"/>
         																			<html:text property="initials" readonly="${readonly}" maxlength="10" size="10"/></div>
        <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblsex"/>:</label>&nbsp;&nbsp;<html:radio property="sex" value="M" /> <fmt:message key="app.contact.edit.lblmale"/>
        																	<html:radio property="sex" value="F" /> <fmt:message key="app.contact.edit.lblfemale"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbirthday"/>:</label>&nbsp;&nbsp;<html:text property="birthday" readonly="${readonly}" maxlength="10" size="10" disabled="true"/>&nbsp;(dd/mm/aaaa)</div>				
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblstreetaddress"/>:</label>&nbsp;&nbsp;<html:textarea property="streetAddress" readonly="${readonly}" cols="30" rows="5" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbairro"/>:</label>&nbsp;&nbsp;<html:text property="bairro" readonly="${readonly}" maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblpostalcode"/>:</label>&nbsp;&nbsp;<html:text property="postalCode" readonly="${readonly}" maxlength="20" size="20" disabled="true" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcity"/>:</label>&nbsp;&nbsp;<html:text property="city" readonly="${readonly}" maxlength="20" size="20" disabled="true" /></div>		
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblstate"/>:</label>&nbsp;&nbsp;<html:text property="state" readonly="${readonly}" maxlength="50" size="20" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcountry"/>:</label>&nbsp;&nbsp;
													<html:select property="country" style="width: 250px" disabled="true">
															<html:option value="-999">---</html:option>
															<html:optionsCollection label="name" value="acronym" name="countries"/>
													</html:select>
		</div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblphone"/>:</label>&nbsp;&nbsp;<html:text property="phone" readonly="${readonly}" maxlength="20" size="20" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfax"/>:</label>&nbsp;&nbsp;<html:text property="fax" readonly="${readonly}" maxlength="20" size="20" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcellular"/>:</label>&nbsp;&nbsp;<html:text property="cellular" readonly="${readonly}" maxlength="20" size="20" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblemail"/>:</label>&nbsp;&nbsp;<html:text property="email" readonly="${readonly}" maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblemail"/> 2:</label>&nbsp;&nbsp;<html:text property="email2" readonly="${readonly}" maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblurl"/>:</label>&nbsp;&nbsp;<html:text property="url" readonly="${readonly}" maxlength="50" size="35" disabled="true"/></div>
      
      <div class="form-line"><label for="name"></label></div>
      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lbllastupdate"/>:</label>&nbsp;&nbsp;<html:text property="lastUpdate" readonly="${readonly}" maxlength="10" size="10" disabled="true"/>&nbsp;(dd/mm/aaaa)</div>
	</div>
	<div id="right-form">
		<html:hidden property="company.companyId" styleId="hidden_companyId"/>
			<div class="form-line"><label for="company"><fmt:message key="app.contact.edit.lblcompany"/>:</label>&nbsp;&nbsp;<input type="text" name="companyName" id="companyName" value="${companyName}" class="readonly_input" readonly="true" style="width: 220px" disabled="true"/>
      </div>
		
		<%--div class="form-line"><label for="company"><fmt:message key="app.contact.edit.lblcompany"/>:</label>&nbsp;&nbsp;
			<html:select property="company.companyId" style="width: 250px">
				<html:option value="-999">---</html:option>
				<html:optionsCollection label="name" value="companyId" name="companies"/>
			</html:select--%>
			<%--html:text property="company.companyId" readonly="${readonly}" maxlength="50" size="40"/>
		</div--%>
		
		<div class="form-line"><label for="department"><fmt:message key="app.contact.edit.lbldepartment"/>:</label>&nbsp;&nbsp;<html:text property="department"  maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfunction"/>:</label>&nbsp;&nbsp;<html:text property="function"  maxlength="50" size="35" disabled="true"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblphonework"/>:</label>&nbsp;&nbsp;<html:text property="phoneWork"  maxlength="20" size="20" disabled="true"/></div>	
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfaxwork"/>:</label>&nbsp;&nbsp;<html:text property="faxWork"  maxlength="20" size="20" disabled="true" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcellularwork"/>:</label>&nbsp;&nbsp;<html:text property="cellularWork"  maxlength="20" size="20" disabled="true"/></div>
		<%--div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcolor"/>:</label>&nbsp;&nbsp;<html:text property="color"  maxlength="20" size="20" /></div --%>		
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcategory"/>:</label>&nbsp;&nbsp;		
			<html:select property="category" disabled="true">
				<html:option value="-999">---</html:option>
				<html:optionsCollection label="name" value="categoryId" name="categories"/>
			</html:select>
			<%--html:text property="company.companyId"  maxlength="50" size="40"/--%>
		</div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblrelations"/>:</label>&nbsp;</div>
		<div class="form-group">						
			<c:forEach var="item" items="${relations}" varStatus="status">
				<div class="form-line"><label for="name">&nbsp;</label><input type="checkbox" name="relations" value="${item.relationId}" ${item.checked} disabled="true"/>&nbsp;<b>${item.name}</b></div>	
			</c:forEach>
		</div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcomments"/>:</label>&nbsp;&nbsp;<html:textarea property="comments"  cols="30" rows="5" disabled="true" /></div>	
	</div>
	
	<div class="spacer">&nbsp;</div>

	
	<%-- div style="width:100%" align="right">
		<hr/>
		<html:button styleClass="button" property="btnCancel" onclick="javascript:history.back(-1);"><fmt:message key="button.common.close"/></html:button>&nbsp;	
		<c:if test="${readonly eq false or empty readonly}">
			<html:submit styleClass="button_info"><fmt:message key="button.common.save"/></html:submit>
		</c:if>
		<!--input type="button" class="button" onclick="submitData();" value="Gravar"/-->
	</div --%>
	

      <div class="spacer">
  		&nbsp;
		</div>
    </html:form>
     <!-- Begin Validator Javascript Function-->
		<html:javascript formName="saveContactForm"/>
	  <!-- End of Validator Javascript Function-->
    </div>
    </div>
    </div>