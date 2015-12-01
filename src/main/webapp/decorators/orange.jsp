<?xml version="1.0" encoding="iso-8859-15"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="authz" uri="http://acegisecurity.org/authz" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<html xml:lang="en">
  <head>
    <title><decorator:title default="eTeamCS"/></title>
    <meta name="GENERATOR" content="Quanta Plus" />
    <meta name="AUTHOR" content="Paulo Neves" />
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=iso-8859-15" />
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
    <script src="${ctx}/scripts/JSCookMenu.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/styles/ThemeOffice/theme.css" type="text/css" />
    <script src="${ctx}/styles/ThemeOffice/theme.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/main.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css_buttons.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/box.css" />
    <script src="${ctx}/scripts/MM_images.js" type="text/javascript"></script>
    <script src="${ctx}/scripts/displaytag.js" type="text/javascript"></script> 
    <script src="${ctx}/ts_files/scroll.js" type="text/javascript"></script>
    <script src="${ctx}/scripts/fullJS.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/scripts/tabpane.js"></script>
	<link type="text/css" rel="StyleSheet" href="${ctx}/styles/luna/tab.css" />       
    <script type="text/javascript">
      /* <![CDATA[ */
                   
         
      /* ]]> */
    </script>
    
    <decorator:head/>
  </head>
  <body onload="MM_preloadImages('${ctx}/images/nuvola/tiny/exit.png','${ctx}/images/nuvola/tiny/exit.png')">
  <div id="wrapper">
    <div id="header">
      <div id="left_header" class="head">
         &nbsp;e-TeamCS
      </div>
      <div id="center_header">
         e-Team Collaboration Suite
      </div>
      <div id="right_header" class="head">
         
      </div>
    </div>
    <authz:authorize ifAnyGranted="ROLE_USER">
    <div id="topMenu">
    	<div id="myMenuID"><a href="${ctx}/secure/contacts/listContact.do?cleanParams=true" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('home','','${ctx}/images/nuvola/tiny/kfm_home.png',1);"><img class="icon" id="home" src="${ctx}/images/nuvola/tiny/kfm_home_gray.png" width="24" height="24" alt="Home"/> Home</a></div>
    	<div id="logoutMenu"><a href="${ctx}/j_acegi_logout" onmouseout="MM_swapImgRestore();"  onmouseover="MM_swapImage('logout','','${ctx}/images/nuvola/tiny/exit.png',1);"><img class="icon" id="logout" src="${ctx}/images/nuvola/tiny/exit_gray.png" alt="Logout"/> Logout: <authz:authentication operation="username"/></a></div>
    </div>
    

    <script src="${ctx}/scripts/menu/menu_<authz:authentication operation="username"/>.js" type="text/javascript"></script>
	<script type="text/javascript">
		/* <![CDATA[ */
		/*cmDraw ('myMenuID', myMenu, 'hbr', cmThemeOffice, 'ThemeOffice');*/
		/* ]]> */
		</script>    
	</authz:authorize>
	<div id="main">
	<decorator:body/>
	</div><!-- end main -->
    <div id="footer">
      <div style="text-align:right">
       <a href="http://getfirefox.com/"
			title="Get Firefox - Take Back the Web"><img
			src="${ctx}/images/firefox_80x15.png"
			alt="Get Firefox"/></a>
      <a class="inline-button red" href=""><em>Linux</em><span> Powered</span></a>
      <a class="inline-button red" href="http://validator.w3.org/check?uri=referer"><em>W3C</em><span> XHTML&nbsp;1.0</span></a>
      <a class="inline-button brown" href=""><em>W3C</em><span> CSS&nbsp;valid</span></a>
   </div>
   <c:set var="executionTimeEnd" value="<%=new Long(System.currentTimeMillis())%>"/>
   <div id="copyright">
      Copyright 2005 Paulo Neves. <a href="http://eteamcs.homelinux.org">eTeamCS</a> is Free Software released under the GNU/GPL License.
      &nbsp;Esta página foi gerada em <c:out value="${executionTimeEnd-executionTime}"/> ms. Memory: <%= (Runtime.getRuntime().totalMemory()-Runtime.getRuntime().freeMemory())+"/"+Runtime.getRuntime().freeMemory()+"/"+Runtime.getRuntime().totalMemory()%> Mb
   </div>
   </div>
</div><!-- end wrapper -->   
   <script type="text/javascript" src="${ctx}/scripts/PieNG.js"></script>
  </body>
</html>