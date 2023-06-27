<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<SCRIPT language=javascript>
//检验表单的合法性
function checkreg() {
	if (document.regform.xm.value.replace(/\s+$|^\s+/g,"").length<=0||document.regform.lx.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.regform.zsj.value.replace(/\s+$|^\s+/g,"").length<=0||document.regform.rzsj.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.regform.tfsj.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写完整！");
		//document.regform.zsj.focus();
		return false;
	}
	if (isNaN(document.regform.zsj.value)) {
		alert("\天数只能为数字！");
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
	  <TD width="20%" align="right">客房名称：</TD>  
	  <TD align="left"><%=cb.getString("select title from product where id='"+pid+"'") %></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">价格：</TD>
	  <TD align="left"><%=cb.getString("select fid from product where id='"+pid+"'") %></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">客户姓名：</TD>
	  <TD align="left"><input type="text" size="30" name="xm"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">联系方式：</TD>
	  <TD align="left"><input type="text" size="30" name="lx"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">预计入住天数：</TD>
	  <TD align="left"><input type="text" size="30" name="zsj"></TD>
	</TR> 
	<TR>
	  <TD width="20%" align="right">预计入住时间：</TD>
	  <TD align="left"><input type="text" size="30" name="rzsj"></TD>
	</TR> 
	<TR>
	  <TD width="20%" align="right">预计退房时间：</TD>
	  <TD align="left"><input type="text" size="30" name="tfsj"></TD>
	</TR> 
    <TR>
      <TD align="center" colspan="2"><INPUT value="提交" type=submit></TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>