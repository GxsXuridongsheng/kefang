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
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>member/zc/index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>member/zc/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>member/zc/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>member/zc/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>member/zc/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>member/zc/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>member/zc/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>member/zc/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>member/zc/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
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
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="12" height="25">Ԥ����Ϣ���� </th>
    </tr>
<%--    <tr align=center>--%>
<%--      <td class="td_bg" height="23"><strong>���</strong></td>--%>
<%--      <td class="td_bg"><strong>�ͷ�����</strong></td>--%>
<%--      <td class="td_bg"><strong>�۸�</strong></td>--%>
<%--      <td class="td_bg"><strong>����</strong></td>--%>
<%--      <td class="td_bg"><strong>��ϵ��ʽ</strong></td>--%>
<%--      <td class="td_bg"><strong>��ס����</strong></td>--%>
<%--      <td class="td_bg"><strong>��סʱ��</strong></td>--%>
<%--      <td class="td_bg"><strong>�˷�ʱ��</strong></td>--%>
<%--      <td class="td_bg"><strong>��Ա</strong></td>--%>
<%--      <td class="td_bg"><strong>�ύʱ��</strong></td>  --%>
<%--      <td class="td_bg"><strong>ɾ��</strong></td>--%>
<%--    </tr>--%>
    <tr>
        <td class="font1" height="27" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>���</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>�˿�����</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>���֤��</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>�����</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>�۸�</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>Ԥ������</strong></td>
        <%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>Ԥ��Ѻ��</strong></td>--%>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>��סʱ��</strong></td>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>�˷�ʱ��</strong></td>
<%--        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>��ס����</strong></td>--%>
        <%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>����</strong></td>--%>
        <%--      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>Ѻ�𷵻�������Ϊ������</strong></td>--%>

<%--        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>�˷�</strong></td>--%>
        <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>ɾ��</strong></td>
    </tr>
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from orders where o_cid = (select cid from client where username='"+member+"')");//�õ���Ϣ����
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from orders where o_cid = (select cid from client where username='"+member+"') order by oid",9);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);

    String in_time = pagelist2.get(6)==null ? "-" : pagelist2.get(6).toString().substring(0,10);
    String out_time = pagelist2.get(7)==null ? "-" : pagelist2.get(7).toString().substring(0,10);
%> 
<%--    <tr align=center>--%>
<%--      <td class="td_bg" height="23"><%=i+1 %></td>--%>
<%--      <td class="td_bg"><%=cb.getString("select title from product where id='"+pagelist2.get(1).toString()+"'") %></td>--%>
<%--      <td class="td_bg"><%=cb.getString("select fid from product where id='"+pagelist2.get(1).toString()+"'") %></td>--%>
<%--      <td class="td_bg"><%=pagelist2.get(2).toString() %></td>--%>
<%--      <td class="td_bg"><%=pagelist2.get(3).toString() %></td>--%>
<%--      <td class="td_bg"><%=Integer.parseInt(pagelist2.get(4).toString()) %></td>--%>
<%--      <td class="td_bg"><%=pagelist2.get(5).toString() %></td> --%>
<%--      <td class="td_bg"><%=pagelist2.get(6).toString() %></td>--%>
<%--      <td class="td_bg"><%=pagelist2.get(7).toString() %></td>  --%>
<%--      <td class="td_bg"><%=pagelist2.get(8).toString() %></td>  --%>
<%--      <td class="td_bg"><a href="<%=basePath%>ComServlet?method=delzc&id=<%=pagelist2.get(0).toString()%>" >ɾ��</a></td>--%>
<%--    </tr>--%>
    <tr bgColor=#ffffff align=center>
        <td class="font1" align=center height="26"><%=i+1 %></td>
        <td class="font1" align=center><%=cb.getString("select realname from client where cid='"+pagelist2.get(1).toString()+"'") %></td>
        <td class="font1" align=center><%=cb.getString("select idcard from client where cid='"+pagelist2.get(1).toString()+"'") %></td>
        <td class="font1" align=center><%=pagelist2.get(2).toString() %></td>
        <td class="font1" align=center><%=pagelist2.get(3).toString() %></td>
        <td class="font1" align=center><%=pagelist2.get(5).toString() %></td>
        <td class="font1" align=center><%=in_time %></td>
        <td class="font1" align=center><%=out_time %></td>
        <%--      <td class="font1" align=center><%=pagelist2.get(8).toString() %></td>--%>
        <%--      <td class="font1" align=center><%=pagelist2.get(6).toString().substring(0,10) %></td>--%>

        <%--      <td class="font1" align=center><%=pagelist2.get(7).toString() %></td>--%>
<%--        <td class="font1" align=center><%=ts%></td>--%>
        <%--      <td class="font1" align=center><%=fy %></td>--%>
        <%--      <td class="font1" align=center><%=fh %></td>--%>

<%--        <td class="font1" align=center><a href="<%=basePath%>admin/rz/add2.jsp?method=uprz&id=<%=pagelist2.get(0).toString()%>">�˷�</a></td>--%>
        <td class="font1" align=center><a href="<%=basePath%>ComServlet?method=delrz&id=<%=pagelist2.get(0).toString()%>" >ɾ��</a></td>
    </tr>
<% }} %> 
  </tbody>
</table>
<center> 
<form action="" method="post" name="form3">	
	  <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
					<a href="#" onClick="top2()">��ҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">βҳ</a>
	 ��<input name="busjump" type="text" size="3" />ҳ <a href="#" onClick="bjump2()">ת��</a>&nbsp;&nbsp;&nbsp; 
</form> 
</center>
</body>
<%} %>
