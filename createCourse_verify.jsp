<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<%
	String c_id = request.getParameter("courseId");
	String c_name = request.getParameter("courseName");
	int c_id_no = Integer.parseInt(request.getParameter("courseIdNo"));
	int c_unit = Integer.parseInt(request.getParameter("courseUnit"));
	int t_time = Integer.parseInt(request.getParameter("courseTime"));
	int t_max = Integer.parseInt(request.getParameter("courseMax"));
	int t_day = Integer.parseInt(request.getParameter("courseDate"));
	String t_where = request.getParameter("courseWhere");
	String result = null;
	CallableStatement stmt = null;
	try  {  	
		stmt = myConn.prepareCall("call InsertTeach(?,?,?,?,?,?,?,?,?,?)");
		
		stmt.setInt(1, session_id);
		stmt.setString(2, c_id);
		stmt.setInt(3,c_id_no);
		stmt.setString(4,c_name);
		stmt.setInt(5,c_unit);
		stmt.setInt(6,t_max);
		stmt.setInt(7,t_day);
		stmt.setInt(8,t_time);
		stmt.setString(9,t_where);
		stmt.registerOutParameter(10,oracle.jdbc.OracleTypes.VARCHAR);
		stmt.execute();
		result = stmt.getString(10);
%>
<script>
	alert("<%= result %>");
	history.back();
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
