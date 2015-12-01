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
   
  function objectEval(text)
  {
    // eval() breaks when we use it to get an object using the { a:42, b:'x' }
    // syntax because it thinks that { and } surround a block and not an object
    // So we wrap it in an array and extract the first element to get around
    // this.
    // This code is only needed for interpreting the parameter input fields,
    // so you can ignore this for normal use.
    // The regex = [start of line][whitespace]{[stuff]}[whitespace][end of line]
    text = text.replace(/\n/g, ' ');
    text = text.replace(/\r/g, ' ');
    if (text.match(/^\s*\{.*\}\s*$/))
    {
      text = '[' + text + '][0]';
    }
    
    return eval(text);
  }
   
</script>
<script type='text/javascript' src='/eTeamCS/dwr/interface/Category.js'></script>
<script type='text/javascript' src='/eTeamCS/dwr/engine.js'></script>
<script type='text/javascript' src='/eTeamCS/dwr/util.js'></script>

<div id="fullTransparentDIV" style="display: none; z-index: 1000; visibility: visible; position: absolute; opacity: 0.6; width: 100%; height: 100%; left: 0px; top: 0px;"></div>
<div id="content">

  <style type="text/css">
        img { border:0; }
        fieldset { border:0; }
        legend { font-weight: bold; font-size: 1.2em; }
        /*form { padding: 0.5em; width: 50%; background: #eee; }*/
        /*form div { clear: both; padding: 0.5em 0 0 0; }*/
        label { float: left; width: 30%; text-align: right; font-weight: bold; }
        textarea { height: 8em; }
        #mySubmit { float: none; margin: 0 0 0 30%; width: 20%; text-align: center; }
        #left-form { float:left; width:48%;}
        #right-form { float:right; width:48%;}
        .form-line { padding-bottom: 4px; clear: both; width: 100%;  white-space:nowrap; text-align: left;}
        .form-group {   }
        input[readonly="readonly"],textarea[readonly="readonly"] {background: #ffd;}
        
        <c:if test="${readonly eq true}">
        #left-form input,#left-form textarea,#left-form select  {background: #ffd;}
        #right-form input,#right-form textarea,#right-form select  {background: #ffd;}
        input {background: #ffd;}
        </c:if>
        hr { border-top: 1px solid silver; border-bottom:1px solid #eee; width:100%;  }
        div.spacer {
  			clear: both;
  		}
  		div.box {
            float: left;
            border: 1px solid #ddd;
            width: 300px;
            height: auto;
  		}
  		
		.left {
		    float:left;
		    width: 300px;
		}
		
		.center {
		    float:left;
		    width: 300px;
		}
		.right {
		    float:left;
		}
  		
  		
    </style>
   
<logic:messagesPresent>
<div id="errors"> 
    <html:messages id="error">
        <bean:write name="error"/><BR>
    </html:messages>
</div>    
</logic:messagesPresent>     

<html:form action="/secure/contacts/saveContact" method="post" onsubmit="return validateSaveContactForm(this);">
<div class="box-body" style="width:99%">
  <div class="box-title">&nbsp;&nbsp;<fmt:message key="app.contact.edit.frmtitle"/></div>
  <div class="icon_box"><img src="${ctx}/images/contacts/add_contact.png" width="32" height="32" title="<fmt:message key="app.contact.edit.frmtitle"/>"/></div>
  <div style="padding: 2px">
  <div class="tab-pane" id="tab-pane-2">

      <div class="tab-page" align="center">
      <h2 class="tab">Geral</h2>

      <table width="98%" cellspacing="0" cellpadding="4">
      <tr>
       <td>
		<div class="title">Nome</div>&nbsp;
		<div class="form-line"><label for="contactId"><fmt:message key="app.contact.edit.lblcontactid"/>:</label>&nbsp;&nbsp;<html:text property="contactId" readonly="true" maxlength="5" size="5"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblname"/>:</label>&nbsp;&nbsp;<html:text property="name" readonly="${readonly}" maxlength="50" size="50"/></div>
		<!--  div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lbltitleinitials"/>:</label>&nbsp;&nbsp;<html:text property="title" readonly="${readonly}" maxlength="10" size="10"/>
         																			<html:text property="initials" readonly="${readonly}" maxlength="10" size="10"/></div -->
        <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblsex"/>:</label>&nbsp;&nbsp;<html:radio property="sex" value="M" /> <fmt:message key="app.contact.edit.lblmale"/>
        																	<html:radio property="sex" value="F" /> <fmt:message key="app.contact.edit.lblfemale"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbirthday"/>:</label>&nbsp;&nbsp;<html:text property="birthday" readonly="${readonly}" maxlength="10" size="10"/>&nbsp;(dd/mm/aaaa)</div>				
		<div class="spacer">&nbsp;</div>
		<div class="form-line"><label for="department"><fmt:message key="app.contact.edit.lbldepartment"/>:</label>&nbsp;&nbsp;<html:text property="department" readonly="${readonly}" maxlength="50" size="35"/></div>
		<div class="form-line"><label for="indication"><fmt:message key="app.contact.edit.lblindication"/>:</label>&nbsp;&nbsp;<html:text property="indication" readonly="${readonly}" maxlength="50" size="35"/></div>

		<div class="spacer">&nbsp;</div>
		<div class="title">Endereço</div>&nbsp;
     		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblstreetaddress"/>:</label>&nbsp;&nbsp;<html:textarea property="streetAddress" readonly="${readonly}" cols="30" rows="4" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblbairro"/>:</label>&nbsp;&nbsp;<html:text property="bairro" readonly="${readonly}" maxlength="50" size="35"/></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblpostalcode"/>:</label>&nbsp;&nbsp;<html:text property="postalCode" readonly="${readonly}" maxlength="20" size="20" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcity"/>:</label>&nbsp;&nbsp;<html:text property="city" readonly="${readonly}" maxlength="20" size="20" /></div>		
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblstate"/>:</label>&nbsp;&nbsp;<html:text property="state" readonly="${readonly}" maxlength="50" size="20" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcountry"/>:</label>&nbsp;&nbsp;
													<html:select property="country" style="width: 250px">
															<html:option value="-999">---</html:option>
															<html:optionsCollection label="name" value="acronym" name="countries"/>
													</html:select>
		</div>
		
		    
	 </td>         
     <td valign="top">
		<div class="title">Telefones</div>&nbsp;
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblphone"/>:</label>&nbsp;&nbsp;<html:text property="phone" readonly="${readonly}" maxlength="20" size="35" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfax"/>:</label>&nbsp;&nbsp;<html:text property="fax" readonly="${readonly}" maxlength="20" size="35" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcellular"/>:</label>&nbsp;&nbsp;<html:text property="cellular" readonly="${readonly}" maxlength="20" size="35" /></div>

		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblphonework"/>:</label>&nbsp;&nbsp;<html:text property="phoneWork" readonly="${readonly}" maxlength="20" size="35" /></div>	
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfaxwork"/>:</label>&nbsp;&nbsp;<html:text property="faxWork" readonly="${readonly}" maxlength="20" size="35" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblcellularwork"/>:</label>&nbsp;&nbsp;<html:text property="cellularWork" readonly="${readonly}" maxlength="20" size="35" /></div>
		
		<div class="spacer">&nbsp;</div>
		<div class="spacer">&nbsp;</div>
			<div class="title">Email / Página Web</div>&nbsp;
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblemail"/>:</label>&nbsp;&nbsp;<html:text property="email" readonly="${readonly}" maxlength="50" size="35" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblemail"/> 2:</label>&nbsp;&nbsp;<html:text property="email2" readonly="${readonly}" maxlength="50" size="35" /></div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblurl"/>:</label>&nbsp;&nbsp;<html:text property="url" readonly="${readonly}" maxlength="50" size="35" /></div>
			
					<div class="title">Empresa</div>&nbsp;  
				<html:hidden property="company.companyId" styleId="hidden_companyId"/>
			<div class="form-line"><label for="company"><fmt:message key="app.contact.edit.lblcompany"/>:</label>&nbsp;&nbsp;<input type="text" name="companyName" id="companyName" value="${companyName}" class="readonly_input" readonly="true" style="width: 250px"/>
         <c:if test="${readonly ne true}">
	        <a href="javascript:;" onClick="popup_companies();"><img src="${ctx}/images/contacts/ab_companies_24x24.png" width="24" height="24" align="middle" title="Procurar empresa" /></a>
         </c:if>
      </div>
		<div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lblfunction"/>:</label>&nbsp;&nbsp;<html:text property="function" readonly="${readonly}" maxlength="50" size="35" /></div>
		
	
	  <div class="form-line"><label for="name"></label></div>
      <div class="form-line"><label for="name"><fmt:message key="app.contact.edit.lbllastupdate"/>:</label>&nbsp;&nbsp;<html:text property="lastUpdate" readonly="true" maxlength="10" size="10"/>&nbsp;(dd/mm/aaaa)</div>
			
    </td>
         </tr>
         </table>
	
	<div class="spacer">&nbsp;</div>

	</div>

   <div class="tab-page" align="left">
      <h2 class="tab">Categorias</h2>
      <div class="title">Categorias</div>&nbsp;
          <table cellspacing="0" cellpadding="4">
	      <tr>
	       <td valign="top" width="250" align="left">                  
	            <c:forEach var="item" items="${categories}" varStatus="status">            
	                <c:if test="${item.column eq 0}">
	                      <div class="form-line"><label for="name"></label></div>
	                      <c:if test="${!empty(item.parentId)}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
	                      <input type="checkbox" name="categories" value="${item.categoryId}" ${item.checked}/><b>${item.name}</b>                    
	                </c:if>
	            </c:forEach>
            </td>
            <td valign="top" width="250" align="left">                  
	            <c:forEach var="item" items="${categories}" varStatus="status">            
	                <c:if test="${item.column eq 1}">
	                      <div class="form-line"><label for="name"></label></div>
	                      <c:if test="${!empty(item.parentId)}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
	                      <input type="checkbox" name="categories" value="${item.categoryId}" ${item.checked}/><b>${item.name}</b>                    
	                </c:if>
	            </c:forEach>
            </td>
            <td valign="top" width="250" align="left">                 
	            <c:forEach var="item" items="${categories}" varStatus="status">            
	                <c:if test="${item.column eq 2}">
	                      <div class="form-line"><label for="name"></label></div>
	                      <c:if test="${!empty(item.parentId)}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
	                      <input type="checkbox" name="categories" value="${item.categoryId}" ${item.checked}/><b>${item.name}</b>                    
	                </c:if>
	            </c:forEach>
            </td>
            </tr>
            </table>
            <div class="spacer">&nbsp;</div>
    </div>
	<%-- div style="width:100%" align="right">
		<hr/>
		<html:button styleClass="button" property="btnCancel" onclick="javascript:history.back(-1);"><fmt:message key="button.common.close"/></html:button>&nbsp;	
		<c:if test="${readonly eq false or empty readonly}">
			<html:submit styleClass="button_info"><fmt:message key="button.common.save"/></html:submit>
		</c:if>
		<!--input type="button" class="button" onclick="submitData();" value="Gravar"/-->
	</div --%>
	<div class="tab-page">
      <h2 class="tab">Comentários</h2>
      <div class="title">Comentários</div>&nbsp;
		<div class="form-line">&nbsp;&nbsp;<html:textarea property="comments" readonly="${readonly}" cols="80" rows="25" style="height: 300px;" /></div>

      
    </div>
    <div class="tab-page">
    <h2 class="tab">Admin</h2>
      <div class="title">Admin</div>&nbsp;
  <script type="text/javascript">
    var reply2 = function(data)
    {
    	dwr.util.removeAllOptions('categorias');
    	dwr.util.addOptions('categorias',data, 'categoryId', 'name');
      /*if (data != null && typeof data == 'object') alert(dwr.util.toDescriptiveString(data, 2));
      else dwr.util.setValue('d2', dwr.util.toDescriptiveString(data, 1));*/
    }
    Category.getAllParentCategories(reply2);
    var reply3 = function(data)
    {
    	dwr.util.removeAllOptions('subcategorias');
    	dwr.util.addOptions('subcategorias',data, 'categoryId', 'name');
    }
    
    function addCategory(name,parentId)
  	{ 
  		var vParentId = 'null';

  		if (parentId!='null') { vParentId=parentId; }

     	var category='{categoryId:null, column:null, name:"'+name+'", parentId:'+vParentId+'}';
     	
     	Category.saveCategory(objectEval(category));
     	if (vParentId == null) {
     		alert('refresh');
     		Category.getAllParentCategories(reply2);
     	} else {
     		Category.getAllCategoriesByParentId(objectEval(vParentId+''),reply3);     		
     	}
    }
  </script>
        <table width="100%">
        <tr>
        	<td><b>Categorias</b></td>
        	<td width="75px">&nbsp;</td>
        	<td><b>Subcategorias</b></td>
        </tr>
        <tr>
        	<td>
        		<select name="categorias" id="categorias" style="width: 250px" multiple="true" size="15" onChange="Category.getAllCategoriesByParentId(objectEval(dwr.util.byId('categorias').value),reply3);dwr.util.setValue('newcategory',DWRUtil.getText('categorias'));">
	  			</select>
			</td>
        	<td>&nbsp;</td>
        	<td>
        		<select name="subcategorias" id="subcategorias" style="width: 250px" multiple="true" size="15" onChange="dwr.util.setValue('newsubcategory',DWRUtil.getText('subcategorias'));">
					<option value="-999">Selecione uma categoria</option>
	  			</select>
			</td>
        </tr>
        <tr>
        	<td><input type="text" name="newcategory" >&nbsp;&nbsp;<input type="button" onclick="addCategory(DWRUtil.getValue('newcategory'),null)" value=" + ">&nbsp;&nbsp;<input type="button" onclick="" value=" - "></td>
        	<td></td>
        	<td><input type="text" name="newsubcategory" >&nbsp;&nbsp;<input type="button" onclick="addCategory(DWRUtil.getValue('newsubcategory'),DWRUtil.getValue('categorias'))" value=" + ">&nbsp;&nbsp;<input type="button" onclick="" value=" - "></td>

        </tr>
        </table>

      
    </div>
    
    
    <script type="text/javascript">setupAllTabs();</script>
      <div class="spacer">
  		&nbsp;
		</div>
    
     <!-- Begin Validator Javascript Function-->
		<html:javascript formName="saveContactForm" />
	  <!-- End of Validator Javascript Function-->
	  </html:form>
    </div>
    </div>
    </div>