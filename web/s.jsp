<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>sinfo.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>sinfo.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>sinfo.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page+1);
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
	  form3.action="<%=basePath%>sinfo.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>sinfo.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
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
<DIV class=box>
<DIV class=slide>
<DIV class=slide_top></DIV>
 
<DIV class=slide_cannel> </DIV>
 
<P>
<FORM name="search" action="<%=basePath %>sinfo.jsp" method="post">
<TABLE class=table cellSpacing=0 cellPadding=0 align=center border=0>
  <TBODY>
  <TR>
    <TD width=60>搜索类型：</TD>
    <TD width=127> <INPUT size=30 name=keyword required></TD>
  </TR>
  <TR>
    <TD align=middle colSpan=2>
      <P class=submit><INPUT id=button type=submit value=确定搜索 name=button></P>
	</TD>
  </TR>
  </TBODY>
</TABLE>
</FORM>
</DIV>
<DIV class=content>
 
 
</DIV>
</DIV>
<DIV class=content_bottom></DIV></DIV>
<%@ include file="iframe/foot.jsp"%>