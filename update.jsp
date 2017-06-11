
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
	<form method="post" action="update_verify.jsp">
		<h2>정보 수정을 위해 정보를 입력해주세요.</h2>
		<table>
			<%@ include file="top.jsp"%>
			<%
				if (session_id == null)
					response.sendRedirect("login.jsp");

				Connection myConn = null;
				Statement stmt = null;
				ResultSet rs = null;
				ResultSet prs = null;

				String dburl = "jdbc:oracle:thin:@localhost:1521:oracle";
				String user = "db01";
				String passwd = "ss2";

				String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
				Class.forName(jdbc_driver);
				myConn = DriverManager.getConnection(dburl, user, passwd);

				String mySQL = "select s_pwd from students where s_id='" + session_id + "'";

				stmt = myConn.createStatement();
				rs = stmt.executeQuery(mySQL);

				if (rs != null) {
					if (rs.next()) {
			%>

			<tbody>
				<tr>
					<td><%=session_id%><input type="hidden" id="userid"
						name="userid" title="아이디" value=“ <%=session_id%>"/></td>
				</tr>
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td><input type="password" id="userpw" name="userpw"
						title=“비밀번호"/></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="수정 완료”></td></tr>
		</tbody>
		
<% }
 else {
	String mySQL2 = "select p_id from professor where p_id='" + userID + "'";
	 prs = stmt.executeQuery(mySQL2);
	if (prs.next()) {
	 %>
				<tr>
					<td><%=session_id%><input type="hidden" id="userid"	 name="userid" title="아이디" value=“ <%=session_id%>" /></td>
				</tr>
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td><input type="password" id="userpw" name="userpw" title=“비밀번호 "/></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" value="수정 완료” /
					></td></tr>
	 <%}
			}
			}
			stmt.close();
			myConn.close();%>
 </table>
		</form>
</body></html>
