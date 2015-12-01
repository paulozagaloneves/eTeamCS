<?xml version="1.0" encoding="iso-8859-15"?>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--@ include file="/taglibs.jsp"%-->
<%@ page language="java" errorPage="/error.jsp" contentType="text/html; charset=ISO-8859-15"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%-- @ taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean-el" %>
<%@ taglib uri="http://struts.apache.org/tags-html-el" prefix="html-el" %>
<%@ taglib uri="http://struts.apache.org/tags-logic-el" prefix="logic-el" --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="authz" uri="http://acegisecurity.org/authz" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%--fmt:setLocale value="pt_BR" scope="session"/--%> 
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
    <script type="text/javascript">
      /* <![CDATA[ */
                   
         
      /* ]]> */
    </script>
    
    <decorator:head/>
  </head>
  <body onload="MM_preloadImages('${ctx}/images/nuvola/tiny/exit.png','${ctx}/images/nuvola/tiny/exit.png')">
  <div id="wrapper">
		<div id="main">
		<decorator:body/>
		</div><!-- end main -->
   </div><!-- end wrapper -->   
   <script type="text/javascript" src="${ctx}/scripts/PieNG.js"></script>
  </body>
</html>