
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1><span>회원 정보 수정</span></h1>
				</div>
				<div id="content" class="login">
					<div class="login_box">
						<form method="post" action="update.jsp">
							<fieldset class="formLogin"><div width ="40%">
								<h2>회원 정보 수정을 위해 정보를 입력해주세요.</h2>
		<table class="inputTable">

			
			<%
				if (session_id == null){
					%>	<script>
			alert("로그인이 필요합니다.");
			location.href = "login.jsp";
		</script>
	<%
				}

				Statement stmt = null;
				ResultSet rs = null;
				ResultSet prs = null;
				String mySQL = "select s_pwd from students where s_id=" + session_id + "";

				stmt = myConn.createStatement();
				rs = stmt.executeQuery(mySQL);

				if (rs != null) {
					if (rs.next()) {
			%>

			<tbody>
				<tr>
				<% String id = session_id;%>
				<td class="input"><%=id%>
				<input type="hidden" id="userid" name="userid" title="아이디" value="<%=id%>" class="formText formText_ID" /></td>								
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="password" id="userpw" name="userpw" title="비밀번호" class="formText formText_Pass" onkeypress="if(event.keyCode=='13'){userLogin();}" /></td>
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="text" id="username" name="username" title="이름" class="formText formText_Email" /></td>
				</tr>
				<tr>
				<td class="input"><input type="text" id="useraddr" name="useraddr" title="주소" class="formText formText_Name" /></td>
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="text" id="useremail" name="useremail" title="이메일" class="formText formText_Email" /></td>
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
 		<td colspan="4" align="center">		
		<input type="submit" value="수정 완료">
		</td>
		</tr>
		</tbody>
		</table></div>
		</fieldset>
		</br></br></br></br></br></br></br></br>
<% }
 else {
	String mySQL2 = "select p_id from professor where p_id=" + session_id + "";
	 prs = stmt.executeQuery(mySQL2);
	if (prs.next()) {
	 %>
				<tbody>
				<tr>
				<% String id = session_id;%>
				<td class="input"><%=id%>
				<input type="hidden" id="userid" name="userid" title="아이디" value="<%=id%>" class="formText formText_ID" /></td>								
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="password" id="userpw" name="userpw" title="비밀번호" class="formText formText_Pass" onkeypress="if(event.keyCode=='13'){userLogin();}" /></td>
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="text" id="username" name="username" title="이름" class="formText formText_Email" /></td>
				</tr>
				<tr>
				<td colspan="3" class="blank02"></td>
				</tr>
				<tr>
				<td class="input"><input type="text" id="useremail" name="useremail" title="이메일" class="formText formText_Email" /></td>
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
 		<td colspan="4" align="center">		
		<input type="submit" value="수정 완료">
		</td>
		</tr>
		</tbody>
		</table></div>
		</fieldset>
		</br></br></br></br></br></br></br></br>
				<%
				}
		}
					stmt.close();
					myConn.close();
		}%>
		</table>
		</form>
</div>
</div>
</div>
</div>
