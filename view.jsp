
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<html>
<head>
	<title>게시판</title>
</head>
<body>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<%
/*
	if (session_id == null){*/
		%>
		<script>
		//	alert("로그인이 필요합니다.");
		//	location.href = "login.jsp";
		</script>
		<%/*
	}
	else{*/
		Statement stmt  = null;
		stmt = myConn.createStatement();
		int idx = Integer.parseInt(request.getParameter("idx"));
		String sql = "SELECT USERNAME, TITLE, MEMO, HIT FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		 if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				int hit = rs.getInt(4);
				hit++;
		
%>

		<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1><span>글 내용보기</span></h1>
				</div>
				<div id="content" class="myPoint">
				<center>
					<div class="pointBox">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=hit%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=name%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=memo %>
                </tr>
                <% 
 	sql = "UPDATE board SET HIT=" + hit + " where NUM=" +idx;
 	stmt.executeUpdate(sql);

 //	myConn.close();
	 	}
%>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
     <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='write.jsp'">
	<input type=button value="목록" OnClick="window.location='list.jsp'">
	<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>'">
	<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table><div><br/><br/></div>
   </td>
  </tr>
  
  <%
		int total = 0;
		
		String sqlList = "SELECT ID, CONTENT from comenttable where REF="+idx;
		rs = stmt.executeQuery(sqlList);
		
%>
  <table align="center" width="413" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td align="center" width="73">이름</td>
   <td align="center" width="379">내용</td>
   </tr>
  <%	 		
  	if (rs!=null){
		while(rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
		
%>
  <tr>
<td align="center"><%=name %></td>
	<td align="center"><%=title %></td>
  </tr> 
  <% 
		}
  	}
	rs.close();
	stmt.close();
	//myConn.close();
//}
%>
  </table><br/><br/>
<form name="ff" id="ff" method="post" action="commentwrite_ok.jsp">
<table align="center" width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td align="center">
   <input type="hidden" name="boardNo" value="<%=idx%>">
    <input name="writer" type="text"size="20" maxlength="10" >
    <input name="content" type="text"size="40" maxlength="300" >
    <a href="javascript:comAdd();">
     <img src="bbicon.png" border="0">
    </a>
   </td>
  </tr> 
</table>
</form>
<script type="text/javascript">
 function comAdd(){
  document.getElementById("ff").submit();
 }
</script>
<script type="text/javascript">
 function comAdd(){
  document.getElementById("ff").submit();
 }
</script>
</table>
</div>
</center>
</div>
</div>
<%@ include file="footer2.jsp" %>
</div>
<%@ include file="footer.jsp"%>