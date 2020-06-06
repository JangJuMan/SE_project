<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
		margin-bottom: 0.5em;
		text-align: center;
	}
	th {
		background-color: lightgray;
	}
	table, th, td {
		border: 1px solid #bcbcbc;
	}
	textarea {
  		resize: none;
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
        .notice-area{
          border: 1px solid #bbb;
          border-radius: 10px;
          margin-bottom: 1em;
          padding: 1em;
          text-align: center;
        }
        .notice-title{
          border-bottom: 1px solid #bbb;
          padding: 0.5em;
          margin-bottom: 0.5em;
          text-align: center;
        }
			.button-container {
			  float: right;
			}
				button {
				  background-color: #4CAF50;
				  border: none;
				  color: white;
				  padding: 8px 16px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-size: 16px;
				  margin: 4px 2px;
				  transition-duration: 0.4s;
				  cursor: pointer;
				  border-radius: 2px;
				}
				
				button:hover {
				  background-color: white;
				  color: black;
				  border: 1px solid #4CAF50;
				}
				.room_menu{
					cursor: pointer;
				}
				.txt-input{
					padding: 0.3em;
					margin-bottom: 1em;
					width: 50%;
				}
	</style>
</head>
<div class="container">
	<div class="left-container">
		<h2 class="room_menu" onclick="location.href='main'">룸 메뉴</h2>
		<div class="menu-container">
			<div>
				<h3 class="room_menu" onClick="location.href='calendar'">일정</h3>
			</div>
			<div>
				<h3 class="room_menu" onClick="location.href='notice'">게시판</h3>
				<h4 class="specific-menu room_menu" onClick="location.href='notice'">게시글</h4>
			</div>
			<div>
				<h3 class="room_menu" onClick="location.href='invite'">관리</h3>
			</div>
			<div>
				<h3 class="room_menu" onClick="location.href='setting'">설정</h3>
			</div>
		</div>
	</div>
	
	<div class="right-container">
		<h1><strong> 게시판 </strong></h1>
		<div class="notice-area">
			<h2 class="notice-title"><strong> 게시글 작성 </strong></h2>
			<form action="noticeAddAction" method="get">
			<label for="title">제목:</label>
			<input class="txt-input" type="text" id="title" name="title" required>
			<br>
			<textarea id="content" name="content" rows="20" cols="100" placeholder="게시글 내용을 작성해주세요." required></textarea>
			<input type="hidden" id="date" name="date" pattern="\d{4}-\d{2}-\d{2}" required>
			<br><button type="submit">추가</button>
			</form>
		</div>
	</div>
</div>
<script>
	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});
	document.getElementById('date').value = new Date().toDateInputValue();
</script>