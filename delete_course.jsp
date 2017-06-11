<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%
	String c_id = request.getParameter("c_id");
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:oracle";
	String user = "db01";
	String passwd = "ss2";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(jdbc_driver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	mySQL = "delete from teach where c_id='" + c_id + "' and p_id=" + session_id + "";
	int re = stmt.executeUpdate(mySQL);

	if (re!=0) { %>
		<script>
		  alert("삭제되었습니다..");
		  location.href="select_course.jsp";
		</script>
<% 	} else { %>
	<script>
		  alert("오류..");
		  location.href="select_course.jsp";
		</script>
<% }

	stmt.close();
	myConn.close();
%>
