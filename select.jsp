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
		CallableStatement stmt = null;
		ResultSet myResultSet = null;
		String mySQL = "{call SelectTimeTable(?,?,?,?,?,?)}";
			stmt = myConn.prepareCall(mySQL);
			stmt.setInt(1,session_id);
			stmt.setInt(2,year);
			stmt.setInt(3,semester);
			stmt.registerOutParameter(4,oracle.jdbc.OracleTypes.CURSOR);
			stmt.registerOutParameter(5,oracle.jdbc.OracleTypes.NUMBER);
			stmt.registerOutParameter(6,oracle.jdbc.OracleTypes.NUMBER);
			stmt.execute();
			
			myResultSet = (ResultSet)stmt.getObject(4);
			int sumCourse  = stmt.getInt(5);
			int sumUnit = stmt.getInt(6);
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
			}%>
	</table>
<h3 align="center">총 <%=sumCourse %> 과목, <%=sumUnit %> 학점 신청하셨습니다.</h3>
	<%
		stmt.close();
		myConn.close();
	%>


<%@ include file="footer.jsp"%>