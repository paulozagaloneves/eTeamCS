
<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Config</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>
    
  <body>
    <pre>
<%
       String osInfo = System.getProperties().get("os.name") +" ";
       osInfo += System.getProperties().get("os.version") + ",";
       osInfo += System.getProperties().get("os.arch");
       
       String javaVersion =  System.getProperties().get("java.version") + ", ";
          javaVersion += System.getProperties().get("java.vendor");
       
       String javaVM = System.getProperties().get("java.vm.name") + " ";
       javaVM += System.getProperties().get("java.vm.version") + ", ";
       javaVM += System.getProperties().get("java.vm.vendor") + " ";
       
       String classPath = System.getProperties().get("java.class.path") +"";
       
       out.println("------------------------------------------------------------------------------------------------");
       out.println("Java Version: "+javaVersion);
       out.println("Java VM     : "+javaVM);
       out.println("OS-System   : "+osInfo);
       Runtime runtime = Runtime.getRuntime();
       out.println("Memory      : "+runtime.totalMemory()+" / "+runtime.freeMemory() + " bytes, ocupados: "+(runtime.totalMemory()-runtime.freeMemory()));
       out.println("Classpath   : "+classPath);
       out.println("------------------------------------------------------------------------------------------------");
%>    
</pre>
  </body>
</html>
