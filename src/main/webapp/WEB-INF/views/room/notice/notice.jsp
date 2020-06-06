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
	        .notice-table td{
	          height: 20px;
	        }
			.pagination {
			  display: inline-block;
			  margin: auto;
			}
			
			.pagination a {
			  color: black;
			  float: left;
			  padding: 8px 16px;
			  text-decoration: none;
			}
			
			.pagination a.active {
			  background-color: #4CAF50;
			  color: white;
			  border-radius: 5px;
			}
			
			.pagination a:hover:not(.active) {
			  background-color: #ddd;
			  border-radius: 5px;
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
				<h4 class="specific-menu room_n" onClick="location.href='notice'">게시글</h4>
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
			<h2 class="notice-title"><strong> 게시글 목록 </strong></h2>
			
			<table class="notice-table">
				<thead>
					<tr>
						<th>No.</th>
						<th>작성자</th>
						<th>제목</th>
						<th>시간</th>
						<th>선택</th>
			        </tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="9">
					<tr>
						<td>${i+1}</td>
						<td>${board[i].uid}</td>
						<td class="room_menu" onclick="location.href='noticeSpecific?board_id=${board[i].board_id}'">${board[i].title}</td>
						<td>${board[i].date}</td>
						<td>
						<c:if test="${i < fn:length(board)}">
						<input id="${board[i].board_id}" type="checkbox">
						</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination">
				<a id="prev" class="page-item">Previous</a>
				<a class="page-item active">1</a>
				<a id="next" class="page-item">Next</a>
			</div>
			<div class="button-container">
				<button onclick="location.href='noticeAdd'">글 작성</button>
				<button>수정</button>
				<button onclick="noticeDelete();">삭제</button>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function noticeDelete(){
    $("input:checked").each(function(){
    	location.href='noticeDelete?board_id=' + this.id;
    });
}
</script>