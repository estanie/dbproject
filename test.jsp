<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head> <title>학생목록보기</title> </head>
<body>
<table> 
<tr><th>name<th></tr>
<% 
  Connection myConn = null;
  Statement stmt = null;
  String mySQL = null;
  String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
  String user = "whoo";
  String passwd = "1224";
  String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
  Class.forName(jdbc_driver);
  
  myConn = DriverManager.getConnection(dburl, user, passwd);
  stmt = myConn.createStatement();

	String s_major = "컴퓨터과학부";
	mySQL = "select * from schedule";
	ResultSet rs = stmt.executeQuery(mySQL);
	if (rs!= null)
	{
		while (rs.next())
  		{
			String name = rs.getString("year");
			String s_id=rs.getString("month");
%>
<tr><td><%=name%></td><td><%=s_id%></td></tr>
<%
		} 
	} 
%>
</table>
<% 
stmt.close(); myConn.close(); 
%>
</body>
</html> 