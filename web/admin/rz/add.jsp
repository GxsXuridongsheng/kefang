<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String method=request.getParameter("method");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
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
</head>  
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
<script type="text/javascript">
function check()
{//String xm="";String sfz=""; String fj="";String ts="";String yj="";
	// if(document.form1.xm.value==""||document.form1.sfz.value==""||document.form1.fj.value==""||document.form1.ts.value==""||document.form1.rzsj.value==""
	// ||document.form1.fjjg.value=="")
	// {
	// 	alert("全部信息都要填写！");
	// 	//document.form1.title.focus();
	// 	return false;
	// }
	// if(isNaN(document.form1.ts.value))
	// {
	// 	alert("天数只能为数字！");
	// 	document.form1.ts.focus();
	// 	return false;
	// }
	 
	form1.submit();
}
</script>

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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
//		String method=request.getParameter("method");
		String id="";
		String xm="";String sfz=""; String fj="";String ts="";String yj="";String rzsj="";String fjjg="";
		if(method.equals("uprz")){
			id=request.getParameter("id");
			List wzlist=cb.get1Com("select * from orders where oid='"+id+"'",9);
			xm=cb.getString("select realname from client where cid='"+wzlist.get(1).toString()+"'");
			sfz=cb.getString("select idcard from client where cid='"+wzlist.get(1).toString()+"'");
			fj=wzlist.get(2).toString();
            ts=wzlist.get(5).toString();
//            yj=wzlist.get(5).toString();
            rzsj=wzlist.get(6).toString().substring(0,10);
            fjjg=cb.getString("select price from room where rid='"+wzlist.get(2).toString()+"'");
		}
%>
<BODY >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="2">&nbsp;</td>
  </tr>
  <tr>
	<td background="<%=basePath %>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
			  <tr>
				<td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
					<tr>
					  <td class="font2">&nbsp;入住信息</td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
<form action="<%=basePath%>ComServlet" name="form1" method="post" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> 
    <tr bgColor=#ffffff>
    <input type="hidden" name="method" value="<%=method %>" />
    <input type="hidden" name="id" value="<%=id %>" />
      <td width="45%" class="font1" height="26" align=right>顾客姓名：</td>
      <td align=left><input type="text" name="xm" size="30" maxlength="30" value="<%=xm %>"></td>
    </tr> 
    <tr bgColor=#ffffff> 
      <td width="45%"  class="font1" height="26" align=right>身份证号码：</td>
      <td align=left><input type="text" name="sfz" size="30" maxlength="30" value="<%=sfz %>"></td>
    </tr>
    <tr bgColor=#ffffff> 
      <td width="45%"  class="font1" height="26" align=right>入住房间：</td>
      <td align=left><select name="fj">
    <%if(method.equals("uprz")){ %><option value="<%=fj%>"><%=fj%></option> <%} %> 
    <%List flist=cb.getCom("select rid,rid from room where status='空闲' order by rid",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td>
    </tr>
    <tr bgColor=#ffffff> 
      <td width="45%"  class="font1" height="26" align=right>价格：</td>
      <td align=left><input type="text" name="fjjg" size="30" maxlength="30" value="<%=fjjg %>" value="<%=fjjg %>" ></td>
    </tr>
     <tr bgColor=#ffffff> 
      <td width="45%"  class="font1" height="26" align=right>住宿天数：</td>
      <td align=left><input type="text" name="ts" size="30" maxlength="30" value="<%=ts %>"></td>
    </tr>
<%--     <tr bgColor=#ffffff> --%>
<%--      <td width="45%"  class="font1" height="26" align=right>预付押金：</td>--%>
<%--      <td align=left><input type="text" name="yj" size="30" maxlength="30" value="<%=yj %>" onKeyUp="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"></td>--%>
<%--    </tr>--%>
    <tr bgColor=#ffffff> 
      <td width="45%"  class="font1" height="26" align=right>入住时间：</td>
      <td align=left><input type="text" name="rzsj" size="30" maxlength="30" value="<%=rzsj %>" readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";></td>
    </tr>
    <tr bgColor=#ffffff>
      <td colspan="2"  class="font1" height="26" align=center>
      <input type="button" value="确定" onClick="check()"> </td>
    </tr> 
  </tbody>
</table>
</form>
</td>
</tr> 
	  </table>
	</td>
	<td background="images/index1_47.gif"></td>
  </tr>
  <tr>
	<td width="8" height="8"><img src="images/index1_91.gif" width="8" height="8" /></td>
	<td background="images/index1_92.gif"></td>
	<td width="8" height="8"><img src="images/index1_93.gif" width="8" height="8" /></td>
  </tr>
</table>
</body>
<%} %>
