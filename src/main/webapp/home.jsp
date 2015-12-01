<%@ include file="/taglibs.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<title><bean:message key="index.title" /></title>
<div id="subMenu">  	
	<a href="javascript:alert('New Email');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newemail','','${ctx}/images/nuvola/small/compose.png',1);"><img src="${ctx}/images/nuvola/small/compose_gray.png" id="newemail" class="icon" alt="Criar email"/> Novo Email</a>&nbsp;    	
	<a href="javascript:alert('New Project');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newproject','','${ctx}/images/nuvola/small/projects_new.png',1);"><img src="${ctx}/images/nuvola/small/projects_new_gray.png" id="newproject" class="icon" alt="Criar Projeto"/> Novo Projecto</a>&nbsp;    	
    <a href="javascript:alert('New Note');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newnote','','${ctx}/images/nuvola/small/kate.png',1);"><img src="${ctx}/images/nuvola/small/kate_gray.png" id="newnote" class="icon" alt="Criar Nota"/> Nova Nota</a>&nbsp;    	
	<a href="javascript:alert('New Event');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newevent','','${ctx}/images/nuvola/small/cal_compose.png',1);"><img src="${ctx}/images/nuvola/small/cal_compose_gray.png" id="newevent" class="icon" alt="Criar evento"/> Novo Evento</a>&nbsp;    	
	<a href="javascript:alert('New Todo');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('newtodo','','${ctx}/images/nuvola/small/todos_new.png',1);"><img src="${ctx}/images/nuvola/small/todos_new_gray.png" id="newtodo" class="icon" alt="Criar tarefa"/> Nova Tarefa</a>&nbsp;    	
	<a href="javascript:alert('You need help');" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('help','','${ctx}/images/nuvola/small/filetypes.png',1);"><img src="${ctx}/images/nuvola/small/filetypes_gray.png" id="help" class="icon" alt="Ajuda"/> Ajuda</a>&nbsp;
</div>

<div id="content">
	<div id="content-left">
		<div class="box-body" style="width:200px">
		  <div class="box-title">&nbsp;&nbsp;Você tem ...</div>
		  <div class="icon_box"><img src="images/nuvola/large/korganizer.png" width="32" height="32" alt="Você tem..."/></div>
		  <div style="padding: 4px">
		  	<table border="0" cellpadding="4" cellspacing="0">
		         <tr>
		            <td><img src="images/nuvola/small/email.png" alt="Emails recente"/></td>
		            <td><strong>Email</strong></td>
		         </tr>
		         <tr>
		            <td></td>
		            <td><a href="">12 novos emails</a></td>
		         </tr>
		         <tr>
		            <td><img src="images/nuvola/small/todos.png" alt="Tarefas recentes"/></td>
		            <td><strong>Tarefas</strong></td>
		         </tr>
		         <tr>
		            <td></td>
		            <td><a href="">3 tarefas novas.</a></td>
		         </tr>
		         <tr>
		            <td><img src="images/nuvola/small/calendar.png" alt="Eventos"/></td>
		            <td><strong>Calendário</strong></td>
		         </tr>
		         <tr>
		            <td></td>
		            <td><strong>Hoje</strong><br/>
		               <a href="">09:30 Reunião Grupo</a><br/>
		               <a href="">14:30 Reunião Projeto X</a><br/>
		               <strong>Amanhã</strong><br/>
		               <a href="">09:30 Reunião Mensal</a>
		            </td>
		         </tr>
		  	</table>
		  </div>
		</div>
		<p/>
	</div>
	<div id="content-center">
	   <div class="box-body">
		  <div class="box-title">&nbsp;&nbsp;Aplicações</div>
		  <div class="icon_box"><img src="images/nuvola/large/non.png" width="32" height="32" alt="Aplicações"/></div>
	   		<table border="0" cellpadding="0" cellspacing="16" width="100%">   		
	   		<tr>
	   			<td>
	   			  <div class="opControlPanel">
	   				<a href="calendar"><img src="images/nuvola/medium/date.png" alt="Calendário"/><br/>Calendário</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="Tarefas"><img src="images/nuvola/medium/korganizer.png" alt="Tarefas"/><br/>Tarefas</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="Tarefas"><img src="images/nuvola/medium/email.png" alt="E-Mail"/><br/>E-Mail</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   			    <html:link action="/secure/contacts/listContact"><img src="images/nuvola/medium/kaddressbook.png" alt="Contatos"/><br/>Contatos</html:link>
	   			  </div>
	   		    </td>   		    
	   		</tr>
	   		<tr>
	   			<td>
	   			  <div class="opControlPanel">
	   				<a href="projetos"><img src="images/nuvola/medium/kchart.png" alt="Projetos"/><br/>Projetos</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="Notas"><img src="images/nuvola/medium/knotes.png" alt="Notas"/><br/>Notas</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="Arquivos"><img src="images/nuvola/medium/folder_violet.png" alt="Arquivos"/><br/>Arquivos</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="User"><img src="images/nuvola/medium/kuser.png" alt="Admin"/><br/>Admin</a>   			
	   		      </div>
	   		    </td>   		    
	   		</tr>
	   		<tr>
	   			<td>
	   			  <div class="opControlPanel">
	   				<a href="projetos"><img src="images/nuvola/medium/kfm_home.png" alt="Home"/><br/>Home</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	   			  <div class="opControlPanel">
	   				<a href="Ajuda"><img src="images/nuvola/medium/filetypes.png" alt="Ajuda"/><br/>Ajuda</a>   			
	   		      </div>
	   		    </td>
	   		    <td>
	
	   		    </td>
	   		    <td>
	
	   		    </td>   		    
	   		</tr>   		   		
	   		</table>
		</div>	
	</div>	
	<div id="content-right">
		<div class="box-body" style="width:200px">
		  	<div class="box-title">Notícias</div>
		  	<div class="icon_box"><img src="images/nuvola/medium/knode.png" width="32" height="32" alt="Notícias"/></div>
			<script type="text/javascript">
				/* <![CDATA[ */
						Tscroll_init(0);
				/* ]]> */
			</script>	
		</div>
		<p/>
		<div class="box-body" style="width:200px;">
		  <div class="box-title">Atalhos</div>
		  <div class="icon_box"><img src="images/nuvola/medium/knotes.png" width="32" height="32" alt="Atalhos"/></div>
		  <ul>
		  	<li>Projeto ABC</li>
		  	<li>Adicionar Despesa</li>
		  	<li>Apresentar XPTO</li>
		  </ul>
		</div><p/>
		<%--div class="box-body" style="width:200px">
		  <div class="box-title">Titulo da caixa</div>
		  <div class="icon_box"><img src="images/nuvola/medium/date.png" width="32" height="32" alt="Caixa demo"/></div>
		  This is a box with a drop shadow!
		</div--%>
		<p/>		
	</div>	
</div>