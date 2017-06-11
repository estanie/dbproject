<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<%
		Connection conn = null;
		Statement stmt = null;
		String mySQL = null;
		String dburl = "jdbc:oracle:thin:@localhost:1521:oracle";
		String user = "db01";
		String pwd = "ss2";
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";

		String user_address = request.getParameter("userAddress");
		String user_pwd = request.getParameter("userPassword");

		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(dburl, user, pwd);
		stmt = conn.createStatement();
%>