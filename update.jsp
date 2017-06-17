
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp"%>
<div id="containerwrap">
	<div id="container">
		<div class="section_title">
			<h1>
				<span>회원 정보 수정</span>
			</h1>
		</div>
		<div id="content" class="login">
			<div class="login_box">
				<form method="post" action="update_verify.jsp">
					<fieldset class="formLogin">
						<div width="40%">
							<h2>회원 정보 수정을 위해 정보를 입력해주세요.</h2>
							<table class="inputTable">


								<%
									if (session_id == null) {
								%>
								<script>
									alert("로그인이 필요합니다.");
									location.href = "login.jsp";
								</script>
								<%
									} else {

									Statement stmt = null;
									ResultSet rs = null;
									String mySQL = null;
									String col_name = null;
									String col_addr = null;
									String col_email = null;
									String col_pwd = null;
									
									if (session_identity == "student"){
										mySQL = "select s_name,s_addr,s_email, s_pwd from students where s_id=" + session_id + "";
									}
									
									else if (session_identity == "professor") {
										mySQL = "select p_name,p_email, p_pwd from professor where p_id=" + session_id + "";
									}
									stmt = myConn.createStatement();
									rs = stmt.executeQuery(mySQL);
									if (rs != null) {
										if (rs.next()) {
											if (session_identity == "student")
											{
												col_name = "s_name";
												col_addr = "s_addr";
												col_email = "s_email";
												col_pwd = "s_pwd";
											}
											else
											{
												col_name = "p_name";
												col_email = "p_email";
												col_pwd = "p_pwd";
											}
										String name = rs.getString(col_name);
										String addr = rs.getString(col_addr);
										String email = rs.getString(col_email);
										String passwd = rs.getString(col_pwd);
								%>

								<tbody>
									<tr>
										<%
											int id = session_id;
										%>
										<td>아이디</td>
										<td class="input"><%=id%> <input type="hidden"
											id="userid" name="userid" title="아이디" value="<%=id%>"
											class="formText formText_ID" /></td>
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td class="input"><input type="password" id="userpw"
											name="userpw" title="비밀번호" class="formText formText_Pass"
											onkeypress="if(event.keyCode=='13'){userLogin();}" /></td>
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td class="input"><input type="text" id="username"
											name="username" title="이름" value="<%=name%>"
											class="formText formText_Name" /></td>											
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									
									<% if (session_identity == "student") {%>
									<tr>
										<td>주소</td>
										<td class="input"><input type="text" id="useraddr"
											name="useraddr" title="주소" value="<%=addr %>" class="formText formText_Email" /></td>
									</tr>
									<% } %>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td class="input"><input type="text" id="useremail"
											name="useremail" title="이메일" value="<%=email %>" class="formText formText_Email" /></td>
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td colspan="3" class="blank02"></td>
									</tr>
									<tr>
										<td colspan="4" align="center"><input type="submit"
											value="수정 완료"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</fieldset>
					</br> </br> </br> </br> </br> </br> </br> </br>

					<%
						}
													}
									stmt.close();myConn.close();	}
					%>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>