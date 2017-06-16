<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<link rel="stylesheet" href="table.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- / College Timetable -->
<%
	class Course{
	String c_name;
	String t_where;
	public Course(String c_name, String t_where){
		this.c_name = c_name;
		this.t_where = t_where;
	}
}

Course[][] cour = new Course[8][5];

if (session_id == null){ %>
<script>
	alert("로그인이 필요합니다.");
	location.href="login.jsp";
	</script>
<% }
	else {
		
		Statement stmt  = null;
		stmt = myConn.createStatement();
		String sql = "select c.c_name, t.t_where, t.t_day, t.t_time"
				+" from course c, teach t"
				+" where t.t_semester = DATE2ENROLLSEMESTER(SYSDATE) and t.t_year = DATE2ENROLLYEAR(SYSDATE)"
				+" and t.C_ID = c.c_id and t.C_ID_NO = c.c_id_no and t.p_id = "+session_id;
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()){
			String c_name = rs.getString(1);
			String t_where = rs.getString(2);
			int t_day = rs.getInt(3);
			int t_time = rs.getInt(4)-1;
			if (t_day == 1)
				cour[t_time][0] = cour[t_time][2] = new Course(c_name, t_where);
			else if (t_day == 2)
				cour[t_time][1] = cour[t_time][3] = new Course(c_name, t_where);
			else
				cour[t_time][4] = cour[t_time+1][4] = new Course(c_name,t_where);
			%>
			
			<%
			
		}
	%>
<div class='tab'>
  <table border='0' cellpadding='0' cellspacing='0'>
    <tr class='days'>
      <th></th>
      <th>Monday</th>
      <th>Tuesday</th>
      <th>Wednesday</th>
      <th>Thursday</th>
      <th>Friday</th>
    </tr>
    <% for (int i = 0;i<7;i++) {%>
    <tr>
      <td class='time'><%=i+1 %></td>
      <%for (int j = 0;j<5;j++) {
      if (cour[i][j]!=null){%>
      <td class='cs335 blue' data-tooltip='Software Engineering &amp; Software Process'><%=cour[i][j].c_name %> <%=cour[i][j].t_where %></td>
      <% }
      else {%>
      <td></td>
      <%}} %>
    </tr>
    <%} %>
  </table>
</div>
<% } %>
</body>
</html>