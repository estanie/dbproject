<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>코스 생성</title>
</head>
<body>
	<%@ include file="top.jsp"%>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else {
	%>
	<form method="post" action="createCourse_verify.jsp">
		<table width="75%" align="center" border>
			<tr>
				<td colspan="2"><div align="center">강의 추가</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">강의번호</div>
				</td>
				<td><div align="center">
						<input type="text" name="courseId">
					</div></td>
			</tr>
			
			<tr>
				<td>
					<div align="center">강의명</div>
				</td>
				<td><div align="center">
						<input type="text" name="courseName">
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">학점</div>
				</td>
				<td><div align="center">
						<input type="text" name="courseUnit">
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">최대 수강인원</div>
				</td>
				<td><div align="center">
						<input type="text" name="courseMax">
					</div></td>
			</tr>
			<tr>
							<td>
					<div align="center">수업 요일 설정 </div>
				</td>
				<td><div align="center">
						<input type="text" name="courseDate">
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">수업 시간 설정 </div>
				</td>
				<td><div align="center">
						<input type="text" name="courseTime">
					</div></td>
				
				<tr>
				<td>
					<div align="center">수업 장소 선택 </div>
				</td>
				<td><div align="center">
						<input type="text" name="courseWhere">
					</div></td>
					
			</tr>
			<tr>
				<td colspan=2><div align="center">
						<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="추가"> <INPUT
							TYPE="RESET" VALUE="취소">
					</div></td>
			</tr>
		</table>



	</form>
	<%} %>
</body>
</html>




