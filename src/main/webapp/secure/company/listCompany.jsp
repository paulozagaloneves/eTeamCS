<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="request" />
<%--c:set var="msgInfo" value="${msgInfo}" scope="request"/--%>
<title><bean:message key="listCompany.title" />
</title>
<%@ include file="submenu.jsp"%>
<div id="letters">
	<c:forTokens var="letters"
		items="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" delims=",">
		<html:link paramId="letter"
			page="/secure/company/listCompany.do?letter=${letters}"
			paramProperty="${letters}">
			<c:out value="${letters}" />
		</html:link>&nbsp;&nbsp;
</c:forTokens>
</div>

<div id="searchForm">
	<html:form action="/secure/company/listCompany">
		<span class="label" align="left"><fmt:message
				key="app.contact.search.searchIn" />:</span>
		<html:select property="companySearch.searchCategory">
			<html:option value="-999">Todas as Categorias</html:option>
			<html:option value="-1">Sem Categoria</html:option>
			<html:optionsCollection label="name" value="categoryId"
				name="categories" />
		</html:select>
		<span class="label" align="left"><fmt:message
				key="app.contact.search.withRelation" />
		</span>
		<html:select property="companySearch.searchRelation">
			<html:option value="-999">Todas as Relações</html:option>
			<html:option value="-1">Sem Relação</html:option>
   <<html:optionsCollection label="name" value="relationId"
				name="relations" />
		</html:select>
		<br />
		<span class="label" align="left"><fmt:message
				key="app.contact.search.onName" />
		</span>
		<html:text property="companySearch.searchTerm"></html:text>
		<html:submit styleClass="button">
			<fmt:message key="app.contact.search.searchButton" />
		</html:submit>
	</html:form>
</div>

<%--c:if test="${not empty msgInfo}">
	<div id="messageInfo" align="center">
		<img src="${ctx}/images/info.png" align="middle"/> ${msgInfo}
	</div>
	<c:set var="msgInfo" scope="session" value=""/>
</c:if--%>
<div id="results">
	<display:table name="companies" class="list" requestURI=""
		id="companiesList" export="true" pagesize="20"
		decorator="org.eteamcs.web.displaytag.decorator.CompaniesListDecorator">
		<display:column property="selectRow" title="Sel." media="HTML" />
		<display:column property="name" sortable="true"
			titleKey="company.name"
			href="${ctx}/secure/company/editCompany.do?readonly=true"
			paramId="id" paramProperty="companyId" />
		<display:column property="phone" sortable="false"
			titleKey="company.phone" />
		<display:column property="fax" sortable="false" titleKey="company.fax" />
		<display:column property="email" sortable="false"
			titleKey="company.email" href="/secure/email/sendEmail.do"
			paramId="id" paramProperty="companyId" />
		<display:column property="url" sortable="false" titleKey="company.url" />


		<display:column property="linkActions" titleKey="contact.actions"
			media="html" />
	</display:table>

	<script type="text/javascript">highlightTableRows("companiesList");</script>
</div>