<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
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
	mySQL = "select s_id, s_name from students where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
	ResultSet rs = stmt.executeQuery(mySQL);
	if (rs!= null){
		if (rs.next())
		{
			String name = rs.getString("s_name");
			session.setAttribute("user",name);
			response.sendRedirect("main.jsp");
		}
		else
			response.sendRedirect("login.jsp");
	}

	stmt.close();
	myConn.close();
%>
