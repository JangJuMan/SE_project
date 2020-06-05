<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<style type="text/css">
	.html, div, body, h1{
	  margin: 0;
	  padding: 0;
	}
	.header{
	  padding: 0.5em;
	  background-color: #bcffbc;
	  border-bottom: 1px solid #bbb;
	}
	.left-header{
	  float: left;
	  width: 25%;
	  padding: 0.5em;
	}
	.go-home{
	  font-size: 3em;
	  padding: 3px;
	}
	.go-home:hover{
	  cursor: pointer;
	  color: #555;
	}
	.logout{
	  font-size: 3em;
	  padding: 3px;
	}
	.logout:hover{
	  cursor: pointer;
	  color: #555;
	}
	.middle-header{
	  width: 49%;
	  float: left;
	}
	.title{
	  text-align: center;
	  padding: 0.5em;
	  font-size: 30px;
	}
	.title:hover{
	  cursor: pointer;
	}
	.right-header{
	  text-align: right;
	  padding: 0.5em;
	}
	.setting{
	  font-size: 3em;
	  padding: 3px;
	}
	.setting:hover{
	  cursor: pointer;
	  color: #555;
	}
	.alarm{
	  font-size: 3em;
	  padding: 3px;
	  font-weight: bold !important;
	}
	.alarm:hover{
	  cursor: pointer;
	  color: #555;
	}
	.go-private{
	  font-size: 3em;
	  padding: 3px
	}
	.go-private:hover{
	  cursor: pointer;
	  color: #555;
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/session_test.jsp"></jsp:include>
	<div class="header">
		<div class="left-header">
			<a onClick="location.href='http://localhost:8080/spring/main/home'"><i class="fas fa-home go-home"></i></a> 
			<a onClick="location.href='http://localhost:8080/spring/login'"><i class="fas fa-sign-out-alt logout"></i></a>
		</div>
		<div class="middle-header" onClick="location.href='http://localhost:8080/spring/main/home'">
			<h1 class="title">Project Management System</h1>
		</div>
		<div class="right-header">
			<a onClick="location.href='http://localhost:8080/spring/main/setting'"><i class="fas fa-cog setting"></i></a>
			<i class="far fa-bell alarm"></i>
			<a onClick="location.href='http://localhost:8080/spring/main/private'"><i class="fas fa-user go-private"></i></a>
		</div>
	</div>
</body>
</html>
