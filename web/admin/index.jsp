<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
 
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css" />
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{ 		
%>
<frameset rows="75,*" frameborder="no" border="0" framespacing="0">
<frame src="<%=basePath %>admin/iframe/top.jsp" noresize="noresize" frameborder="0" name="topFrame" marginwidth="0" marginheight="0" scrolling="no">
<frameset rows="*" cols="200,*" id="frame">
<frame src="<%=basePath %>admin/iframe/left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto">
<frame src="<%=basePath %>admin/iframe/main.jsp" name="MainFrame" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes">
</frameset>
<frame src="UntitledFrame-1" noresize="noresize" frameborder="0" name="bottomFrame" marginwidth="0" marginheight="0" scrolling="no">
<noframes> 
</noframes>
</frameset>
<%} %> 
