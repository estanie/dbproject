<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스케줄 삭제 처리</title>
<%String delnum = request.getParameter("day");%>
<script language="JavaScript">
function myconfirm(){ 
	if (confirm("정말 삭제 하시겠습니까?")){ 
		location.href="delete_ok.jsp?day=<%=delnum%>";
	}
	else{ 
	  	location.href="select.jsp"; 
	} 
} 
</script>
</head>

<body>

<script language="JavaScript">
myconfirm();
</script>
</body>
</html>
