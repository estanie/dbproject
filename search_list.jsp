
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>게시판 검색</title>
</head>
<body>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1><span>검색 결과</span></h1>
				</div>
				<div id="content" class="myPoint">
				<%
				request.setCharacterEncoding("utf-8");
				String searchKey = request.getParameter("searchKey");	
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				String sql = "select * from board where username =?";        
				pstmt = myConn.prepareStatement(sql); 
				pstmt.setString(1, searchKey);
				rs = pstmt.executeQuery();
String fid = null; String fpw= null;
%><%
if(rs.next()){ 
%><center>
					<div class="pointBox">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="58">조회수</td>
   <td width="7"><img src="table_right.gif" width="5" height="30" /></td>
  </tr>
<tr height="25" align="center">
<td>&nbsp;</td>
	<td><%=rs.getString("num")%></td>
	<td align="left">
	<a href="view.jsp?idx=<%=rs.getString("num")%>"><%=rs.getString("title")%></td>
	<td align="center"><%=rs.getString("username")%></td>
	<td align="center"><%=rs.getString("hit")%></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
   <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
<%}else{%><!-- .pointBox --><center>
					<div class="pointBox">
<table class=table4_1><tr align="center"><h1>검색결과 없음</h1></tr></table>
<%}
pstmt.close();
myConn.close();
%>
</div>
</center>
</div>
<%@ include file="footer2.jsp" %>
</div>
<%@ include file="footer.jsp"%>