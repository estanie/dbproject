<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<html>
	<body>
		<table width="75%" align="center" border>
			<thead>
				<th>학번</th>
				<th>이름</th>
				<th>전공</th>
			</thead>
			<tbody>
<%
	ResultSet rs = null;
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
	Statement stmt = null;
	String mySQL = null;
	stmt = myConn.createStatement();
	mySQL = "select s_id, s_name, s_major from students where s_id in (select s_id from enroll where c_id = '"+c_id+"' and c_id_no="+c_id_no+")";
	
	rs = stmt.executeQuery(mySQL);
	while (rs.next()){
		
		String s_name = rs.getString("s_name");
		String s_major = rs.getString("s_major");
		int s_id = rs.getInt("s_id");
		%>
		<tr>
		<td><%=s_id %></td>
		<td><%=s_name %></td>
		<td><%=s_major %></td>
		</tr>
		<%
	}
	stmt.close();
	myConn.close();
%>
</tbody>
</table>
</body>
</html>