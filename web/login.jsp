<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>  
<SCRIPT language=javascript>
//��������ĺϷ���
function checklogin() {
	if (document.loginform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�����������û�����");
		document.loginform.username.focus();
		return false;
	}
	if (document.loginform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\�������������룡");
		document.loginform.password.focus();
		return false;
	} 
}
</SCRIPT><TABLE align=center id=table19 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><IMG height=243 src="<%=basePath%>images/h.jpg" width=898 border=0></TD></TR></TBODY></TABLE>
  <FORM name="loginform" method="post" action="<%=basePath %>MemberServlet?method=mlogin" onSubmit="return checklogin();"> 
  <TABLE align=center height="180">
    <TBODY>
    <TR>
	  <TD width="20%" align="right">�û��ʺţ�</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��¼���룺</TD>
	  <TD align="left"><input type="password" size="30" name="password"></TD>
	</TR> 
    <TR>
      <TD align="center" colspan="2"><INPUT value="��¼" type=submit>&nbsp;&nbsp;
      <INPUT value="ע��" type="button" onclick="window.location.href='reg.jsp'">&nbsp;&nbsp;
      <INPUT value="��������" type="button" onclick="window.location.href='lost.jsp'"></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>
