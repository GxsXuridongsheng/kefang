<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>�û�����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<SCRIPT language=javascript>
//������ĺϷ���
function checkreg() {
	if (document.regform.zsj.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\����������Ԥ��������");
		document.regform.zsj.focus();
		return false;
	}
	if (isNaN(document.regform.zsj.value)) {
		alert("\����ֻ��Ϊ���֣�");
		document.regform.zsj.focus();
		return false;
	} 
	if (document.regform.tel.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\����������Ԥ����סʱ�䣡");
		document.regform.tel.focus();
		return false;
	}  
}
</SCRIPT>

<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
	
	String id=request.getParameter("id"); 
%>
<body>
<form action="<%=basePath%>ComServlet?method=upzc2&id=<%=id%>" method="post" name="regform"  onSubmit="return checkreg();"> 
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>Ԥ����ס������</td>
      <td class="td_bg" align=left><input type="text" size="10" name="zsj" value="<%=cb.getString("select zsj from zc where id='"+id+"'") %>"></td>
    </tr> 
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>Ԥ����סʱ�䣺</td>
      <td class="td_bg" align=left><input type="text" size="10" name="tel" value="<%=cb.getString("select tel from zc where id='"+id+"'") %>"></TD>
    </tr> 
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center>
      <input type="submit" value="ȷ���޸�"></td>
    </tr> 
  </tbody>
</table>
</form>
</body>
<%} %>
