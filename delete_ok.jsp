<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스케줄 삭제</title>
</head>

<body>
<%
	PreparedStatement pstmt = null;
	
	try{
				%>
		<script language=javascript>
	   	self.window.alert("성공적으로 삭제되었습니다.");
	   	location.href="select.jsp"; 
		</script>
</body>
<%
	}catch(SQLException ex){
		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(myConn != null) try{myConn.close();}catch(SQLException sqle){}   
	}
%>
</html>