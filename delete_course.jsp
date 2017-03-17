<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<%
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
	Statement stmt = null;
	stmt = myConn.createStatement();
	try{
	String mySQL = null;
	
	mySQL = "delete from teach where c_id='" + c_id + "' and c_id_no = "+c_id_no+" and p_id=" + session_id;
	int re = stmt.executeUpdate(mySQL);

	if (re!=0) { %>
<script>
		  alert("삭제되었습니다.");
		  location.href="select_course.jsp";
		</script>
<% 	}
	
	} catch(SQLException ex){
	%>
<script>
	alert('삭제할 수 없습니다. 수강중인 학생이 있습니다.');
	history.back();
	</script>
<%	
	}
	finally{
		stmt.close();
		myConn.close();
	}
%>
