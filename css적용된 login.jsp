<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="shortcut icon" type="image/x-icon" href="bbicon.png" />
	<title>수강신청 로그인</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no" />
	<meta name ="format-detection" content="telephone=no, address=no, email=no" />
	<meta name="format-detection" content="no" />   
	<script type="text/javascript" src="jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	<script type="text/javascript" src="comm_api.js"></script>
	<script type="text/javascript" src="detect-mobile.js"></script>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="layout.css" media="screen and (max-width:1080px)">  
</head>

<body class="member">
<div id="wrapper">
<div id="headwrap">
<header id="header">
<h1><a href="main.jsp" title="홈 바로가기"><img src="bblogo.png" alt="로고" /></a></h1>
<div class="util">
<ul class="menu">
<li><a href="login.jsp">로그인</a></li>
</ul>
</div>
<div class="header_top"></div>
<nav id="gnb">
<ul class="depth1menu">
<li class="gnb01 "><a href="mypage.jsp">정보</a></li>
<li class="gnb02 "><a href="insert.jsp">수강신청</a></li>
<li class="gnb03 "><a href="select.jsp">수강조회</a></li>
<li class="gnb04 "><a href="timetable.jsp">시간표</a></li>
<li class="gnb05 "><a href="list.jsp">강의평</a></li>
<li class="gnb06 "><a href="map.jsp">오시는길</a></li>
</ul>
</nav>
</header>
</div>
<div id="containerwrap">
<div id="container">
	<div class="section_title">
	<h1><span>로그인</span></h1>
	</div>

	<div id="content" class="login">
	<div class="login_box"> 
	<form method="post" action="loginProcess.jsp" name="loginForm" id="loginForm">
	<fieldset class="formLogin">
	<div width ="40%">
	<h2>홈페이지 이용을 위해 로그인을 해주세요.</h2>
	<table class="inputTable">
	<tbody>
	<tr>
	<td class="input"><input type="text" id="userid" name="userid" title="아이디" class="formText formText_ID" /></td>
	<td class="blank01"></td>
	<td rowspan="3" class="btn"><input type="submit" value="로그인" class="btnRed01"></a></td>
	</tr>
	<tr>
	<td colspan="3" class="blank02"></td>
	</tr>
	<tr>
	<td class="input"><input type="password" id="userpw" name="userpw" title="비밀번호" class="formText formText_Pass" onkeypress="if(event.keyCode=='13'){userLogin();}" /></td>
	<td class="blank01"></td>
	</tr>
	</tbody>
	</table>
	</div>
	</fieldset>
	</br></br></br></br></br>
	<div class="btn_find" width ="40%">
	<center><img src="bblogo.png"/></center>
	</div>
	</form>
	</div>
	</div>
</div>
</div>
<br/><br/><br/>
<script type="text/javascript" src="common.js"></script>
<div id="footerwrap">
<footer id="footer">
<p class="addr"><br/>
서울특별시 용산구 청파로 47길<span></span>
</p>
<p class="copyright">COPYRIGHT (c) SOOKMYUNG UNIV. ALL RIGHTS RESERVED.</p>
<div class="btn_top"><a href="#top"><img src="btn_top.gif" alt="TOP" /></a></div>
</footer>
</div>
</body>
</html>
