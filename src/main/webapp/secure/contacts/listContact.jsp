<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<%--c:set var="msgInfo" value="${msgInfo}" scope="request"/--%>
<title><bean:message key="listContact.title" /></title>
<%@ include file="submenu.jsp"%>
<script type="text/javascript">
   function popup_companies() {
     var window_defs="width=600,height=300,titlebar=no,status=no,scrollbars=yes,resizable=yes,menubar=no,location=no,hotkeys=no";
      window.open('${ctx}/secure/contacts/popup_companies.do?varname=companyName&varid=contactSearch.searchCompany','popup_companies',window_defs);
      
      return true;
   }
</script>

<div id="letters">
<c:forTokens var="letters" items="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" delims=",">
	<html:link paramId="letter"  page="/secure/contacts/listContact.do?letter=${letters}" paramProperty="${letters}"><c:out value="${letters}"/></html:link>&nbsp;&nbsp;
</c:forTokens>
</div>

<div id="searchForm">
<html:form action="/secure/contacts/listContact">
<span class="label" align="left"><fmt:message key="app.contact.search.searchIn"/>:</span>
<html:select property="contactSearch.searchCategory">
   <html:option value="-999">Todas as Categorias</html:option>
   <html:option value="-1">Sem Categoria</html:option>
   <c:forEach var="item" items="${categories}" varStatus="status">
        <html:option value="${item.categoryId}"><c:if test="${!empty(item.parentId)}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>${item.name}</html:option>
   </c:forEach>
</html:select>
<br/>
<span class="label" align="left"><fmt:message key="app.contact.search.onCompany"/></span>
<html:hidden property="contactSearch.searchCompany" styleId="contactSearch.searchCompany"/>
<input type="text" name="companyName" id="companyName" value="${param.companyName}" class="readonly_input" readonly="true" style="width: 250px" onClick="javascript:alert('Clicar no icone à direita para seleccionar uma empresa!');" title="Clicar no icone à direita para seleccionar uma empresa"/> 
<%--html:select property="contactSearch.searchCompany" style="width: 250px">
   <html:option value="-999">Todas as Empresas</html:option>
   <html:optionsCollection label="name" value="companyId" name="companies"/>
</html:select--%>
<a href="javascript:;" onClick="popup_companies();"><img src="${ctx}/images/contacts/ab_companies_24x24.png" width="24" height="24" align="middle" title="Procurar empresa" /></a>
<span class="label" align="left"><fmt:message key="app.contact.search.onName"/></span>
<html:text property="contactSearch.searchTerm"></html:text>
<html:submit styleClass="button"><fmt:message key="app.contact.search.searchButton"/></html:submit>
</html:form>
</div>
<%--c:if test="${not empty msgInfo}">
	<div id="messageInfo" align="center">
		<img src="${ctx}/images/info.png" align="middle"/> ${msgInfo}
	</div>
	<c:set var="msgInfo" scope="session" value=""/>
</c:if--%>
<div id="results">
<display:table name="contacts" class="list" requestURI="" id="contactsList" export="true" pagesize="20"
    decorator="org.eteamcs.web.displaytag.decorator.ContactsListDecorator">
	<display:column property="selectRow" title="Sel." media="HTML"/>
    <!--display:column property="contactId" sort="true" href="/secure/contacts/editContact.do" 
        paramId="id" paramProperty="contactId" titleKey="contact.id"/-->
    <display:column property="name" sortable="true" titleKey="contact.name" href="${ctx}/secure/contacts/editContact.do?readonly=true"
         paramId="id" paramProperty="contactId"  />
    <display:column property="company.name" sortable="true" titleKey="contact.company" />
    <display:column property="phoneWork" sortable="false" titleKey="contact.phone"/>
    <display:column property="cellular" sortable="false" titleKey="contact.cellular"/>
	<display:column property="email" sortable="false" titleKey="contact.email"
		href="/secure/email/sendEmail.do" paramId="id" paramProperty="contactId"/>
	
	<display:column property="linkActions" titleKey="contact.actions" media="html"/>
</display:table>

<script type="text/javascript">highlightTableRows("contactsList");</script>
</div>