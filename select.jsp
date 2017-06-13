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
	{
		%>	<script>
			alert("로그인이 필요합니다.");
			location.href = "login.jsp";
		</script>
	<% 
	}
%>
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
		mySQL = "select c.c_id, c.c_id_no, c.c_name, c.c_unit from course c, enroll e where c.c_id = e.c_id and c.c_id_no = e.c_id_no and s_id="+session_id;

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
				href="delete.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">삭제</a></td>
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
