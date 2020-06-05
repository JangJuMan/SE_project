<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="total.css"/>
	<style type="text/css">
	.html, div, body{
	  margin: 0;
	  padding: 0;
	}
	.setting-container{
	  border : 1px solid #bbb;
	  border-radius: 10px;
	  margin: 3%;
	  min-height: 70%;
	  text-align: center;
	  padding: 1em;
	}
	.setting-title{
	    border-bottom: 1px solid #bbb;
	    margin-bottom: 1em;
	    padding: 1em;
	}
	.setting-div{
	    border: 1px solid #777;
	    border-radius: 5px;
	    width: 50%;
	    display: inline-block;
	    margin: 1%;
	    padding: 1%;
	}
	.submit-div{
	/*     border: 1px solid #777; */
	    border-radius: 5px;
	    width: 50%;
	    display: inline-block;
	    margin: 1%;
	    padding: 1%;
	}
	.submit-btn{
	    display: inline-block;
	    font-size: 15px;
	    padding: 1em;
	    border-radius: 5px;
	    border: none;
	    font-size: 15px;
	    margin-bottom: 1em;
	}
	.submit-btn:hover{
	    background-color: #3290ff;
	    color: white;
	    cursor : pointer;
	}
	.cancel-btn{
	    display: inline-block;
	    font-size: 15px;
	    padding: 1em;
	    border-radius: 5px;
	    border: none;
	    font-size: 15px;
	}
	.cancel-btn:hover{
	    background-color: #ff5959;
	    color: white;
	    cursor : pointer;
	}
	</style>
</head>
<body>
	<form action="settingAction" method="post">
		<div class="setting-container">
			<h1 class="setting-title">설정 페이지</h1>
			<div class="setting-div">
				<label for="font-size">폰트 사이즈</label>
				<select name="font" id="font-select">
					<option value="14">14px</option>
					<option value="16">16px</option>
					<option value="18">18px</option>
					<option value="20">20px</option>
				</select>
			</div>
			<!-- <div class="setting-div">
				<label for="notification">알림설정</label>
				<input type="checkbox" name="notification">
			</div> -->
			<div class="submit-div">
				<input type="submit" class="submit-btn" value="설정 변경하기">
				<input type="button" class="cancel-btn" value="돌아가기" onClick="location.href='home'">
			</div>
		</div>
	</form>
</body>
</html>