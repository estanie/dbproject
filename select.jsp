<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<head>
	<title>내 강의 조회</title>
</head>
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
		<th>요일</th>
		<th>시간</th>
		<th>장소</th>
		<th>수강신청</th>
	</tr>
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
		mySQL = "select c.c_id, c.c_id_no, c.c_name, c.c_unit, t_where, t.t_time, t.t_day from teach t, course c, enroll e "+
				" where t.t_year= "+year+" and t.t_semester = "+semester+" and t.c_id = c.c_id and c.c_id = e.c_id and t.c_id_no = c.c_id_no and c.c_id_no = e.c_id_no and s_id="+session_id;

		myResultSet = stmt.executeQuery(mySQL);

		if (myResultSet != null) {
			while (myResultSet.next()) {
				String c_id = myResultSet.getString("c_id");
				int c_id_no = myResultSet.getInt("c_id_no");
				String c_name = myResultSet.getString("c_name");
				int c_unit = myResultSet.getInt("c_unit");
				int t_time = myResultSet.getInt("t_time");
				int t_day = myResultSet.getInt("t_day");
				String t_where = myResultSet.getString("t_where");
	%>
	<tr>
		<td align="center"><%=c_id%></td>
		<td align="center"><%=c_id_no%></td>
		<td align="center"><%=c_name%></td>
		<td align="center"><%=c_unit%></td>
		<td align="center"><%=t_day %></td>
		<td align="center"><%=t_time %></td>
		<td align="center"><%= t_where %>
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

<%@ include file="footer.jsp"%>