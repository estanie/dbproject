<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="containerwrap">
			<div id="container">
				<div class="section_title">
					<h1><span>시간표</span></h1>
				</div>
				<div id="content" class="myPoint">
				<center>
					<div class="pointBox">
<table>
  <tr>
   <td>
    <table class="inputTable" cellspacing="5">
	<tbody>
	<tr align="center">
 <td></td>
            <td width="200" bgcolor="#3f51b5">월</td>
            <td width="200" bgcolor="#3f51b5">화</td>
         
            <td width="200" bgcolor="#3f51b5">수</td>
            <td width="200" bgcolor="#3f51b5">목</td>
            <td width="200" bgcolor="#3f51b5">금</td>
	</tr>
        <tr align="center">
            <td bgcolor="#3f51b5">1</td>
            
            <%
          	//select t_time, t_day
            //where student s_id = enroll c_id, c_id_no = teach c_id, c_id_no
            
            int ttime = 1;
            int tday = 1;
            
            	if (ttime == 1) {
            
            	if (tday == 1) {
            %>
            
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            <td></td>
            <td></td>
            
            
            <%ttime = 1; tday = 3;} else if (tday == 2) { %>
            
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2" >요기</td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2" >요기</td>
            <td></td>
            
            <% } else if (tday == 3) {%>
            
            <td></td>
            <td></td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            
            <%} else { %>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <%}
            }%>
            
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">2</td>
            <%
            
            //ttime = 2; tday = 3;
            if (ttime == 2) {
            
            	if (tday == 1) {
            %>
            
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            <td></td>
            <td></td>
            
            <%} else if (tday == 2) { %>
            
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2" >요기</td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2" >요기</td>
            <td></td>
            
            <% } else if (tday == 3) {%>
            
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td bgcolor="#f48fb1" rowspan="2">요기</td>
            
            <%} else { %>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <%}
            }%>
            
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">3</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">4</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
 
        <tr align="center">
       	 <td bgcolor="#3f51b5">5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">6</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">7</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
 
        <tr align="center">
            <td bgcolor="#3f51b5">8</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</body>
</html>

</body>
</html>