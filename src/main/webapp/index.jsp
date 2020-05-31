<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SE Team Project Management System</title>
	<link rel="stylesheet" type="text/css" href="total.css"/>
	<style type="text/css">
	.container{
		text-align: center;
	}
	.title-container{
	    padding-top: 10em;
	    padding-bottom: 10em;
	    background-color: #3bb97a;
	    color: white;
	}
        .title{
          font-size: 50px;
        }
    .btn-container{
        padding: 5em 1em;
    }
        .go-login-btn{
            padding: 1em 2em;
            border-radius: 5px;
            border: none;
            background-color: #8bbef1;
            font-size: 18px;
        }
			.go-login-btn:hover{
				background-color: #1282e4;
				cursor : pointer;
				color: white;
			}
	</style>
</head>
<body>
	<div class="container">
		<div class="title-container">
			<h1 class="title">SE Project Team </h1>
		</div>
		<div class="btn-container">
			<input class="go-login-btn" type="button" value="로그인 하기" onClick="location.href='login'">
		</div>
	</div>
</body>
</html>