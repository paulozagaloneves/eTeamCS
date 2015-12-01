<%@ page language="java" isErrorPage="true" %>

<head><title>Ocorreu um erro no sistema</title></head>

<div id="errors"> 
Ocorreu um erro na aplicação !<br/>
Se o erro persistir contacte o seu administrador.<br/>
Para vizualizar o erro pressione <a href="javascript:getElementById('errorTrace').display='inline';">aqui</a>
<div id="errorTrace" style="display:none">
<% if (exception != null) { %>
    <pre><% exception.printStackTrace(new java.io.PrintWriter(out)); %></pre>
<% } else { %>
    Please check your log files for further information.
<% } %>
</div>
</div>