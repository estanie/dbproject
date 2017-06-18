<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<div id="containerwrap">
  <div id="container">
    <div class="section_title">
      <h1>
        <span>수강생 조회</span>
      </h1>
    </div>

    <center>
      <table width="75%" align="center" border>
        <thead bgcolor="lightgrey">
        <tr>
          <th>학번</th>
          <th>이름</th>
          <th>전공</th>
        </tr>
        </thead>

        <%
          ResultSet rs = null;
          String c_id = request.getParameter("c_id");
          int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
          Statement stmt = null;
          String mySQL = null;
          stmt = myConn.createStatement();
          mySQL = "select s_id, s_name, s_major from students where s_id in (select s_id from enroll where c_id = '"
            + c_id + "' and c_id_no=" + c_id_no + ")";

          rs = stmt.executeQuery(mySQL);
          while (rs.next()) {

            String s_name = rs.getString("s_name");
            String s_major = rs.getString("s_major");
            int s_id = rs.getInt("s_id");
        %>

        <tbody>
        <tr>
          <td align="center"><%=s_id%>
          </td>
          <td align="center"><%=s_name%>
          </td>
          <td align="center"><%=s_major%>
          </td>
        </tr>

        <%
          }
          stmt.close();
          myConn.close();
        %>
        </tbody>
      </table>
    </center>
  </div>
</div>
<%@ include file="footer.jsp" %>