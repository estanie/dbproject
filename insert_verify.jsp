<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<html>
<head><title></title></head>
<body>

<%
  int s_id = (Integer) session.getAttribute("id");
  String c_id = request.getParameter("c_id");
  String c_id_no = (request.getParameter("c_id_no"));
%>
<%
  String result = null;

  CallableStatement cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
  cstmt.setInt(1, s_id);
  cstmt.setString(2, c_id);
  cstmt.setString(3, c_id_no);
  cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
  try {
    cstmt.execute();
    result = cstmt.getString(4);
%>
<script>
  alert("<%= result %>");
  location.href = "insert.jsp";
</script>
<%
  } catch (SQLException ex) {
    System.err.println("SQLException: " + ex.getMessage());
  } finally {
    if (cstmt != null)
      try {
        myConn.commit();
        cstmt.close();
        myConn.close();
      } catch (SQLException ex) {
      }
  }
%>
</form></body>
</html>