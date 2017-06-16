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
		String check = request.getAttribute("check");
		String formPass = request.getParameter("userpw");
		String formName = request.getParameter("username");
		String formAddr = request.getParameter("useraddr");
		String formEmail = request.getParameter("useremail");
		
		PreparedStatement pstmt = null;
		
		if (check.equals("1")) {
		%>
		String sql = "UPDATE students set s_pwd=?,s_addr=?,s_email=? where s_id =?";        
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, formPass);
		pstmt.setString(2, formAddr);
		pstmt.setString(3, formEmail);
		pstmt.setString(4, session_id);
		pstmt.executeUpdate();
	
		<%
		}
		else if (check.equals("2")) {
		%>
		String sql = "UPDATE professor set p_pwd=?,p_email=? where p_id =?";        
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, formPass);
		pstmt.setString(2, formEmail);
		pstmt.setString(3, session_id);
		pstmt.executeUpdate();
		<%
		}
		
     } catch(SQLException ex) {
  	   
   	   if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	
     }
%>
<script>
	alert("<%= sMessage %> ");
	location.href="update.jsp";
</script>
</body>
</html>
