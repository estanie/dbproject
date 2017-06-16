<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<%
	String c_id = request.getParameter("courseId");
	String c_name = request.getParameter("courseName");
	int c_id_no = 1;
	int c_unit = Integer.parseInt(request.getParameter("courseUnit"));
	int t_time = Integer.parseInt(request.getParameter("courseTime"));
	int t_max = Integer.parseInt(request.getParameter("courseMax"));
	int t_day = Integer.parseInt(request.getParameter("courseDate"));
	String t_where = request.getParameter("courseWhere");
	CallableStatement stmt = null;
	String mySQL = null;
	String mySQL2 = null;
	stmt = myConn.prepareCall("insert into course values(?,?,?,?)");
	stmt.setString(1, c_id);
	stmt.setInt(2, 1);
	stmt.setInt(3,c_unit);
	stmt.setString(4,c_name);
	
	try  {  	
		stmt.execute();
		stmt = myConn.prepareCall("insert into teach values(?,?,?,DATE2ENROLLYEAR(SYSDATE), DATE2ENROLLSEMESTER(SYSDATE), ?,?,?,?)");
		stmt.setString(1, c_id);
		stmt.setInt(2,c_id_no);
		stmt.setInt(3, session_id);
		stmt.setInt(4,t_time);
		stmt.setInt(5,t_day);
		stmt.setInt(6,t_max);
		stmt.setString(7,t_where);

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
