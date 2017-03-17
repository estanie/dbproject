<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<head>
<title>게시판</title>
</head>
	<%@ include file="top.jsp"%>
	<%@ include file="dbconfig.jsp"%>
	<script language="javascript">
		// 자바 스크립트 시작

		function modifyCheck() {
			var form = document.modifyform;

			if (!form.password.value) {
				alert("비밀번호를 적어주세요");
				form.password.focus();
				return;
			}

			if (!form.title.value) {
				alert("제목을 적어주세요");
				form.title.focus();
				return;
			}

			if (!form.memo.value) {
				alert("내용을 적어주세요");
				form.memo.focus();
				return;
			}
			form.submit();
		}
	</script>
	<%
		Statement stmt = null;

		String name = "";
		String password = "";
		String title = "";
		String memo = "";
		int idx = Integer.parseInt(request.getParameter("idx"));

		stmt = myConn.createStatement();

		String sql = "SELECT b_name, b_pwd, b_title, b_content FROM board WHERE b_no=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {

			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}

		rs.close();
		stmt.close();
		myConn.close();
	%>
	<div id="containerwrap">
		<div id="container">
			<!-- .section_title -->
			<div class="section_title">
				<h1>
					<span>글 수정하기</span>
				</h1>
			</div>
			<!-- /.section_title -->
			<!-- #content -->
			<div id="content" class="myPoint">


				<!-- .pointBox -->
				<center>
					<div class="pointBox">
						<form name=modifyform method=post
							action="modify_ok.jsp?idx=<%=idx%>">
							<table>
								<tr>
									<td>&nbsp;</td>
									<td align="center">제목</td>
									<td><input type=text name=title size=50 maxlength=50
										value="<%=title%>"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="1" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center">이름</td>
									<td><%=name%><input type=hidden name=name size=50
										maxlength=50 value="<%=name%>"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="1" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center">비밀번호</td>
									<td><input type=password name="password" id="pass" size=50
										maxlength=50></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="1" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center">내용</td>
									<td><textarea name=memo cols=50 rows=13><%=memo%></textarea></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="1" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr height="1" bgcolor="#82B5DF">
									<td colspan="4"></td>
								</tr>
								<tr align="center">
									<td>&nbsp;</td>
									<td colspan="2"><input type="button" value="수정"
										OnClick="javascript:modifyCheck();"> <input
										type=button value="취소" OnClick="javascript:history.back(-1)">
									<td>&nbsp;</td>
								</tr>
							</table>
						</form>
					</div>
					<br />
					<br />
					<br />
				</center>
			</div>
		</div>
		<%@ include file="link.jsp"%>
	</div>
	<%@ include file="footer.jsp"%>