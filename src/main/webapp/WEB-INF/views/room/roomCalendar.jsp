<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8">
	<title>HTML</title>
	<style type="text/css">
	.html, div, body, h1, h2{
	  margin: 0;
	  padding: 0;
	}
	table {
		width: 90%;
		margin: auto;
		text-align: center;
	}
	th {
		background-color: lightgray;
	}
	table, th, td {
		border: 1px solid #bcbcbc;
	}
.container{
  float: left;
  width: 100%;
}
    .left-container{
      border: 1px solid #bbb;
      border-radius: 10px;
      margin: 1%;
      margin-right: 0.5%;
      padding: 1%;
      float: left;
      width: 20%;
    }
        .menu-container{
          border: 1px solid #bbb;
          padding: 1em;
          border-radius: 5px;
          margin: 1em 0.5em;
        }
	        .specific-menu{
	          text-align: center;
	        }
    .right-container{
      margin: 1%;
      margin-left: 0.5%;
      border: 1px solid #bbb;
      border-radius: 10px;
      padding : 1%;
      width: 72%;
      float: left;
      min-height: 70%;
    }
        .calendar-area{
          border: 1px solid #bbb;
          border-radius: 10px;
          margin-bottom: 1em;
          padding: 1em;
        }
        .calendar-title{
          border-bottom: 1px solid #bbb;
          padding: 0.5em;
          margin-bottom: 0.5em;
          text-align: center;
        }
	        .calendar-table td{
	          height: 80px;
	        }
	</style>
</head>

<P> 방번호는 ${roomNum} 입니다. </P>

<div class="container">
	
	<div class="left-container">
		<h2 onclick="location.href='main'">룸 메뉴</h2>
		<div class="menu-container">
			<div>
				<h3>일정</h3>
				<h4 class="specific-menu" onclick="location.href='calendar'">캘린더</h4>
				<h4 class="specific-menu" onclick="location.href='schedule'">일정 관리</h4>
			</div>
			<div>
				<h3 onClick="location.href='notice'">게시판</h3>
			</div>
			<div>
				<h3 onClick="location.href='invite'">관리</h3>
			</div>
			<div>
				<h3>설정</h3>
			</div>
		</div>
	</div>
	
	<div class="right-container">
		<h1><strong> 일정 </strong></h1>
		<div class="calendar-area">
			<h2 class="calendar-title"><strong> 2020.05 </strong></h2>
			
			<jsp:include page="/WEB-INF/views/room/room_calendar.jsp"></jsp:include>
		</div>
	</div>
</div>