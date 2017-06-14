<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<link rel="stylesheet" href="table.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- / College Timetable -->
<div class='tab'>
  <table border='0' cellpadding='0' cellspacing='0'>
    <tr class='days'>
      <th></th>
      <th>Monday</th>
      <th>Tuesday</th>
      <th>Wednesday</th>
      <th>Thursday</th>
      <th>Friday</th>
    </tr>
    <tr>
      <td class='time'>1</td>
      <td class='cs335 blue' data-tooltip='Software Engineering &amp; Software Process'>CS335 [JH1]</td>
      <td class='cs426 purple' data-tooltip='Computer Graphics'>CS426 [CS1]</td>
      <td></td>
      <td></td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>2</td>
      <td></td>
      <td class='cs335 blue lab' data-tooltip='Software Engineering &amp; Software Process'>CS335 [Lab]</td>
      <td class='md352 green' data-tooltip='Multimedia Production &amp; Management'>MD352 [Kairos]</td>
      <td></td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>3</td>
      <td></td>
      <td class='cs335 blue lab' data-tooltip='Software Engineering &amp; Software Process'>CS335 [Lab]</td>
      <td class='md352 green' data-tooltip='Multimedia Production &amp; Management'>MD352 [Kairos]</td>
      <td class='cs240 orange' data-tooltip='Operating Systems'>CS240 [CH]</td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>4</td>
      <td></td>
      <td class='md303 navy' data-tooltip='Media &amp; Globalisation'>MD303 [CS2]</td>
      <td class='md313 red' data-tooltip='Special Topic: Multiculturalism &amp; Nationalism'>MD313 [Iontas]</td>
      <td></td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>5</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>6</td>
      <td></td>
      <td></td>
      <td class='cs426 purple' data-tooltip='Computer Graphics'>CS426 [CS2]</td>
      <td class='cs240 orange' data-tooltip='Operating Systems'>CS240 [TH1]</td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>7</td>
      <td></td>
      <td></td>
      <td></td>
      <td class='cs240 orange lab' data-tooltip='Operating Systems'>CS240 [Lab]</td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>8</td>
      <td></td>
      <td></td>
      <td></td>
      <td class='cs240 orange lab' data-tooltip='Operating Systems'>CS240 [Lab]</td>
      <td>-</td>
    </tr>
    <tr>
      <td class='time'>9</td>
      <td class='cs335 blue' data-tooltip='Software Engineering &amp; Software Process'>CS335 [TH1]</td>
      <td></td>
      <td></td>
      <td></td>
      <td>-</td>
    </tr>
  </table>
</div>
</body>
</html>