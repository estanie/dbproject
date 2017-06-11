<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>내 강의 조회</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<%
	if (session_id == null)
		response.sendRedirect("login.jsp");
%>
<a href="create_course.jsp">강의 추가</a>
<table width="75%" align="center" border>
	<br/>
	<tr>
		<th>과목번호</th>
		<th>분반</th>
		<th>과목명</th>
		<th>학점</th>
		<th>수강신청</th>
	</tr>
	<%
		Statement stmt = null;
		ResultSet myResultSet = null;
		String mySQL = "";
			stmt = myConn.createStatement();
		mySQL = "select c_id,c_id_no,c_name,c_unit from course where c_id in (select c_id from teach where p_id='"
				+ session_id + "')";

		myResultSet = stmt.executeQuery(mySQL);

		if (myResultSet != null) {
			while (myResultSet.next()) {
				String c_id = myResultSet.getString("c_id");
				int c_id_no = myResultSet.getInt("c_id_no");
				String c_name = myResultSet.getString("c_name");
				int c_unit = myResultSet.getInt("c_unit");
	%>
	<tr>
		<td align="center"><%=c_id%></td>
		<td align="center"><%=c_id_no%></td>
		<td align="center"><%=c_name%></td>
		<td align="center"><%=c_unit%></td>
		<td align="center"><a
				href="delete_course.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">삭제</a></td>
	</tr>
	<%
			}
		}
		stmt.close();
		myConn.close();
	%>
</table>
</body>
</html>
