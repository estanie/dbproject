<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<div id="containerwrap">
  <div id="container">
    <div class="section_title">
      <h1>
        <span>회원 정보 수정</span>
      </h1>
    </div>
    <div id="content" class="login">
      <div class="login_box">
        <form method="post" action="update.jsp">
          <fieldset class="formLogin" align="center">
            <div width="40%">
              <h2>본인 확인을 위해 현재 비밀번호를 입력해주세요. </h2>
              <table class="inputTable">

                <%
                  if (session_id == null) {
                %>
                <script>
                  alert("로그인이 필요합니다.");
                  location.href = "login.jsp";
                </script>
                <%
                } else { %>
                <tbody>
                <tr>
                  <td class="input"><input type="password" id="userpw"
                                           name="userpw" title="비밀번호" class="formText formText_Pass"
                                           onkeypress="if(event.keyCode=='13'){userLogin();}"
                                           placeholder="비밀번호를 입력해주세요."/></td>
                </tr>
                <tr>
                  <td colspan="3" class="blank02"></td>
                </tr>
                <tr>
                  <td colspan="4" align="center"><input type="submit"
                                                        value="입력 완료"></td>
                </tr>
                </tbody>
              </table>
            </div>
          </fieldset>


          <% }
          %>
        </form>
      </div>
    </div>
  </div>

<%@ include file="footer.jsp" %>