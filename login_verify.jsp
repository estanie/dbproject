<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%

  int userID = Integer.parseInt(request.getParameter("userid"));
  String userPassword = request.getParameter("userpw");
  Statement stmt = null;
  String mySQL = null;
  String mySQL2 = null;
  stmt = myConn.createStatement();
  mySQL = "select s_id,s_name from students where s_id=" + userID + " and s_pwd='" + userPassword + "'";
  ResultSet rs = stmt.executeQuery(mySQL);

  if (rs.next()) {
    String name = rs.getString("s_name");
    int id = rs.getInt("s_id");
    session.setAttribute("id", id);
    session.setAttribute("user", name);
    session.setAttribute("identity", "student");
    response.sendRedirect("main.jsp");
  } else {
    mySQL2 = "select p_id,p_name from professor where p_id=" + userID + " and p_pwd='" + userPassword + "'";
    ResultSet prs = stmt.executeQuery(mySQL2);
    if (prs.next()) {
      String name = prs.getString("p_name");
      int id = prs.getInt("p_id");
      session.setAttribute("id", id);
      session.setAttribute("user", name);
      session.setAttribute("identity", "professor");
      response.sendRedirect("main.jsp");
    } else {
%>

<script language=javascript>
  alert("일치하는 회원정보가 없습니다.");
  location.href = "login.jsp";
</script>

<%
    }
  }

  stmt.close();
  myConn.close();
%>
