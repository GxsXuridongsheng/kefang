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
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">������Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">�޸�����</A></TD></TR>
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	  <%if(username.equals("admin")){ %>
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(2009) href="javascript:void(0);">ϵͳ�û�����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child2009 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/index.jsp" target="MainFrame">ϵͳ�û�����</A></TD>
		</TR>
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">����ϵͳ�û�</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	   <%} %>
	  
	  
	 
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(2) href="javascript:void(0);">�ͷ���Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child2 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
<%--        <TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/pro/lx.jsp" target="MainFrame">�ͷ����͹���</A></TD>--%>
<%--		</TR> --%>
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/index.jsp" target="MainFrame">�鿴�ͷ�</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/add.jsp?method=addpro" target="MainFrame">�����ͷ�</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/pro/s.jsp" target="MainFrame">��ѯ�ͷ���������ţ�</A></TD>
		</TR> 
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/pro/pl.jsp" target="MainFrame">���۹���</A></TD>--%>
<%--		</TR> --%>
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
       
	   
	   
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1712) href="javascript:void(0);">ע���û�����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1712 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/member/index.jsp" target="MainFrame">ע���û�����</A></TD>
		</TR>  
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	 
       
<%--        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=22>--%>
<%--          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>--%>
<%--          <A class=menuParent onclick=expand(11) href="javascript:void(0);">Ԥ����Ϣ����</A></TD>--%>
<%--		</TR>--%>
<%--        <TR height=4><TD></TD></TR>--%>
<%--	  </TABLE>--%>
<%--      <TABLE id=child11 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/zc/index.jsp" target="MainFrame">Ԥ����Ϣ����</A></TD>--%>
<%--		</TR>  --%>
<%--        <TR height=4>--%>
<%--          <TD colSpan=2></TD>--%>
<%--		</TR>--%>
<%--	  </TABLE> --%>
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1125) href="javascript:void(0);">��ס��Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1125 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/index.jsp" target="MainFrame">��ס��Ϣ����</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/add.jsp?method=addrz" target="MainFrame">�Ǽ���ס��Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/s.jsp?method=addrz" target="MainFrame">��ѯ��ס��Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/rz/t.jsp?method=addrz" target="MainFrame">Ӫҵ���ͳ��</A></TD>
		</TR>      
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>

        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
            <TR height=22>
                <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
                    <A class=menuParent onclick=expand(1234) href="javascript:void(0);">���ݱ��ݹ���</A></TD>
            </TR>
            <TR height=4><TD></TD></TR>
        </TABLE>
        <TABLE id=child1234 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
            <TR height=20>
                <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
                <TD><A class=menuChild href="<%=basePath %>admin/gg/index.jsp?method=backup" target="MainFrame">����/�ָ�</A></TD>
            </TR>
            <TR height=4>
                <TD colSpan=2></TD>
            </TR>
        </TABLE>
	  
<%--	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>--%>
<%--        <TR height=22>--%>
<%--          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>--%>
<%--          <A class=menuParent onclick=expand(112) href="javascript:void(0);">���Ż����</A></TD>--%>
<%--		</TR>--%>
<%--        <TR height=4><TD></TD></TR>--%>
<%--	  </TABLE>--%>
<%--      <TABLE id=child112 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>  --%>
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/gg/index.jsp" target="MainFrame">���Ż����</A></TD>--%>
<%--		</TR>  --%>
<%--		<TR height=20>--%>
<%--          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>--%>
<%--          <TD><A class=menuChild href="<%=basePath %>admin/gg/add.jsp?method=addgg" target="MainFrame">�������Ż</A></TD>--%>
<%--		</TR>      --%>
<%--        <TR height=4>--%>
<%--          <TD colSpan=2></TD>--%>
<%--		</TR>--%>
<%--	  </TABLE>--%>
	  
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(12) href="javascript:void(0);">�˳���¼״̬</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child12 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0> 
      <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>AdminServlet?method=adminexit" target="_top">�˳���¼״̬</A></TD>
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
