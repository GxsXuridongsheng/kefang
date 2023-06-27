<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<LINK href="<%=basePath %>images/style.css" type=text/css rel=stylesheet> 
<LINK href="<%=basePath %>images/sdmenu.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>images/tabcon.css" type=text/css rel=stylesheet>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>pro.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>pro.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>pro.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>pro.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>pro.jsp?page="+(page+1);
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
	  form3.action="<%=basePath%>pro.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>pro.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>pro.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>pro.jsp?page="+page;
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
<DIV align=center>
<TABLE id=table12 cellSpacing=0 cellPadding=0 width=940 border=0>
  <TBODY>
  <TR>
    <TD width=1 bgColor=#d3d3d3></TD>
    <TD vAlign=top width=938 bgColor=#ffffff>
      <DIV align=center>
      <TABLE id=table18 cellSpacing=0 cellPadding=0 width=898 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top width=671>
            <TABLE id=table19 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><IMG height=243 src="<%=basePath%>images/h.jpg" width=898 border=0></TD></TR></TBODY></TABLE>
            <TABLE height=20 cellSpacing=0 cellPadding=0 width=30 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE height=3 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
              <TBODY>
              <TR>
                <TD background=<%=basePath%>images/lngk-18_41.gif></TD></TR></TBODY></TABLE>
            <TABLE height=500 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE height=2 cellSpacing=0 cellPadding=0 width=30 
                    border=0><TBODY>
                    <TR>
                      <TD></TD></TR></TBODY></TABLE>
                  <TABLE height=500 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
<%		
    cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from room ");//得到信息总数
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from room order by rid",6);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq"); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>
<TABLE class=xiaxuhui height=28 cellSpacing=0 cellPadding=0 width=882 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE height=22 cellSpacing=0 cellPadding=0 width=882 align=center border=0>
        <TBODY>
        <TR>
        <TD vAlign=bottom width=12>
        <TABLE height=11 cellSpacing=0 cellPadding=0 width=5 border=0>
        <TBODY>
        <TR>
        <TD vAlign=top><IMG height=5 src="<%=basePath%>images/ss.gif" width=3></TD></TR></TBODY>
        </TABLE></TD>
        <TD class=hui12 vAlign=bottom align=center width=30>
        <A href="<%=basePath %>proinfo.jsp?id=<%=pagelist2.get(0).toString()%>" ><%=pagelist2.get(0).toString()%></A></TD>
        <TD class=hui12 align=center width=200><%=pagelist2.get(4).toString()  %></TD>
        <TD class=hui12 align=center width=170><%=pagelist2.get(1).toString()  %> 元</TD>
        <TD class=hui12 align=center width=170><%=pagelist2.get(5).toString()  %></TD>
<%--        <TD class=hui12 align=right><%=pagelist2.get(5).toString().substring(0,10) %></TD>--%>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  </TBODY>
</TABLE>
<%}}%>
                        <TABLE class=xiaxuhui height=28 cellSpacing=0 
                        cellPadding=0 width=882 align=center border=0>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 width=882 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=12></TD>
                                <TD class=hui12 align=left></TD>
                                <TD class=qianhui12 
                              width=85></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE class=xiaxuhui height=28 cellSpacing=0 
                        cellPadding=0 width=882 align=center border=0>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 width=882 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=12></TD>
                                <TD class=hui12 align=left></TD>
                                <TD class=qianhui12 
                              width=85></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE class=xiaxuhui height=28 cellSpacing=0 
                        cellPadding=0 width=882 align=center border=0>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 width=882 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=12></TD>
                                <TD class=hui12 align=left></TD>
                                <TD class=qianhui12 
                              width=85></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE class=xiaxuhui height=28 cellSpacing=0 
                        cellPadding=0 width=882 align=center border=0>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 width=882 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=12></TD>
                                <TD class=hui12 align=left></TD>
                                <TD class=qianhui12 
                              width=85></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE height=28 cellSpacing=0 cellPadding=0 width=882 
                        align=center border=0>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE cellSpacing=0 cellPadding=0 width=882 
                              align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=12></TD>
                                <TD class=hui12 align=left></TD>
                                <TD class=qianhui12 
                              width=85></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE height=10 cellSpacing=0 cellPadding=0 width=30 
                        align=center border=0>
                          <TBODY>
                          <TR>
                            <TD></TD></TR></TBODY></TABLE>
                        <TABLE height=3 cellSpacing=0 cellPadding=0 width=898 
                        align=center border=0>
                          <TBODY>
                          <TR>
                            <TD 
                          background=<%=basePath%>images/lngk-18_41.gif></TD></TR></TBODY></TABLE>
                        <TABLE height=10 cellSpacing=0 cellPadding=0 width=30 
                        border=0>
                          <TBODY>
                          <TR>
                            <TD></TD></TR></TBODY></TABLE>
                        <TABLE cellSpacing=0 cellPadding=0 width=898 align=center border=0>
                          <TBODY>
                          <TR> 
                            <TD class="hui12">
                              <form action="" method="post" name="form3">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=hui align=left> 
    <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->  
      <P align=center>
      <a href="#" onClick="top2()">首页</a> 
      <a href="#" onClick="pre2()">上一页</a> 
      共<%=session.getAttribute("busMessageCount").toString()%>条记录,共<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页 
      <a href="#" onClick="next2()">下一页</a> <a href="#" onClick="last2()">尾页</a> <input name="busjump" type="text" size="3" /> <a href="#" onClick="bjump2()">转</a>
	  </P>
	</TD>
  </TR>
  </TBODY>
</TABLE>
</FORM></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
      <TABLE id=table16 height=30 cellSpacing=0 cellPadding=0 width=100 
border=0>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=1 bgColor=#d3d3d3></TD></TR></TBODY></TABLE>
</DIV>
<%@ include file="iframe/foot.jsp"%>