<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp" %>
		<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1>
						<span>로그인</span>
					</h1>
				</div>

				<div id="content" class="login">
					<div class="login_box">
						<form method="post" action="login_verify.jsp" name="loginForm"
							id="loginForm">
							<fieldset class="formLogin">
								<br />
								<br />
								<br />
								<br />
								<div width="40%">
									<h2>홈페이지 이용을 위해 로그인을 해주세요.</h2>
									<br />
									<table class="inputTable">
										<tbody>
											<tr>
												<td class="input"><input type="text" id="userid"
													name="userid" title="아이디" placeholder="아이디"
													class="formText formText_ID" /></td>
												<td class="blank01"></td>
												<td rowspan="3" class="btn"><input type="submit"
													value="로그인" class="btnRed01"></a></td>
											</tr>
											<br />
											<tr>
												<td colspan="3" class="blank02"></td>
											</tr>
											<tr>
												<td class="input"><input type="password" id="userpw"
													name="userpw" title="비밀번호" placeholder="비밀번호"
													class="formText formText_Pass"
													onkeypress="if(event.keyCode=='13'){userLogin();}" /></td>
												<td class="blank01"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
							<div class="btn_find" width="40%">
								<center>
									<img src="calligraphy.png"
										style="max-width: 100%; height: auto;" />
								</center>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<br />
		<br />
		<br />
		<script type="text/javascript" src="common.js"></script>
		<div id="footerwrap">
			<footer id="footer">
				<p class="addr">
					<br /> 서울특별시 용산구 청파로 47길<span></span>
				</p>
				<p class="copyright">COPYRIGHT (c) SOOKMYUNG UNIV. ALL RIGHTS
					RESERVED.</p>
				<div class="btn_top">
					<a href="#top"><img src="btn_top.gif" alt="TOP" /></a>
				</div>
			</footer>
		</div>
</body>
</html>
