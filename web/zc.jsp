<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<SCRIPT language=javascript>
//������ĺϷ���
function checkreg() {
	if (document.regform.xm.value.replace(/\s+$|^\s+/g,"").length<=0||document.regform.lx.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.regform.zsj.value.replace(/\s+$|^\s+/g,"").length<=0||document.regform.rzsj.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.regform.tfsj.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\����д������");
		//document.regform.zsj.focus();
		return false;
	}
	if (isNaN(document.regform.zsj.value)) {
		alert("\����ֻ��Ϊ���֣�");
		document.regform.zsj.focus();
		return false;
	}  
}
</SCRIPT>
<%String pid=request.getParameter("pid");  %>
  <FORM name="regform" method="post" action="<%=basePath%>ComServlet?method=zc2&pid=<%=pid%>" onSubmit="return checkreg();"> 
  <TABLE align=center>
    <TBODY>
    <TR>
	  <TD width="20%" align="right">�ͷ����ƣ�</TD>  
	  <TD align="left"><%=cb.getString("select title from product where id='"+pid+"'") %></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">�۸�</TD>
	  <TD align="left"><%=cb.getString("select fid from product where id='"+pid+"'") %></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">�ͻ�������</TD>
	  <TD align="left"><input type="text" size="30" name="xm"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">��ϵ��ʽ��</TD>
	  <TD align="left"><input type="text" size="30" name="lx"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">Ԥ����ס������</TD>
	  <TD align="left"><input type="text" size="30" name="zsj"></TD>
	</TR> 
	<TR>
	  <TD width="20%" align="right">Ԥ����סʱ�䣺</TD>
	  <TD align="left"><input type="text" size="30" name="rzsj"></TD>
	</TR> 
	<TR>
	  <TD width="20%" align="right">Ԥ���˷�ʱ�䣺</TD>
	  <TD align="left"><input type="text" size="30" name="tfsj"></TD>
	</TR> 
    <TR>
      <TD align="center" colspan="2"><INPUT value="�ύ" type=submit></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>