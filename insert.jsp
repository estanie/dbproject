<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>수강신청 입력</title>
</head>
<body>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<%
	if (session_id == null)
		response.sendRedirect("login.jsp");
%>
	<%
		CallableStatement cstmt = null;
		CallableStatement cstmt2 = null;
		cstmt = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
		cstmt.registerOutParameter(1,java.sql.Types.INTEGER);
		cstmt.execute();
		int semester = cstmt.getInt(1);
		cstmt2 = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
		cstmt2.registerOutParameter(1,java.sql.Types.INTEGER);
		cstmt2.execute();
		int year = cstmt2.getInt(1);
		Statement stmt = null;
		ResultSet myResultSet = null;
		String mySQL = "";
		stmt = myConn.createStatement();
		mySQL = "select c_id,c_id_no,c_name,c_unit from course where c_id not in (select c_id from enroll where s_id='"
				+ session_id + "') and c_id in (select c_id from teach where t_year ="+year+" and t_semester = "+semester+")";
		%>
			<h1><%=year %> 년도 <%=semester %> 학기 수강신청</h1>
		<table width="75%" align="center" border>
	<br>
	<tr>
			
		<th>과목번호</th>
		<th>분반</th>
		<th>과목명</th>
		<th>학점</th>
		<th>수강신청</th>
	</tr>
		
		<%
		
		myResultSet = stmt.executeQuery(mySQL);
		if (myResultSet != null) {
			while (myResultSet.next()) {
				String c_id = myResultSet.getString("c_id");
				String c_id_no = myResultSet.getString("c_id_no");
				String c_name = myResultSet.getString("c_name");
				int c_unit = myResultSet.getInt("c_unit");
	%>
	<tr>

		<td align="center"><%=c_id%></td>
		<td align="center"><%=c_id_no%></td>
		<td align="center"><%=c_name%></td>
		<td align="center"><%=c_unit%></td>
		<td align="center"><a
				href="insert_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">신청</a></td>
	</tr>
	<%
			}
		}
		cstmt.close();
		cstmt2.close();
		stmt.close();
		myConn.close();
	%>
</table>
</body>
</html>