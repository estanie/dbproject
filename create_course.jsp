<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<head>
<title>코스 생성</title>
</head>
<%@ include file="top.jsp"%>
<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else {
	%>
<form method="post" action="createCourse_verify.jsp">
	<table width="75%" align="center" border>
		<tr>
			<td colspan="2"><div align="center">
					<h2>강의 추가</h2>
				</div></td>
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
				<div align="center">수업 요일 설정</div>
			</td>
			<td><div align="center"><select name="courseDate">
					<option value="1" selected="selected">월,수</option>
					<option value="2">화,목</option>
					<option value="3">금</option>
			</select>
			</div>
		</tr>
		<tr>
			<td>
				<div align="center">수업 시간 설정</div>
			</td>
			<td><div align="center">
					<select name="courseTime">
						<option value="">시간선택</option>
						<option value="1">1교시 9:00-10:30</option>
						<option value="2">2교시 10:30-12:00</option>
						<option value="3">3교시 12:00-13:30</option>
						<option value="4">4교시 13:30-15:00</option>
						<option value="5">5교시 15:00-16:30</option>
						<option value="6">6교시 16:30-18:00</option>
						<option value="7">7교시 18:00-19:30</option>
						<option value="8">8교시 19:30-21:00</option>
					</select>
				</div></td>
		<tr>
			<td>
				<div align="center">수업 장소 선택</div>
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




