<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login Page</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
	<!-- <link rel="stylesheet" type="text/css" href="total.css"/> -->
	<style type="text/css">
	.html, div, body{
	  margin: 0;
	  padding: 0;
	}
	.login-page-container{
	  text-align: center;
	}
	  .title-container{
	    padding: 0.1em 0;
	    background-color: #15a181;
	    text-align: center;
	    color: white;
	  }
	    .title{
	
	    }
	  .main-container{
	    padding: 1em;
	  }
	
	    .login-success-container{
	      margin-top: 3em;
	      border: 1px solid #bbb;
	      border-radius: 10px;
		  padding: 1em;
	      text-align: center;
	      width: 50%;
	    }
	    .welcome{
	      font-size: 20px;
	    }
	    .go-main-btn{
	      display: inline-block;
	      font-size: 15px;
	 	  padding: 1em;
		  border-radius: 5px;
		  border: none;
		  font-size: 15px;
	      margin-bottom: 1em;
	    }
		.go-main-btn:hover{
	        background-color: #3290ff;
			color: white;
			cursor : pointer;
		}
	    .logout-btn{
	      display: inline-block;
	      font-size: 15px;
		padding: 1em;
		border-radius: 5px;
		border: none;
		font-size: 15px;
	   }
	      .logout-btn:hover{
	        background-color: #ff5959;
			color: white;
			cursor : pointer;
	      }
	  .login-container{
	    border: 1px solid #bbb;
	    border-radius: 10px;
	    padding: 1em;
	    width: 40%;
	
	  }
	    .text{
	      font-size: 18px;
	      padding-bottom: 1em;
	      border-bottom: 1px solid #ccc;
	    }
	    .naver-login-container{
	      padding: 0.5em;
	    }

	</style>
</head>
<body>
	<div class="login-page-container">
		<div class="title-container">
			<h1 class="title">Login Page</h1>
		</div>
		<div class="main-container">
			<center>
			<c:choose>
				<%-- <c:when test="${sessionId != null}"> --%>
				<c:when test="${session_validity == true}">
					<div class="login-success-container">
						<h3 class="welcome">'${user_name}' 님 환영합니다! </h3>
						<input class="go-main-btn" type="button" value="${email} 계정으로 접속하기" onClick="location.href='main/home'">
						<br>
						<input class="logout-btn" type="button" value="로그아웃" onClick="location.href='logout'">
					<%-- 	
						<h3><a href="main/home">'${sessionId}' 계정으로 접속하기</a></h3>
						<h3><a href="logout">로그아웃</a></h3>
					 --%>
					</div>
					<!-- <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2> -->
				</c:when>
				<c:otherwise>
					<%-- <form action="login.userdo" method="post" name="frm" style="width:470px;">
						<h2>로그인</h2>
						<input type="text" name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}"> 
						<br>
						<input type="password" id="pwd" name="pwd" class="w3-input w3-border" placeholder="비밀번호" > 
						<br>
						<input type="submit" value="로그인" onclick="#"> 
						<br>
					</form>
					<br> --%>
					<!-- 네이버 로그인 창으로 이동 -->
					<div class="login-container">
						<p class="text">아래의 로그인 API 중 하나로 로그인 하십시오.</p>
						<div id="naver_id_login" class="naver-login-container">
							<a href="${url}">
								<img width="230" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
							</a>
						</div>
						<%-- <!-- 구글 로그인 화면으로 이동 시키는 URL -->
						<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
						<div id="google_id_login" style="text-align:center">
							<a href="${google_url}">
								<img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/>
							</a>
						</div> --%>
					</div>
				</c:otherwise>
			</c:choose>
			</center>
		</div>
	</div>
</body>
</html>