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
		<div class="notice-area">
			<h2 class="notice-title"><strong> 일정관리 </strong></h2>
			
			<table class="notice-table">
				<thead>
					<tr>
						<th>No.</th>
						<th>일정</th>
						<th>시작</th>
						<th>종료</th>
						<th>참여 맴버</th>
						<th>선택</th>
			        </tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>아키텍처 디자인</td>
						<td>2020.05.14</td>
						<td>2020.05.30</td>
						<td><select></select></td>
						<td><input type="checkbox"></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="pagination">
				<a id="prev" class="page-item">Previous</a>
				<a class="page-item active">1</a>
				<a id="next" class="page-item">Next</a>
			</div>
		</div>

	</div>
</div>