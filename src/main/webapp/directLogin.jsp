<%@ include file="/taglibs.jsp"%>
<%@ page import="org.acegisecurity.ui.AbstractProcessingFilter" %>
<%@ page import="org.acegisecurity.ui.webapp.AuthenticationProcessingFilter" %>
<%@ page import="org.acegisecurity.AuthenticationException" %>

<title><bean:message key="index.title" /></title>
<html:errors/>
    <%-- this form-login-page form is also used as the 
         form-error-page to ask for a login again.
         --%>
    <c:if test="${not empty param.login_error}">
      <font color="red">
        Your login attempt was not successful, try again.<BR><BR>
        Reason: <%= ((AuthenticationException) session.getAttribute(AbstractProcessingFilter.ACEGI_SECURITY_LAST_EXCEPTION_KEY)).getMessage() %>
      </font>
    </c:if>
<div align="center">

      <div class="login">
        <div class="login-form">
          <span class="login-title">login</span>
          <form action="<c:url value='j_acegi_security_check'/>" method="POST">
          <input type="hidden" name="method" value="login"/>
          <!--<form action="login.do" method="post" name="loginForm" id="loginForm">-->
            <div class="form-block">
              <span class="inputlabel"><fmt:message key="app.core.login.username" /></span>
              <div><input type='text' name='j_username' value='museu'></div>
              <span class="inputlabel"><fmt:message key="app.core.login.password" /></span>
              <div><input type='password' name='j_password' value="museu"></div>
              <span class="inputlabel"><input type="checkbox" name="_acegi_security_remember_me"> <fmt:message key="app.core.login.rememberme" /></span>
              
              <div align="left">
                  <input name="submit" class="button" type="submit" value="<fmt:message key="button.core.login.login" />">
              </div>
            </div>
            <%-- Begin Validator Javascript Function-->
         <html:javascript formName="loginForm" cdata="true" htmlComment="false"/>
         <!-- End of Validator Javascript Function --%>
          </form>
        </div>
         <!-- Texto lateral -->
        <div class="login-text">
          <div class="divcenter"><img src="images/kgpg.png" width="64" height="64" alt="security" /></div>
          <fmt:message key="app.core.login.msg_login" />
        </div>
        <!--div class="clr"></div-->
      </div>
</div>
<script>
   document.form[0].submit();
</script>