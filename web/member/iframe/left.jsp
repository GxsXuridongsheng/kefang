<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>用户中心</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>member/images/css1/left_css.css" rel=stylesheet>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<SCRIPT language=JavaScript>
function showsubmenu(sid)
{
	whichEl = eval("submenu" + sid);
	if (whichEl.style.display == "none")
	{
		eval("submenu" + sid + ".style.display=\"\";");
	}
	else
	{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</SCRIPT>
<%
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body bgcolor="16ACFF">
<table width="98%" border="0" cellpadding="0" cellspacing="0" background="<%=basePath %>member/images/tablemde.jpg">
  <tr>
    <td height="5" background="<%=basePath %>member/images/tableline_top.jpg" bgcolor="#16ACFF"></td>
  </tr>
  <tr>
    <td>
    <TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0 class=leftframetable>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(<%=basePath %>member/images/left_tt.gif) no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <TD width="20"></TD>
          		<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(1); height=25>基本信息</TD>
              </tr>
            </table>            
          </TD>
        </TR>
        <TR>
          <TD>
          <TABLE id=submenu1 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD width="2%"><IMG src="<%=basePath %>member/images/closed.gif"></TD>
                  <TD height=23><A href="<%=basePath %>member/info/editpwd.jsp" target="MainFrame">修改密码</A></TD>
                </TR>
                <TR>
                  <TD><IMG src="<%=basePath %>member/images/closed.gif"></TD>
                  <TD height=23><a href="<%=basePath %>member/info/index.jsp" target="MainFrame">编辑资料</A></TD>
                </TR> 
              </TBODY>
          </TABLE>
          </TD>
        </TR>
      </TBODY>
    </TABLE>
    </td>
  </tr>
  <tr>
    <td height="5" background="<%=basePath %>member/images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
 <!-- 开始 -->
  <tr>
    <td height="5" background="<%=basePath %>member/images/tableline_top.jpg" bgcolor="#16ACFF"></td>
  </tr>
  <tr>
    <td>
    <TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0 class=leftframetable>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(<%=basePath %>member/images/left_tt.gif) no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <TD width="20"></TD>
          		<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(2); height=25>预约记录</TD>
              </tr>
            </table>            
          </TD>
        </TR>
        <TR>
          <TD>
          <TABLE id=submenu2 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD width="2%"><IMG src="<%=basePath %>member/images/closed.gif"></TD>
                  <TD height=23><A href="<%=basePath %>member/zc/index.jsp" target="MainFrame">预约记录</A></TD>
                </TR> 
              </TBODY>
          </TABLE>
          </TD>
        </TR>
      </TBODY>
    </TABLE>
    </td>
  </tr>
  <tr>
    <td height="5" background="<%=basePath %>member/images/tableline_bottom.jpg" bgcolor="#9BC2ED"></td>
  </tr>
   <!-- 结束 -->
    
   <!-- 结束 -->
</table>
</body>
<%} %>
</HTML>
