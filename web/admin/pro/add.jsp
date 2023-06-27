<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String htmlData = request.getParameter("detail") != null ? request.getParameter("detail") : "";
String method=request.getParameter("method");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><id>后台操作区</id>
<META http-equiv=detail-Type detail="text/html; charset=gb2312">
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
<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="detail"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<script type="text/javascript">
function check()
{
	if(document.form1.rid.value=="")
	{
		alert("请填写房间号！");
		document.form1.rid.focus();
		return false;
	}
	if(document.form1.price.value=="")
	{
		alert("请填写价格！");
		document.form1.price.focus();
		return false;
	} 
	<%if(method.equals("addpro")){ %>
	if(document.form1.pic.value=="")
	{
		alert("请上传客房图片！");
		document.form1.pic.focus();
		return false;
	} 
	<%}%>
	if(document.form1.pic.value!="")
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		}
	}
	 
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
		//String method=request.getParameter("method");
		String rid="";String price=""; String detail="";String type="";
		if(method.equals("uppro")){
			rid=request.getParameter("rid");
			List wzlist=cb.get1Com("select * from room where rid='"+rid+"'",6);
			rid=wzlist.get(0).toString();
			price=wzlist.get(1).toString();
			detail=wzlist.get(3).toString();
            htmlData=detail;
            type=wzlist.get(4).toString();
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
					  <td class="font2">&nbsp;发布客房信息</td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
<form action="<%=basePath%>UpServlet" name="form1" method="post" enctype="multipart/form-data"  onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> 
    <tr bgColor=#ffffff>
    <input type="hidden" name="method" value="<%=method %>" />
<%--    <input type="hidden" name="rid" value="<%=rid %>" />--%>
      <td width="35%" class="font1" height="26" align=right>房间号：</td>
      <td align=left>
      <%if(method.equals("uppro")){ %><input type="text" name="rid" size="50" maxlength="30" value="<%=rid %>" readonly><%}else{ %> 
      <input type="text" name="rid" size="50" maxlength="30" value="<%=rid %>"><%} %></td>
    </tr>
    <tr bgColor=#ffffff> 
      <td width="35%"  class="font1" height="26" align=right>类型：</td>
      <td align=left><select name="type">
    <%if(method.equals("uppro")){ %><option value="<%=type%>"><%=type%></option> <%} %>
    <%List flist=cb.getCom("select distinct type from room order by rid",1);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(0).toString() %>><%=list2.get(0).toString() %></option>
    <%}} %>
    </select></td>
    </tr>
    <tr bgColor=#ffffff>
      <td width="35%"  class="font1" height="26" align=right>价格：</td>
      <td align=left><input type="text" name="price" size="50" maxlength="30" value="<%=price %>" onKeyUp="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"></td>
    </tr>
    <tr bgColor=#ffffff> 
      <td width="35%"  class="font1" height="26" align=right>客房图片：</td>
      <td align=left><INPUT  type=file name="pic"  maxLength=20 size=30></td>
    </tr>
    <tr bgColor=#ffffff>
      <td width="35%"  class="font1" height="26" align=right>客房介绍：</td>
      <td align=left><textarea name="detail" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
    </tr> 
    <tr bgColor=#ffffff>
      <td colspan="2"  class="font1" height="26" align=center>
      <input type="submit" value="确定"  > </td>
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
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>