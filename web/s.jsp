<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>sinfo.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
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
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>sinfo.jsp?page="+(page+1);
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
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>sinfo.jsp?page="+page;
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
<DIV class=box>
<DIV class=slide>
<DIV class=slide_top></DIV>
 
<DIV class=slide_cannel> </DIV>
 
<P>
<FORM name="search" action="<%=basePath %>sinfo.jsp" method="post">
<TABLE class=table cellSpacing=0 cellPadding=0 align=center border=0>
  <TBODY>
  <TR>
    <TD width=60>�������ͣ�</TD>
    <TD width=127> <INPUT size=30 name=keyword required></TD>
  </TR>
  <TR>
    <TD align=middle colSpan=2>
      <P class=submit><INPUT id=button type=submit value=ȷ������ name=button></P>
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