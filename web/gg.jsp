<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<LINK href="<%=basePath %>images/style.css" type=text/css rel=stylesheet> 
<LINK href="<%=basePath %>images/sdmenu.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>images/tabcon.css" type=text/css rel=stylesheet>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>gg.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>gg.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>gg.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>gg.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>gg.jsp?page="+(page+1);
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
	  form3.action="<%=basePath%>gg.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>gg.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>gg.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>gg.jsp?page="+page;
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
	int cou = cb.getMessageCount("select count(*) from gg ");//�õ���Ϣ����			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from gg order by id desc",4);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
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
        <TD class=hui12 vAlign=bottom align=left width=535>
        <A href="<%=basePath %>gginfo.jsp?id=<%=pagelist2.get(0).toString()%>" ><%=pagelist2.get(1).toString()%></A></TD> 
         <TD class=qianhui12 align=right><%=pagelist2.get(3).toString() %></TD>
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
    <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
	<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->  
      <P align=center>
      <a href="#" onClick="top2()">��ҳ</a> 
      <a href="#" onClick="pre2()">��һҳ</a> 
      ��<%=session.getAttribute("busMessageCount").toString()%>����¼,��<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ 
      <a href="#" onClick="next2()">��һҳ</a> <a href="#" onClick="last2()">βҳ</a> <input name="busjump" type="text" size="3" /> <a href="#" onClick="bjump2()">ת</a>
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