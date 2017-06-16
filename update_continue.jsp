<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
<body>

	<%
		String s_pwd = (String) request.getParameter("userpw");
		Statement stmt = null;
		ResultSet rs = null;
		String mySQL = "select s_name, s_addr, s_email from students where s_id = " + session_id + " and s_pwd = '"
				+ s_pwd + "'";
		stmt = myConn.createStatement();
		rs = stmt.executeQuery(mySQL);
		if (rs.next()) {
	%>
	<form method="post" action="update_verify.jsp">
		<h1>정보 수정란입니다.</h1>
		<table>
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
						title=“비밀번호 "/></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="수정완료" /></td>
				</tr>
			</tbody>
		</table>
	</form>


	<%
		}

		else {
	%>
	<script>
		alert("비밀번호가 틀립니다.");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>
