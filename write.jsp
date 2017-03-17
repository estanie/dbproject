
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ include file="top.jsp"%>
<%@ include file="dbconfig.jsp" %>
<% 
	String mySQL = "select p_id from professor where p_id="+session_id;
	Statement stmt = null;
	stmt = myConn.createStatement();
	int res = stmt.executeUpdate(mySQL);
	
	if(res!=0){ %>
		<script>
			alert("작성 권한이 없습니다.");
			window.history.back();
		</script>
		
	<%}
%>
<html>
<head>
	<title>게시판</title>
</head>

<body>

<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
		<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1><span>글 작성하기</span></h1>
				</div>
				<div id="content" class="myPoint">
				<center>
					<div class="pointBox">
					<table><form name=writeform method=post action="write_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('image/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="image/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="image/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100" placeholder="강의명/교수님 으로 적어주세요."></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr></form>
 </table>
 </div>
 </center>
 </div>
</div>
</div>
<%@ include file="footer.jsp"%>