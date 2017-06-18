<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<link rel="stylesheet" href="css/table.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<!-- / College Timetable -->
<%
  class Course {
    String c_name;
    String t_where;
    String p_name;
    String color;

    public Course(String c_name, String t_where, String p_name) {
      this.c_name = c_name;
      this.t_where = t_where;
      this.p_name = p_name;
      this.color = color_select();
    }

    String color_select() {
      Random random = new Random();
      String result = null;
      result = "color" + (random.nextInt(5) + 1);
      return result;
    }
  }


  Course[][] cour = new Course[8][5];

  if (session_id == null) { %>
<script>
  alert("로그인이 필요합니다.");
  location.href = "login.jsp";
</script>
<% } else {

  Statement stmt = null;
  String sql = null;
  stmt = myConn.createStatement();
  if (session_identity == "student") {
    sql = "select c.c_name, t.t_where, t.t_day, t.t_time, p.p_name"
      + " from course c, enroll e, teach t, professor p"
      + " where e.C_ID=c.C_ID and e.C_ID_NO=c.C_ID_NO and e.s_id = " + session_id
      + " and e.e_semester = DATE2ENROLLSEMESTER(SYSDATE) and e.e_year = DATE2ENROLLYEAR(SYSDATE)"
      + " and t.C_ID = e.c_id and t.C_ID_NO = e.c_id_no and p.p_id = t.p_id";
  } else {
    sql = "select c.c_name, t.t_where, t.t_day, t.t_time"
      + " from course c, teach t"
      + " where t.t_semester = DATE2ENROLLSEMESTER(SYSDATE) and t.t_year = DATE2ENROLLYEAR(SYSDATE)"
      + " and t.C_ID = c.c_id and t.C_ID_NO = c.c_id_no and t.p_id = " + session_id;
  }
  ResultSet rs = stmt.executeQuery(sql);
  while (rs.next()) {

    String c_name = rs.getString(1);
    String t_where = rs.getString(2);
    int t_day = rs.getInt(3);
    int t_time = rs.getInt(4) - 1;
    String p_name = "";
    if (session_identity == "student") {
      p_name = rs.getString(5);
    }
    if (t_day == 1)
      cour[t_time][0] = cour[t_time][2] = new Course(c_name, t_where, p_name);
    else if (t_day == 2)
      cour[t_time][1] = cour[t_time][3] = new Course(c_name, t_where, p_name);
    else
      cour[t_time][4] = cour[t_time + 1][4] = new Course(c_name, t_where, p_name);
%>

<%

  }
%>
<div id="containerwrap">
  <div id="container">
    <div class="section_title">
      <h1>
        <span>시간표</span>
      </h1>
    </div>
    <div class='tab'>
      <center>
        <table border='0' cellpadding='0' cellspacing='0'>
          <tr class='days'>
            <th></th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
          </tr>
          <% for (int i = 0; i < 8; i++) {%>
          <tr>
            <td class='time'><%=i + 1 %>
            </td>
            <%
              for (int j = 0; j < 5; j++) {
                if (cour[i][j] != null) {
            %>
            <td class='mouseon <%=cour[i][j].color %>'
                data-tooltip='<%= cour[i][j].p_name %>'><%=cour[i][j].c_name %><br/>
              <%=cour[i][j].t_where %>
            </td>
            <% } else {%>
            <td></td>
            <%
                }
              }
            %>
          </tr>
          <%} %>
        </table>
      </center>
    </div>
    <% } %>
  </div>
</div>

<%@ include file="footer.jsp" %>