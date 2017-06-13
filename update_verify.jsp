<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<html>
<head><title> 수강신청 사용자 정보 수정 </title></head>
<body>

<%  
	String sMessage = "변경이 완료되었습니다.";
	try{
		String s_pwd = (String)request.getParameter("userpw");
		Statement stmt = null;
		ResultSet rs = null;
		String mySQL = "update students set s_pwd = '"+s_pwd +"' where s_id = "+session_id;

		stmt = myConn.createStatement();
		rs = stmt.executeQuery(mySQL);

		
     } catch(SQLException ex) {
  	   
   	   if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	
     }
%>
하하하하 <%= sMessage %>
</body>
</html>
