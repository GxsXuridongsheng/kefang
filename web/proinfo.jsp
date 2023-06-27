<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<script type="text/javascript">
<!--
function CheckForm()
{
	if(document.plform.content.value=="")
	{
		alert("请填写评论内容！");
		document.plform.content.focus();
		return false;
	}
	 
}
//-->
</script>
<%
	String id=request.getParameter("id");
	if(id==null)id=(String)request.getAttribute("nid"); 
	List nlist=cb.get1Com("select * from room where rid='"+id+"'",6);
%>
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
            <TABLE height=500 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE height=39 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=hong12cc vAlign=bottom width=15></TD>
                      <TD class=hong12cc vAlign=bottom align=center><%=nlist.get(1).toString() %></TD></TR></TBODY></TABLE>
                  <TABLE height=3 cellSpacing=0 cellPadding=0 width=30 border=0><TBODY>
                    <TR>
                      <TD></TD></TR></TBODY></TABLE>
                  <TABLE height=3 cellSpacing=0 cellPadding=0 width=898 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD background=<%=basePath%>images/lngk-18_41.gif></TD></TR></TBODY></TABLE>
                  <TABLE height=27 cellSpacing=0 cellPadding=0 width=870 align=center border=0>
                    <TBODY>
                    <TR> 
                      <TD class=hui12hj vAlign=bottom align=center width=870>
<%--                      发布时间：<%=nlist.get(5).toString() %>&nbsp;&nbsp;--%>
                     价格：<%=nlist.get(1).toString() %>&nbsp;&nbsp;
<%--                      评论：<%=cb.getCount("select count(*) from pl where nid='"+nlist.get(0).toString()+"'") %> --%>
                      <a href="<%=basePath%>ComServlet?method=zc&pid=<%=nlist.get(0).toString()%>">我要预定</a> （需要先登录）
                      </TD>
                      <TD class=hui12hj vAlign=bottom align=right width=61></TD></TR></TBODY></TABLE>
                  <TABLE height=15 cellSpacing=0 cellPadding=0 width=35 border=0>
                    <TBODY>
                    <TR>
                      <TD></TD></TR></TBODY></TABLE>
                  <TABLE cellSpacing=0 cellPadding=0 width=870 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD class=h14hangj25 align=center>
                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          <TBODY>
                           <TR>
                            <TD style="LINE-HEIGHT: 30px" colspan=2 align=center><img src=<%=basePath+nlist.get(2).toString() %> width=200 height=200 border=0></TD>
                          </TR>
                          <TR>
                            <TD style="LINE-HEIGHT: 30px" colspan=2><%=nlist.get(3).toString() %></TD>
                          </TR>
                          
                          </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE></DIV>
<%--      <TABLE id=table16 height=80 cellSpacing=0 cellPadding=0 width=100 border=0  align=center>--%>
<%--        <TBODY>--%>
<%--        <TR>--%>
<%--          <TD align=center>--%>
<%--<FORM name="plform" method="post" action="<%=basePath %>NewsServlet?method=pl&nid=<%=id%>" onSubmit="return CheckForm();"> --%>
<%--<TABLE cellSpacing=0 cellPadding=0 width=759 align=center border=0>--%>
<%--  <TBODY>--%>
<%--  <TR>--%>
<%--    <TD background="<%=basePath %>images/list_04.gif" colspan="3" height="20">&nbsp;&nbsp;评论</TD>--%>
<%--  </TR>--%>
<%--  &lt;%&ndash;%>
<%--  	List pllist=cb.getCom("select * from pl where nid='"+id+"'",5);--%>
<%--  	if(!pllist.isEmpty()){--%>
<%--		for(int i=0;i<pllist.size();i++){--%>
<%--			List list2 =(ArrayList)pllist.get(i);--%>
<%--  %>--%>
<%--  <TR>--%>
<%--    <TD align=left><%=list2.get(2).toString()%></TD>--%>
<%--    <TD align=center><%=list2.get(3).toString()%></TD>--%>
<%--    <TD align=right><%=list2.get(4).toString()%></TD>--%>
<%--  </TR>--%>
<%--  <%}} %>--%>
<%--  <TR>--%>
<%--      <TD colspan="3" align=center><TEXTAREA id="content" style="WIDTH: 260px; HEIGHT: 80px" name="content"></TEXTAREA></TD></TR>--%>
<%--    <TR>--%>
<%--      <TD colspan="3" align=center> --%>
<%--      <INPUT value="提交评论留言" type=submit>--%>
<%--      </TD>--%>
<%--	</TR>--%>
<%--  </TBODY>--%>
<%--</TABLE>--%>
<%--</FORM>--%>
<%--          </TD></TR></TBODY></TABLE></TD>--%>
<%--    <TD width=1 bgColor=#d3d3d3></TD></TR></TBODY></TABLE>--%>

</DIV>
<%@ include file="iframe/foot.jsp"%>