<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="listCompany.title" /></title>
<script type="text/javascript">
   function submit_data(name,id) {  
      opener.document.getElementById("${param.varname}").value=name;
      opener.document.getElementById("${param.varid}").value=id;
      window.close();      
   }
</script>
<div id="letters">
<c:forTokens var="letters" items="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" delims=",">
   <html:link paramId="letter" page="/secure/contacts/popup_companies.do?letter=${letters}&varname=${param.varname}&varid=${param.varid}" paramProperty="${letters}"><c:out value="${letters}"/></html:link>&nbsp;
</c:forTokens>
</div>

<div id="searchForm">
<html:form action="/secure/contacts/popup_companies">
<input type="hidden" name="varname" value="${param.varname}"/>
<input type="hidden" name="varid" value="${param.varid}"/>
<span class="label" align="left"><fmt:message key="app.contact.search.onName"/></span>
<html:text property="companySearch.searchTerm"></html:text>
<html:submit styleClass="button"><fmt:message key="app.contact.search.searchButton"/></html:submit>
</html:form>
</div>

<div id="results">
<table class="list" id="companiesList" style="width: 95%">
<thead>
<tr>
<th>Nome</th></tr></thead>
<tbody>
<tr class="odd">
 <td>
     <a href='javascript:submit_data("",-999)'>------</a>
 </td>
</tr>
<c:forEach var="company" items="${companies}" varStatus="status">
 <tr class="<c:if test="${status.index % 2 == 0}">even</c:if><c:if test="${status.index % 2 != 0}">odd</c:if>">
 <c:set var="aspas">"</c:set>
 <c:set var="plicas">'</c:set>
 <c:set var="name">${fn:replace(company.name,plicas,"`")}</c:set>
 <c:set var="name">${fn:replace(name,aspas,"&#34;")}</c:set>
 <td>
     <a href="javascript:submit_data('${name}',${company.companyId})">${company.name}</a>
 </td>
 </tr>  
</c:forEach>
</tbody>
</table>

<%--display:table name="companies" class="list" requestURI="" id="companiesList" export="false">
    <display:column property="name" sort="false"  titleKey="company.name" href="javascript:submit_data('${name}',${companyId});"
         paramId="id" paramProperty="companyId" />
</display:table --%>

<script type="text/javascript">highlightTableRows("companiesList");</script>
</div>