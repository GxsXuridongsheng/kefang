<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>admin/rz/sinfo.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>admin/rz/sinfo.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/rz/sinfo.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/rz/sinfo.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
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
	else {
		%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="2">&nbsp;</td>
  </tr>
  <tr>
	<td background="<%=basePath%>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
			  <tr>
				<td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
					<tr>
					  <td class="font2">&nbsp;营业情况统计</td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td><form action="" method="post" name="form3">	
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
<%--			   <tr>--%>
<%--				<td class="font1" height="27" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>序号</strong></td>--%>
<%--				<td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>顾客姓名</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>身份证号码</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住房间</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>价格</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>预计天数</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>预付押金</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住时间</strong></td>--%>
<%--      --%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>退房时间</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住天数</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>费用</strong></td>--%>
<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>押金返还（负数为补交）</strong></td>--%>
<%--      --%>
<%--       --%>
<%--    </tr>--%>
	<tr>
		<td class="font1" height="27" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>序号</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>顾客姓名</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>身份证号</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>房间号</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>价格</strong></td>
		<%--	  <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住天数</strong></td>--%>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>状态</strong></td>
		<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>预付押金</strong></td>--%>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住时间</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>退房时间</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>入住天数</strong></td>
		<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>费用</strong></td>--%>
		<%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>押金返还（负数为补交）</strong></td>--%>

		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>修改</strong></td>
		<td class="font1" align="center" background="<%=basePath%>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>退房</strong></td>
	</tr>
<% String esj = Common.toChineseAndTrim(request.getParameter("esj"));
	String ksj = request.getParameter("ksj");
	String ts = "";
	String fy = "";
	String fh = "";
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from orders where in_time>='" + ksj + "' and out_time<='" + esj + "'");//得到信息总数
	String page1 = request.getParameter("page");
	if (page1 == null) {
		page1 = "1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from orders where in_time>='" + ksj + "' and out_time<='" + esj + "' order by oid", 9);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数
	session.setAttribute("busPageCount", pageCount + "");
	List pagelist3 = (ArrayList) session.getAttribute("qqq");
	List pagelist2 = null;
	int turnover = 0;
	if (!pagelist3.isEmpty()) {
		turnover = 0;
		for (int i = 0; i < pagelist3.size(); i++) {
			pagelist2 = (ArrayList) pagelist3.get(i);
			if (pagelist2.get(8).toString().equals("已退房")) {
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
				java.util.Date currentTime_1 = new java.util.Date();
				String rzdata = pagelist2.get(6).toString();
				String tfdata2 = pagelist2.get(7).toString();
				//Date d1 =currentTime_1;
				Date d1 = formatter.parse(rzdata);
				Date d2 = formatter.parse(tfdata2);
				long diff = d2.getTime() - d1.getTime();
				long days = diff / (1000 * 60 * 60 * 24);
//				System.out.print(days+"-----------");
				ts = String.valueOf(days);
//				float f=days*Float.parseFloat(pagelist2.get(8).toString());
//				fy=String.valueOf(f);
//				float f2=Float.parseFloat(pagelist2.get(5).toString())-days*Float.parseFloat(pagelist2.get(8).toString());
//				fh=String.valueOf(f2);
			} else if (pagelist2.get(8).toString().equals("已入住")) {
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
				java.util.Date currentTime_1 = new java.util.Date();
				String rzdata = pagelist2.get(6).toString();
				Date d1 = formatter.parse(rzdata);
				long diff = System.currentTimeMillis() - d1.getTime();
				long days = diff / (1000 * 60 * 60 * 24);
				ts = String.valueOf(days);
			} else if (pagelist2.get(8).toString().equals("未入住")) {
				ts = "-";
			}
			String in_time = pagelist2.get(6) == null ? "-" : pagelist2.get(6).toString().substring(0, 10);
			String out_time = pagelist2.get(7) == null ? "-" : pagelist2.get(7).toString().substring(0, 10);
			turnover += Integer.parseInt(pagelist2.get(3).toString());
%>
<%--      <tr bgColor=#ffffff align=center>--%>
<%--      <td class="font1" align=center height="26"><%=i+1 %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(1).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(2).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(3).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(8).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(4).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(5).toString() %></td>--%>
<%--      <td class="font1" align=center><%=pagelist2.get(6).toString().substring(0,10) %></td>--%>
<%--      --%>
<%--      <td class="font1" align=center><%=pagelist2.get(7).toString() %></td>--%>
<%--      <td class="font1" align=center><%=ts %></td>--%>
<%--      <td class="font1" align=center><%=fy %></td>--%>
<%--      <td class="font1" align=center><%=fh %></td>--%>
<%--      --%>
<%--       --%>
<%--    </tr>--%>
	<tr bgColor=#ffffff align=center>
		<td class="font1" align=center height="26"><%=i + 1%></td>
		<td class="font1" align=center>
			<%=cb.getString("select realname from client where cid='" + pagelist2.get(1).toString() + "'")%></td>
		<td class="font1" align=center>
			<%=cb.getString("select idcard from client where cid='" + pagelist2.get(1).toString() + "'")%></td>
		<td class="font1" align=center><%=pagelist2.get(2).toString()%></td>
		<td class="font1" align=center><%=pagelist2.get(3).toString()%></td>
		<%--		<td class="font1" align=center><%=pagelist2.get(5).toString() %></td>--%>
		<td class="font1" align=center><%=pagelist2.get(8).toString()%></td>
		<td class="font1" align=center><%=in_time%></td>
		<td class="font1" align=center><%=out_time%></td>
		<%--      <td class="font1" align=center><%=pagelist2.get(8).toString() %></td>--%>
		<%--      <td class="font1" align=center><%=pagelist2.get(6).toString().substring(0,10) %></td>--%>

		<%--      <td class="font1" align=center><%=pagelist2.get(7).toString() %></td>--%>
		<td class="font1" align=center><%=ts%></td>
		<%--      <td class="font1" align=center><%=fy %></td>--%>
		<%--      <td class="font1" align=center><%=fh %></td>--%>

		<td class="font1" align=center><a href="<%=basePath%>ComServlet?method=uprz&id=<%=pagelist2.get(0).toString()%>">入住</a></td>
		<td class="font1" align=center><a href="<%=basePath%>ComServlet?method=uptf&id=<%=pagelist2.get(0).toString()%>" >退房</a></td>
	</tr>
<% }
} %>
	<tr bgColor=#ffffff align=center>
		<td class="font1" align=center>所选时间段 已成交 营业额：
			<%=turnover%></td>
<%--		<td class="font1" align=center>所选时间段 进行中 营业额：--%>
<%--			<%=turnover%></td>--%>
		<td class="font1" align=center>总 已成交营业额：
			<%=cb.getString("select sum(o_price) from orders where status='已退房'")%></td>
	</tr>
  <tr align="center" bgcolor="#FFFFFF"> 
				<td class="font1" colspan=15><input type="hidden" name="ksj" value="<%=ksj%>
		" /><input type="hidden" name="esj" value="<%=esj%>" />
	 <input type="hidden" name="pageCount" value="<%=session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计
					<%=session.getAttribute("busPageCount").toString()%>页,当前第
					<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>
	 第<input name="busjump" type="text" size="3" />页 <a href="#" onClick="bjump2()">转到</a>&nbsp;&nbsp;&nbsp; 
				</td>
			</tr>
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
