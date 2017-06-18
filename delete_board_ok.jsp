<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<%
  int idx = Integer.parseInt(request.getParameter("idx"));
  String password = request.getParameter("password");
  Statement stmt = null;
  String mySQL = null;
  stmt = myConn.createStatement();
  mySQL = "delete from board where b_no=" + idx + " and b_pwd='" + password + "'";

  int res = stmt.executeUpdate(mySQL);

  if (res != 0) {
%>
<script>
  alert("삭제되었습니다.");
  location.href = "list.jsp";
</script>
<% } else { %>
<script>
  alert("오류");
  location.href = "delete_board.jsp";
</script>
<%
  }
  stmt.close();
  myConn.close();
%>