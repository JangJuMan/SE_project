<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="total.css"/>
	<style type="text/css">
	.html, div, body, h1, h2{
	  margin: 0;
	  padding: 0;
	}
	.a:hover{
	  cursor: pointer;
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
      text-align: center;
    }
        .team-info{
          border: 1px solid #bbb;
          padding: 1em;
          border-radius: 5px;
          margin: 1em 0.5em;
          background-color: #e1ffed;
          text-align: left;
        }
        .team-name{
          margin-top: 0;
          margin-bottom: 0;
        }
        .team-task{
          text-align: center;
          margin-bottom: 0;
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
        .index-area{
          border: 1px solid #bbb;
          padding: 1em;
          margin-top: 1em;
          border-radius: 10px;
        }
            .index-title{
              text-align: center;
              border-bottom: 1px solid #bbb;
              padding-bottom: 0.5em;
              margin-bottom: 0.5em;
            }
            .index-team{
              border: 1px solid #aaa;
              border-radius: 10px;
              padding: 0.5%;
              margin: 0.5%;
              width: 22%;
              text-align: center;
              display: inline-block;
              background-color: #9dfff6;
            }
			.index-team{
			  cursor: pointer;
			}
            .index-add-team{
              display: inline-block;
              border: 1px solid #aaa;
              border-radius: 10px;
              margin: 0.5%;
              width: 22%;
              text-align: center;
              background-color: #ebf6ff;
              font-size: 20px;
			  font-weight: bold;
			  padding: 1em 2em;
            }
			.index-add-team:hover{
			  background-color: #add5f7;
			  cursor: pointer;
			}
			
			.calendar-div{
				padding: 1em;
			}
			.create-team{
			  border: 1px solid #bbb;
	          padding: 1em;
	          border-radius: 5px;
	          margin: 1em 0.5em;
	          background-color: #e1ffed;
	          font-weight: bold;
	          font-size: 20px;
	          width: 90%;
			}
			.create-team:hover{
				background-color: #69ef9e;
				cursor: pointer;
			}
	</style>
</head>
<body>
	<form action="makeRoom" method="get" onsubmit="return enterTitle()">
		<input name="title" type="hidden" value="" id="team_name">
		<div class="container">
			<div class="left-container">
				<h2>팀 목록</h2>
				<c:forEach var="i" begin="1" end="${room_count}">
					<div class="team-info">
						<h3 class="team-name">${RoomList[i-1].room_title} (id: ${RoomList[i-1].room_id})</h3>
						<hr>
						<p class="team-task">나에게 부여된 일 1</p>
						<p class="team-task">나에게 부여된 일 2</p>
					</div>
				</c:forEach>
				<input class="create-team" type="submit" value="+ Create a Team">
			</div>
			<div class="right-container">
				<div class="calendar-area">
					<h2 class="calendar-title">${user_name} 님의 일정입니다.</h2>
					<div class="calendar-div">
						<jsp:include page="/WEB-INF/views/main/home_calendar.jsp"></jsp:include>
					</div>
				</div>
				<div class="index-area">
					<h2 class="index-title">${user_name} 님이 참여하고 있는 팀 목록입니다.</h2>
					<c:forEach var="i" begin="1" end="${room_count}">
						<div class="index-team" onClick="location.href='http://localhost:8080/spring/room/${RoomList[i-1].room_id}/main'">
						<h3>${RoomList[i-1].room_title} (id: ${RoomList[i-1].room_id})</h3>
					</div>
					</c:forEach>
					<input class="index-add-team" type="submit" value="+ Create a Team"> 
				</div>
			</div>
		</div>
	</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function enterTitle(){
	var input = prompt("방 제목을 입력해주세요", "New Room Title");
	if(input != null){
		document.getElementById("team_name").value = input;
		return true;
	}
	return false;
}
</script>
</html>