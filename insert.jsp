<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<head>
  <title>수강신청</title>
  <style>
    a:hover {
      color: #f62217;
    }

    tr:hover {
      background-color: lightgrey;
    }
  </style>
</head>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<%
  if (session_id == null) {
%>
<script>
  alert("로그인이 필요합니다.");
  location.href = "login.jsp";
</script>
<%
} else {
%>
<%
  CallableStatement cstmt = null;
  CallableStatement cstmt2 = null;
  cstmt = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
  cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
  cstmt.execute();
  int semester = cstmt.getInt(1);
  cstmt2 = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
  cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
  cstmt2.execute();
  int year = cstmt2.getInt(1);
  Statement stmt = null;
  ResultSet myResultSet = null;
  String mySQL = "";
  stmt = myConn.createStatement();
  mySQL = "select c.c_id,c.c_id_no,c.c_name,c.c_unit,t.t_where, t.t_time, t.t_day from course c, teach t where t.c_id = c.c_id and t.c_id_no = c.c_id_no and c.c_id not in (select c_id from enroll where s_id='"
    + session_id + "') and t_year =" + year + " and t_semester = " + semester;
%>
<div id="containerwrap">
  <div id="container">
    <div class="section_title">
      <h1>
        <span><%=year%> 년도 <%=semester%> 학기 수강신청</span>
      </h1>
    </div>


    <table width="75%" align="center" border>
      <br/>
      <tr style="background-color:lightgrey">
        <th>과목번호</th>
        <th>분반</th>
        <th>과목명</th>
        <th>학점</th>
        <th>요일</th>
        <th>시간</th>
        <th>장소</th>
        <th>수강신청</th>
      </tr>

      <%
        myResultSet = stmt.executeQuery(mySQL);
        if (myResultSet != null) {
          while (myResultSet.next()) {
            String c_id = myResultSet.getString("c_id");
            String c_id_no = myResultSet.getString("c_id_no");
            String c_name = myResultSet.getString("c_name");
            int c_unit = myResultSet.getInt("c_unit");
            int t_time = myResultSet.getInt("t_time");
            String t_where = myResultSet.getString("t_where");
            int t_day = myResultSet.getInt("t_day");
      %>
      <tr>

        <td align="center"><%=c_id%>
        </td>
        <td align="center"><%=c_id_no%>
        </td>
        <td align="center"><%=c_name%>
        </td>
        <td align="center"><%=c_unit%>
        </td>
        <td align="center"><%=t_day%>
        </td>
        <td align="center"><%=t_time%>
        </td>
        <td align="center"><%=t_where%>
        </td>
        <td align="center"><a href="insert_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">신청</a></td>
      </tr>
      <%
            }
          }
          cstmt.close();
          cstmt2.close();
          stmt.close();
          myConn.close();
        }
      %>
    </table>
  </div>
</div>