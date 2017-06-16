<%@ page contentType="text/html; charset=UTF-8" %>
<head>
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>

<%@ include file="top.jsp" %> 
<table width="75%" align="center" height="100%">
 <% if (session_id!= null) { %> 
 <tr> <td align="center"><%=session_id%>님방문을환영합니다.</td> </tr>
  <% } 
 else { %> <tr> <td align="center">로그인한후사용하세요.</td> </tr> <% } %> 
 </table> 
<%@ include file="link.jsp"%>
<%@ include file="footer.jsp"%>