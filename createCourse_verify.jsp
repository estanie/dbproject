<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%
	String c_id = request.getParameter("courseId");
	String c_name = request.getParameter("courseName");
	int c_id_no = 1;
	int c_unit = Integer.parseInt(request.getParameter("courseUnit"));
	int t_time = Integer.parseInt(request.getParameter("courseTime"));
	int t_max = Integer.parseInt(request.getParameter("courseMax"));
	Connection myConn = null;
	CallableStatement stmt = null;
	String mySQL = null;
	String mySQL2 = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:oracle";
	String user = "db01";
	String passwd = "ss2";
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(jdbc_driver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.prepareCall("insert into course values(?,?,?,?)");
	stmt.setString(1, c_id);
	stmt.setInt(2, 1);
	stmt.setInt(3,c_unit);
	stmt.setString(4,c_name);
	
	try  {  	
		stmt.execute();
		stmt = myConn.prepareCall("insert into teach values(?,?,?,?,?,?,?)");
		stmt.setString(1, c_id);
		stmt.setInt(2,c_id_no);
		stmt.setInt(3, session_id);
		stmt.setInt(4,2017);
		stmt.setInt(5,t_time);
		stmt.setString(6,"myungsin" );
		stmt.setInt(7,1);

		stmt.execute();
%>
<script>	
	alert("생성됨 "); 
	location.href="create_course.jsp";
</script>
<%		
	} catch(SQLException ex) {		
		 System.err.println("SQLException: " + ex.getMessage());
	}  
	finally {
	    if (stmt != null) 
            try { myConn.commit(); stmt.close();  myConn.close(); }
 	      catch(SQLException ex) { }
     }
%>
