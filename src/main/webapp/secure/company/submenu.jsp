<div id="subMenu"> 
	<table border="0" cellpadding="0" cellspacing="0" align="right" width="450px">
	<tr> 	
		<td><html:link page="/secure/contacts/listContact.do?cleanParams=true" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('search','','${ctx}/images/contacts/ab_search.png',1);"><img src="${ctx}/images/contacts/ab_search_gray.png" id="search" class="icon" title="Search contacts"/> <br/>Procurar</html:link>&nbsp;</td>
		<td><html:link page="/secure/contacts/listContact.do?cleanParams=true" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('contacts','','${ctx}/images/contacts/ab_browse.png',1);"><img src="${ctx}/images/contacts/ab_browse_gray.png" id="contacts" class="icon" title="Contacts"/> <br/>Contatos</html:link>&nbsp;</td>   	
    	<td><html:link page="/secure/company/listCompany.do?cleanParams=true"  onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('companies','','${ctx}/images/contacts/ab_companies.png',1);"><img src="${ctx}/images/contacts/ab_companies_gray.png" id="companies" class="icon" title="Companies"/> <br/>Empresas</html:link>&nbsp;</td>    	
		<!--td><a href="javascript:alert('Members');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('members','','${ctx}/images/contacts/users.png',1);"><img src="${ctx}/images/contacts/users_gray.png" id="members" class="icon" title="Members"/> <br/>Usu�rios</a>&nbsp;</td-->    	
      <authz:authorize ifAnyGranted="ROLE_SUPERVISOR">
			<td><html:link action="/secure/contacts/createContact" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newcontact','','${ctx}/images/contacts/add_contact.png',1);"><img src="${ctx}/images/contacts/add_contact_gray.png" id="newcontact" class="icon" title="New Contact"/> <br/>Novo Contato</html:link>&nbsp;</td>    	
			<td><html:link action="/secure/company/createCompany"  onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newcompany','','${ctx}/images/contacts/ab_add_company.png',1);"><img src="${ctx}/images/contacts/ab_add_company_gray.png" id="newcompany" class="icon" title="New Company"/> <br/>Nova Empresa</html:link>&nbsp;</td>
	      
			<!--td><a href="javascript:alert('Address Book');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('addressbooks','','${ctx}/images/contacts/ab_addressbooks.png',1);"><img src="${ctx}/images/contacts/ab_addressbooks_gray.png" id="addressbooks" class="icon" title="Addressbooks"/> <br/>Grupos</a>&nbsp;</td-->
			<%--td><a href="javascript:alert('Templates');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('templates','','${ctx}/images/contacts/window_new.png',1);"><img src="${ctx}/images/contacts/window_new_gray.png" id="templates" class="icon" title="Templates"/> <br/>Templates</a>&nbsp;</td>
			<td><a href="javascript:alert('Mailings');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('mailings','','${ctx}/images/contacts/mailings.png',1);"><img src="${ctx}/images/contacts/mailings_gray.png" id="mailings" class="icon" title="Mailings"/> <br/>Mailings</a>&nbsp;</td>
			<td><a href="javascript:alert('Extra Fields');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('extrafields','','${ctx}/images/contacts/custom_fields.png',1);"><img src="${ctx}/images/contacts/custom_fields_gray.png" id="extrafields" class="icon" title="Extra Fields"/> <br/>Campos Extras</a>&nbsp;</td--%>
			<%--td><a href="javascript:delItems();" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('delete','','${ctx}/images/contacts/delete_big.png',1);"><img src="${ctx}/images/contacts/delete_big_gray.png" id="delete" class="icon" title="Delete"/> <br/>Apagar</a>&nbsp;</td--%>
      </authz:authorize>
		<td><a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" title="Ajuda"/> <br/>Ajuda</a>&nbsp;</td>
	</tr>
	</table>
</div>
