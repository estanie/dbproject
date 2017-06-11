<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//	String session_name = (String) session.getAttribute("user");
	Integer session_id = (Integer) session.getAttribute("id");
	String session_identity = (String) session.getAttribute("identity");
	String log;
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" type="image/x-icon" href="bbicon.png" />
<title>수강신청 로그인</title>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no" />
<meta name="format-detection"
	content="telephone=no, address=no, email=no" />
<meta name="format-detection" content="no" />
<script type="text/javascript" src="jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="common.js"></script>
<script type="text/javascript" src="comm_api.js"></script>
<script type="text/javascript" src="detect-mobile.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="layout.css"
	media="screen and (max-width:1080px)">
</head>

<body class="member">
	<div id="wrapper">
		<div id="headwrap">
			<header id="header">
				<h1>
					<a href="main.jsp" title="홈 바로가기"><img src="bblogo.png"
						alt="로고" /></a>
				</h1>
				<div class="util">
					<ul class="menu">
						<li><a href="login.jsp">로그인</a></li>
					</ul>
				</div>
				<div class="header_top"></div>
				<nav id="gnb">
					<ul class="depth1menu">
						<li class="gnb01 "><a href="mypage.jsp">MYPAGE</a></li>
						<li class="gnb02 "><a href="insert.jsp">ENROLLMENT</a></li>
						<li class="gnb03 "><a href="select.jsp">LIST</a></li>
						<li class="gnb04 "><a href="timetable.jsp">TIMETABLE</a></li>
						<li class="gnb05 "><a href="list.jsp">ASSESSMENT</a></li>
						<li class="gnb06 "><a href="map.jsp">DIRECTIONS</a></li>
					</ul>
				</nav>
			</header>
		</div>
