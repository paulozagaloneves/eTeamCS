<%@ include file="/taglibs.jsp"%>

<title><bean:message key="index.title" /></title>
<html:errors/>
<div align="center">
      <div class="login">
        <div class="login-form">
          <span class="login-title">login</span>
          <html:form action="/login.do">
          <input type="hidden" name="method" value="login"/>
          <!--<form action="login.do" method="post" name="loginForm" id="loginForm">-->
            <div class="form-block">
              <span class="inputlabel"><bean:message key="app.core.login.username" /></span>
              <div><html:text property="login.username" styleClass="inputbox" /></div>
              <span class="inputlabel"><bean:message key="app.core.login.password" /></span>
              <div><html:text property="login.password" styleClass="inputbox" /><html:errors property="login.password"/></div>
              <div align="left">
              		<html:submit styleClass="button">
						<bean:message key="button.core.login.login" />
					</html:submit>
              </div>
            </div>
            <!-- Begin Validator Javascript Function-->
			<%--html:javascript formName="loginForm"/--%>
			<!-- End of Validator Javascript Function-->
          </html:form>
        </div>
         <!-- Texto lateral -->
        <div class="login-text">
          <div align="center"><img src="images/security.png" width="64" height="64" alt="security" /></div>
          <bean:message key="app.core.login.msg_login" />
          <!--<p>Bem vindo ao eTeamCS!</p>
          <p>Introduza o seu nome e senha de utilizador para iniciar uma sess�o.</p> -->
        </div>
        <div class="clr"></div>
      </div>
</div>
