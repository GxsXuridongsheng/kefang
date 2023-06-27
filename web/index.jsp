<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<DIV align=center>
<TABLE id=table8 height=8 cellSpacing=0 cellPadding=0 width=940 border=0>
  <TBODY>
  <TR>
    <TD width=7 background=<%=basePath %>images/bk2.gif></TD>
    <TD width=926 background=<%=basePath %>images/bk3.gif></TD>
    <TD width=7 background=<%=basePath %>images/bk4.gif></TD></TR></TBODY></TABLE>
<TABLE id=table9 height=309 cellSpacing=0 cellPadding=0 width=940 border=0>
  <TBODY>
  <TR>
    <TD width=1 bgColor=#d3d3d3></TD>
    <TD vAlign=top align=middle width=938 bgColor=#ffffff>
      <TABLE height=12 cellSpacing=0 cellPadding=0 width=30 border=0>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE height=300 cellSpacing=5 cellPadding=1 width=20 bgColor=#e5e5e5 border=0>
        <TBODY>
        <TR>
          <TD align=middle bgColor=#ffffff><IMG height=300 src="<%=basePath %>images/021.jpg" width=888></TD>
		</TR>
		</TBODY>
	  </TABLE></TD>
    <TD width=1 bgColor=#d3d3d3></TD></TR></TBODY></TABLE>
<TABLE id=table12 height=220 cellSpacing=0 cellPadding=0 width=940 border=0>
  <TBODY>
  <TR>
    <TD width=1 bgColor=#d3d3d3></TD>
    <TD vAlign=top align=middle width=938 bgColor=#ffffff>
      <TABLE height=208 cellSpacing=0 cellPadding=0 width=900 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=515>
            <TABLE height=34 cellSpacing=0 cellPadding=0 width=490 border=0>
              <TBODY>
              <TR>
                <TD width=5></TD>
                <TD vAlign=bottom width=419> </TD>
                <TD class=hui12 vAlign=bottom align=right width=35> </TD>
                <TD class=web5 vAlign=bottom width=5></TD></TR></TBODY></TABLE>
            <TABLE height=6 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE height=3 cellSpacing=0 cellPadding=0 width=490 border=0>
              <TBODY>
              <TR>
                <TD background="<%=basePath %>images/z01_10.gif"></TD></TR></TBODY></TABLE>
            <TABLE height=15 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width=490 border=0>
              <TBODY>
              <TR>
                <TD align=middle width=5></TD>
                <TD align=middle width=150>
                  <TABLE cellSpacing=0 cellPadding=0 width=150 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD width=150>
					  <IMG height=110 src="<%=basePath %>images/200811435678281.jpg" width=150 border=0>
					  </TD>
					</TR>
                    
					</TBODY>
				  </TABLE>
				  </TD>
                <TD align=middle width=15></TD>
                <TD align=middle width=150>
                  <TABLE cellSpacing=0 cellPadding=0 width=150 align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=150>
					  <IMG height=110 src="<%=basePath %>images/200811347266237.jpg" width=150 border=0>
					  </TD>
					</TR>
                    
					</TBODY></TABLE></TD>
                <TD align=middle width=15></TD>
                <TD align=middle width=150>
                  <TABLE cellSpacing=0 cellPadding=0 width=150 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD width=150>
					  <IMG height=110 src="<%=basePath %>images/200811562064465.jpg" width=150 border=0>
					  </TD>
					</TR>
                    
					</TBODY>
				  </TABLE>
				  </TD>
                <TD align=middle width=5></TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top align=right width=361>
            <TABLE height=34 cellSpacing=0 cellPadding=0 width=385 border=0>
              <TBODY>
              <TR>
                <TD width=4></TD>
                <TD vAlign=bottom align=left width=310> 客房信息</TD>
                <TD class=hui12 vAlign=bottom align=right width=51>| <A href="<%=basePath %>pro.jsp?t=1" target="">更多</A></TD>
                <TD class=web5 vAlign=bottom width=6></TD>
			  </TR>
			  </TBODY>
			</TABLE>
            <TABLE height=6 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE height=3 cellSpacing=0 cellPadding=0 width=385 border=0>
              <TBODY>
              <TR>
                <TD background=<%=basePath %>images/z01_10.gif></TD></TR></TBODY></TABLE>
            <TABLE height=8 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
<%
	List t1list=cb.getCom("select rid, type from room order by rid limit 6", 2);
	if(!t1list.isEmpty()){
		for(int i=0;i<t1list.size();i++){
		List list2=(List)t1list.get(i);
%>
            <TABLE class=xiaxuhui height=24 cellSpacing=0 cellPadding=0 width=385 align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=top>
                  <TABLE height=20 cellSpacing=0 cellPadding=0 width=375 align=center border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=bottom align=left width=12>
                        <TABLE height=11 cellSpacing=0 cellPadding=0 width=5 border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top><IMG height=5 src="<%=basePath %>images/ss.gif" width=3></TD>
						  </TR>
						  </TBODY>
						 </TABLE>
					  </TD>
                      <TD class=hui12 vAlign=bottom align=left>
                      <A href="<%=basePath %>proinfo.jsp?id=<%=list2.get(0).toString()%>"><%=list2.get(0).toString()%></A></TD>
<%--                      <TD class=qianhui12 vAlign=bottom width=85><%=list2.get(2).toString().substring(0,10) %></TD>--%>
					</TR>
					</TBODY>
				  </TABLE>
				 </TD>
				</TR>
				</TBODY>
			</TABLE>
<%	} }%>
 </TD>
    <TD width=1 ></TD></TR></TBODY></TABLE>

<TABLE height=208 cellSpacing=0 cellPadding=0 width=900 border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width=900>
            <TABLE height=34 cellSpacing=0 cellPadding=0 width=900 border=0>
              <TBODY>
              <TR>
                <TD width=5></TD>
                <TD vAlign=bottom width=860> 客房信息</TD>
                <TD class=hui12 vAlign=bottom align=right width=35>| <A href="<%=basePath %>pro.jsp" target="">更多</A></TD>
                <TD class=web5 vAlign=bottom width=5></TD></TR></TBODY></TABLE>
            <TABLE height=6 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE height=3 cellSpacing=0 cellPadding=0 width=900 border=0>
              <TBODY>
              <TR>
                <TD background="<%=basePath %>images/z01_10.gif"></TD></TR></TBODY></TABLE>
            <TABLE height=15 cellSpacing=0 cellPadding=0 width=20 border=0>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width=900 border=0>
              <TBODY>
              <TR>
                <TD align=middle width=5></TD>
<%
	List plist=cb.getCom("select rid, pic from room order by rid limit 6",2);
	if(!plist.isEmpty()){
		for(int i=0;i<plist.size();i++){
		List list2=(List)plist.get(i);
%>
                <TD class=hui12 align=middle width=150>
                  <A href="<%=basePath %>proinfo.jsp?id=<%=list2.get(0).toString() %>" >
<IMG height=105 src="<%=basePath+list2.get(1).toString() %>" width=150 height=110 border="0"></A>&nbsp;<br>
<A href="<%=basePath %>proinfo.jsp?id=<%=list2.get(0).toString() %>" ><%=list2.get(0).toString() %></A>
				  </TD>
<%	} }%>
                <TD align=middle width=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>

<%@ include file="iframe/foot.jsp"%>