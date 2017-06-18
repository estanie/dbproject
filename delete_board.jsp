<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>게시판 검색</title>
</head>
<div id="containerwrap">
  <div id="container">
    <div class="section_title">
      <h1>
        <span>게시글 삭제</span>
      </h1>
    </div>
    <%@ include file="top.jsp" %>
    <%@ include file="dbconfig.jsp" %>
    <%
      int idx = Integer.parseInt(request.getParameter("idx"));
    %>
    <!-- #container -->
    <div id="container">
      <!-- .section_title -->
      <div class="section_title">
        <h1>
          <span>글 삭제하기</span>
        </h1>
      </div>
      <!-- /.section_title -->
      <!-- #content -->
      <div id="content" class="myPoint">


        <!-- .pointBox -->
        <center>
          <div class="pointBox">
            <table>
              <form name=deleteform method=post
                    action="delete_board_ok.jsp?idx=<%=idx%>">
                <tr>
                  <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                      <tr
                        style="background: url('image/table_mid.gif') repeat-x; text-align: center;">
                        <td width="5"><img src="image/table_left.gif" width="5"
                                           height="30"/></td>
                        <td>삭제</td>
                        <td width="5"><img src="image/table_right.gif"
                                           width="5" height="30"/></td>
                      </tr>
                    </table>
                    <table>
                      <tr>
                        <td>&nbsp;</td>
                        <td align="center">비밀번호</td>
                        <td><input name="password" type="password" size="50"
                                   maxlength="100"></td>
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
                        <td colspan="2"><input type=button value="삭제"
                                               OnClick="javascript:deleteCheck();"> <input
                          type=button value="취소"
                          OnClick="javascript:history.back(-1)">
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </form>
            </table>
          </div>
        </center>
      </div>
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>
<script>
  function deleteCheck() {
    var form = document.deleteform;

    if (!form.password.value) {
      alert("비밀번호를 적어주세요");
      form.password.focus();
      return;
    }
    form.submit();
  }
</script>