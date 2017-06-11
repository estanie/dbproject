<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>
<%
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }

   int listSize = 3;
   int currentPage = Integer.parseInt(pageNum);
   int nextPage = currentPage + 1;
   int startRow = (currentPage - 1) * listSize + 1;
   int endRow = currentPage * listSize;
   int lastRow = 0;
   int i = 0;
   int num[] = {0};
   int row = startRow;
%>
<%
      if (session_id == null) {%>
         <script language=javascript>
         self.window.alert("접근할 수 없습니다. 로그인 후 이용해주세요.");
           location.href="login.jsp"; 
         </script>
      <%}
      else {%>

   <div>
      <div>
      <header>
         <div>
            <ul>
               <form>
                  <table>
                     <h2>스케줄 관리 화면</h2>
                  </table>
               </form>
            </ul>
         </div>
      </header>
      
      <div>
         <div>
            <ul>
               <li>
                  <h2><a href=insert.jsp>+ 추가</a></h2><br/>
                  <TABLE>
                     <TR>
                        <TD> 년 </TD>
                        <TD> 월 </TD>
                        <td>삭제</td>
                     </TR>
                           <%      
                     Statement stmt  = null;                  
                     stmt = myConn.createStatement();
                  
                        String strSQL = "SELECT count(*) FROM schedule";
                        ResultSet rs = stmt.executeQuery(strSQL);
                        //out.println(rs);
                        
                        
                        if (rs.next())
                           lastRow = rs.getInt(1);
               
                        rs.close();
                        
                        if (lastRow > 0) {
                           strSQL = "SELECT * FROM schedule";
                            rs = stmt.executeQuery(strSQL);            
                           while(rs.next()) {

                              //if (i >= startRow && i <=endRow) {
                              %>
                                 <TR>
                                    <TD><%=rs.getString("year") %></TD>
                                    <TD><%=rs.getString("month") %></TD>
                                    
                                    <TD><a href='delete.jsp?day=<%=rs.getString("day")%>'>삭제</a></TD>
                                 </TR>
                                 <%row++;
                           //   }
                           }
                           //rs.close();
                           //stmt.close();
                        }
                        else {
                           %>
                           <TR>
                              <TD colspan="4"> 레코드 없음 </TD>
                           </TR>
                           <%
                        } 
                        //rs.close();
                        //stmt.close();

                     }
                     catch (SQLException ex) { 
                        %>
                        <TR>
                           <TD colspan="4"> 에러: <%=ex %> </TD>
                        </TR>
                        <%
                     }%>
                  </TABLE><br/><%
                  if (lastRow > 0) {
                     int setPage = 1;
                     
                     int lastPage = 0;
                     if (lastRow % listSize == 0)
                        lastPage = lastRow / listSize;
                     else
                        lastPage = lastRow / listSize + 1;
                        
                     while (setPage <= lastPage) {
                        if (setPage == currentPage) {
                           %>
                                 [<%=setPage%>]
                           <%
                        }
                        else {
                           %>
                           <a href="select.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>
                           <%
                        }
                        setPage = setPage + 1;
                     }
                  
                     if (1 < currentPage) {
                        %>
                        <a href="select.jsp?pageNum=<%=currentPage-1%>">◀</a>
                        <%
                     }
                     if (lastPage > currentPage) {
                        %>
                        <a href="select.jsp?pageNum=<%=currentPage+1%>">▶</a>
                        <%
                     }
                  }
               }%>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
</BODY>
</HTML>