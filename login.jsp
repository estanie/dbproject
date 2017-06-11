<%@ page contentType="text/html; charset=UTF-8"%>
<HTML>
<head><title>수강신청 시스템 로그인</title></head>
<BODY>
<table width="75%"align="center" bgcolor="#FFFF99"border>
	<tr><td align="center">아이디와 패스워드를 입력하세요</table>
<table width="75%" align="center"border>
<FORM method="post" action="login_verify.jsp"> 
	<tr><td align="center">아이디</td>
		<td align="center"><input type="text"name="userID"></td>
	</tr>
	<tr>
		<td align="center">패스워드</td>
		<td align="center"><input type="password"name="userPassword"></td>
	</tr>
	<tr>
		<td colspan=2 align="center">
			<INPUT TYPE="SUBMIT" NAME="Submit"VALUE="로그인">
			<INPUT TYPE="RESET"VALUE="취소"></td>
	</tr>
</table>
</FORM>
</BODY>
</HTML>