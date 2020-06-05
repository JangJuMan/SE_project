<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="total.css"/>
	<style type="text/css">
	.html, div, body{
	  margin: 0;
	  padding: 0;
	}
	.private-container{
	  border : 1px solid #bbb;
	  border-radius: 10px;
	  margin: 3%;
	  min-height: 70%;
	  text-align: center;
	  padding: 1em;
	}
	.private-title{
	    border-bottom: 1px solid #bbb;
	    margin-bottom: 1em;
	    padding: 1em;
	}
	.private-div{
	    border: 1px solid #777;
	    border-radius: 5px;
	    width: 50%;
	    display: inline-block;
	    margin: 1%;
	    padding: 1%;
	}
	.private-text-input{
		font-size: 15px;
		text-align: center;
	}
	.private-submit-div{
	/*     border: 1px solid #777; */
	    border-radius: 5px;
	    width: 50%;
	    display: inline-block;
	    margin: 1%;
	    padding: 1%;
	}
	.private-submit-btn{
	    display: inline-block;
	    font-size: 15px;
	    padding: 1em;
	    border-radius: 5px;
	    border: none;
	    font-size: 15px;
	    margin-bottom: 1em;
	}
	.private-submit-btn:hover{
	    background-color: #3290ff;
	    color: white;
	    cursor : pointer;
	}
	.private-cancel-btn{
	    display: inline-block;
	    font-size: 15px;
	    padding: 1em;
	    border-radius: 5px;
	    border: none;
	    font-size: 15px;
	}
	.private-cancel-btn:hover{
	    background-color: #ff5959;
	    color: white;
	    cursor : pointer;
	}
	</style>
</head>
<body>
	<div class="private-container">
		<h1 class="private-title">개인정보 조회</h1>
		<div class="private-div">
			<label for="font-size">이름 : </label>
			<input class="private-text-input" type="text" value="${user_name}" readonly>
		</div>
		<div class="private-div">
			<label for="font-size">닉네임 : </label>
			<input class="private-text-input" type="text" value="${nickname}">
		</div>
		<div class="private-div">
			<label for="font-size">연령 : </label>
			<input class="private-text-input" type="text" value="${age}">
		</div>
		<div class="private-div">
			<label for="font-size">Email : </label>
			<input class="private-text-input" type="text" value="${email}" readonly>
		</div>
		<div class="private-div">
			<label for="font-size">성별 : </label>
			<input class="private-text-input" type="text" value="${gender}">
		</div>
		<div class="private-submit-div">
			<!-- <input type="submit" class="private-submit-btn" value="개인정보 변경하기"> -->
			<input type="button" class="private-cancel-btn" value="돌아가기" onClick="location.href='home'">
		</div>
	</div>
</body>
</html>