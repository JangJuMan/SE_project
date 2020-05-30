<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login Page</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<style type="text/css">
	html, div, body,h3{
		margin: 0;
		padding: 0;
	}
	h3{
		display: inline-block;
		padding: 0.6em;
	}
	</style>
</head>
<body>
	<h1>Login Form</h1>
	<hr>
	<br>
	<center>
		<c:choose>
			<c:when test="${sessionId != null}">
				<!-- <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2> -->
				<h3>'${sessionId}' 님 환영합니다! </h3>
				<h3><a href="main/home">'${sessionId}' 계정으로 접속하기</a></h3>
				<h3><a href="logout">로그아웃</a></h3>
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
				<div id="naver_id_login" style="text-align:center">
					<a href="${url}">
						<img width="230" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
					</a>
				</div>
				<hr>
				<%-- <!-- 구글 로그인 화면으로 이동 시키는 URL -->
				<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
				<div id="google_id_login" style="text-align:center">
					<a href="${google_url}">
						<img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/>
					</a>
				</div> --%>
			</c:otherwise>
		</c:choose>
	</center>
</body>
</html>