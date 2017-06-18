<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<html>
<head>
  <title>게시판</title>
</head>
<body>

<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>

<%
  Statement stmt = null;
  String ww = request.getParameter("writer"); //write.jsp에서 name에 입력한 데이터값
  String cc = request.getParameter("content"); //write.jsp에서 memo에 입력한 데이터값

  int iiidx = Integer.parseInt(request.getParameter("boardNo"));
  int max = 0;
  stmt = myConn.createStatement();

  String sql = "INSERT INTO commenttable(comment_id, comment_content, comment_ref) VALUES(?,?,?)";
  PreparedStatement pstmt = myConn.prepareStatement(sql);

  pstmt.setString(1, ww);
  pstmt.setString(2, cc);
  pstmt.setInt(3, iiidx);
  pstmt.execute();
  pstmt.close();
  stmt.close();
  myConn.close();
%>

<script language=javascript>
  self.window.alert("입력한 댓글을 저장하였습니다.");
  location.href = "view.jsp?idx=<%=iiidx%>";
</script>
</body>
</html>