<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/admin.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<%
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 background=<%=basePath %>admin/images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TR><TD height=10></TD></TR></TABLE> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">密码信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">修改密码</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	  <%if(username.equals("admin")){ %>
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(2009) href="javascript:void(0);">系统用户管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child2009 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/index.jsp" target="MainFrame">系统用户管理</A></TD>
		</TR>
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加系统用户</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	   <%} %>
	  
	  
	 
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(2) href="javascript:void(0);">客房信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
<%--        <TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/pro/lx.jsp" target="MainFrame">客房类型管理</A></TD>--%>
<%--		</TR> --%>
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/index.jsp" target="MainFrame">查看客房</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/add.jsp?method=addpro" target="MainFrame">新增客房</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/s.jsp" target="MainFrame">查询客房（按房间号）</A></TD>
		</TR> 
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/pro/pl.jsp" target="MainFrame">评论管理</A></TD>--%>
<%--		</TR> --%>
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
       
	   
	   
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1712) href="javascript:void(0);">注册用户管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1712 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/member/index.jsp" target="MainFrame">注册用户管理</A></TD>
		</TR>  
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	 
       
<%--        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=22>--%>
<%--          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>--%>
<%--          <A class=menuParent onclick=expand(11) href="javascript:void(0);">预定信息管理</A></TD>--%>
<%--		</TR>--%>
<%--        <TR height=4><TD></TD></TR>--%>
<%--	  </TABLE>--%>
<%--      <TABLE id=child11 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/zc/index.jsp" target="MainFrame">预定信息管理</A></TD>--%>
<%--		</TR>  --%>
<%--        <TR height=4>--%>
<%--          <TD colSpan=2></TD>--%>
<%--		</TR>--%>
<%--	  </TABLE> --%>
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1125) href="javascript:void(0);">入住信息管理</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1125 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/index.jsp" target="MainFrame">入住信息管理</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/add.jsp?method=addrz" target="MainFrame">登记入住信息</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/s.jsp?method=addrz" target="MainFrame">查询入住信息</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/t.jsp?method=addrz" target="MainFrame">营业情况统计</A></TD>
		</TR>      
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>

        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
            <TR height=22>
                <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
                    <A class=menuParent onclick=expand(1234) href="javascript:void(0);">数据备份管理</A></TD>
            </TR>
            <TR height=4><TD></TD></TR>
        </TABLE>
        <TABLE id=child1234 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
            <TR height=20>
                <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
                <TD><A class=menuChild href="<%=basePath %>admin/gg/index.jsp?method=backup" target="MainFrame">备份/恢复</A></TD>
            </TR>
            <TR height=4>
                <TD colSpan=2></TD>
            </TR>
        </TABLE>
	  
<%--	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=22>--%>
<%--          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>--%>
<%--          <A class=menuParent onclick=expand(112) href="javascript:void(0);">新闻活动管理</A></TD>--%>
<%--		</TR>--%>
<%--        <TR height=4><TD></TD></TR>--%>
<%--	  </TABLE>--%>
<%--      <TABLE id=child112 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  --%>
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/gg/index.jsp" target="MainFrame">新闻活动管理</A></TD>--%>
<%--		</TR>  --%>
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/gg/add.jsp?method=addgg" target="MainFrame">发布新闻活动</A></TD>--%>
<%--		</TR>      --%>
<%--        <TR height=4>--%>
<%--          <TD colSpan=2></TD>--%>
<%--		</TR>--%>
<%--	  </TABLE>--%>
	  
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(12) href="javascript:void(0);">退出登录状态</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child12 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0> 
      <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>AdminServlet?method=adminexit" target="_top">退出登录状态</A></TD>
		</TR>   
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	 
	  
	  
	  
	  
       </TD>
     </TR> 
</TABLE>
</body>
<%} %>
</HTML>
