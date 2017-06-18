<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("utf-8"); // 한글 처리 구문
  String session_name = (String) session.getAttribute("user");
  Integer session_id = (Integer) session.getAttribute("id");
  String session_identity = (String) session.getAttribute("identity");
  String log;
%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="shortcut icon" type="image/x-icon" href="bbicon.png"/>
  <meta name="viewport"
        content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"/>
  <meta name="format-detection" content="telephone=no, address=no, email=no"/>
  <meta name="format-detection" content="no"/>
  <script type="text/javascript" src="jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="common.js"></script>
  <script type="text/javascript" src="comm_api.js"></script>
  <script type="text/javascript" src="detect-mobile.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/layout.css" media="screen and (max-width:1080px)">
  <style>
    #headwrap {
      background-color: navy;
    }
  </style>

</head>

<body class="member">
<div id="wrapper">
  <div id="headwrap">
    <header id="header">
      <h1>
        <a href="main.jsp" title="홈 바로가기"><img src="image/bblogo.png"
                                               alt="로고"/></a>
      </h1>
      <div class="util">
        <ul class="menu">
          <%
            if (session_id == null) {
          %>
          <li style="float: right"><a href="login.jsp" style="color: white;">로그인</a></li>
          <%
          } else {
          %>
          <li>
          <li style="float: right"><a href="logout.jsp" style="color: white;">로그아웃</a></li>
          <li style="float: right;"><a href="update_before.jsp" style="color:white;"><%=session_name%>
          </a></li>
          <%
            }
          %>
        </ul>
      </div>
      <div class="header_top"></div>
      <nav id="gnb">
        <ul class="depth1menu">
          <%
            if (session_identity == "professor") {
          %>
          <li class="gnb01 "><a href="update_before.jsp" style="color: white;">내정보 수정</a></li>
          <li class="gnb02 "><a href="create_course.jsp" style="color: white;">수업 생성</a></li>
          <li class="gnb03 "><a href="select_course.jsp" style="color: white;">내 수업 조회</a></li>
          <li class="gnb04 "><a href="timetable.jsp" style="color: white;">강의 시간표</a></li>
          <li class="gnb05 "><a href="list.jsp" style="color: white;">강의평 조회</a></li>
          <li class="gnb06 "><a href="map.jsp" style="color: white;">오시는길</a></li>

          <%
          } else {
          %>

          <li class="gnb01 "><a href="update_before.jsp" style="color: white;">내
            정보 수정</a></li>
          <li class="gnb02 "><a href="insert.jsp" style="color: white;">수강신청</a></li>
          <li class="gnb03 "><a href="select.jsp" style="color: white;">내
            수강 정보 조회</a></li>
          <li class="gnb04 "><a href="timetable.jsp"
                                style="color: white;">나의 시간표</a></li>
          <li class="gnb05 "><a href="list.jsp" style="color: white;">강의평
            조회</a></li>
          <li class="gnb06 "><a href="map.jsp" style="color: white;">지도</a></li>
          <%} %>
        </ul>
      </nav>
    </header>
  </div>
</div>