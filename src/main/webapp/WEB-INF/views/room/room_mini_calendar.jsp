<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
	<title>캘린더</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javaScript" language="javascript">
	</script>
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-family:"돋움";color:red; text-decoration:none; }
		A:hover { font-family:"돋움";color:red;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
			font-weight: bold;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		.sat{
			color:#529dbc;
		}
		.sun{
			color:red;
		}
		.today_button_div{
			float: right;
			margin: 1% 0;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{
			border: 1px solid #aaa;
			padding: 1em;
		}
		.navigation{
			margin-bottom: 1em;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: 1em;
			border-collapse: collapse;
		}
		.calendar_body .today{
			border:1px solid white;
			height:120px;
			background-color:#c9c9c9;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sat_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align:left;
			vertical-align: top;
		}
		.calendar_body .sat_day .sat{
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sun_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .normal_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			vertical-align: top;
			text-align: left;
		}
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
		}
	</style>
</head>
<body>
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">
		<div class="calendar" >
			<!--날짜 네비게이션  -->
			<div class="navigation">
				<span class="this_month">
					&nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
			</div>
			<table class="calendar_body">
				<tbody>
					<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today">
									<div class="date">
										${dateList.date}
									</div>
									<div>
									</div>
								</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div class="date">
										${dateList.date}
									</div>
									<div>
									
									</div>
								</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
