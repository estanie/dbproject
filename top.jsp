<%@ page contentType="text/html; charset=UTF-8"%>
<%
//	String session_name = (String) session.getAttribute("user");
	Integer session_id = (Integer) session.getAttribute("id");
	String session_identity = (String) session.getAttribute("identity");
	String log;
	if (session_id == null)
		log = "<a href=login.jsp>로그인</a>";
	else
		log = "<a href=logout.jsp>로그아웃</a>";
%>
<table width="75%" align="center" bgcolor="#FFFF99" border>
	<tr>
		<td align="center"><b><%=log%></b></td>
		<% if (session_identity == "professor"){ %>
		<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
		<td align="center"><b><a href="select_course.jsp">나의 강의 목록(추가,삭제)</b></td>

		<%} else {%>
		
		<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
		<td align="center"><b><a href="insert.jsp">수강신청 입력</b></td>
		<td align="center"><b><a href="delete.jsp">수강신청 삭제</b></td>
		<td align="center"><b><a href="select.jsp">수강신청 조회</b></td>
		<% } %>
	</tr>
</table>