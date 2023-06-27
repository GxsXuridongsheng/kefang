<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  p.normal {font-weight: normal}
  p.thick {font-weight: bold}
  p.thicker {font-weight: 900}
</style>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
<SCRIPT language=javascript>		
function out(src){
	if(confirm("确定要退出吗？"))	{
		return true;	
	}
	return false;
}
</SCRIPT>
<%String username=(String)session.getAttribute("user"); %>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="74" colspan="2" background="<%=basePath %>admin/images/index1_03.gif">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="33%" rowspan="2">&nbsp;&nbsp;<font size="5">客房管理系统</font></td>
          <td width="6%" rowspan="2">&nbsp;</td>
          <td width="61%" height="38" align="right">
            <table width="120" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><img src="<%=basePath %>admin/images/index1_06.gif" width="16" height="16" /></td>
                <td align="center" class="font2"><a href="<%=basePath %>" class="font2" target="_blank"><strong>首页</strong></a></td>
                <td align="center"><img src="<%=basePath %>admin/images/index1_08.gif" width="16" height="16" /></td>
                <td align="center" class="font2">
                <a href="<%=basePath%>AdminServlet?method=adminexit" class="font2" target="_top"><strong>退出</strong></a></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="right">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" class="font2">登陆用户：<%=username %>&nbsp;|&nbsp; &nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>