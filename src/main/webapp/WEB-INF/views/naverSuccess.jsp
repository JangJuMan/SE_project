<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
	<title>Naver Login Success</title>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<style type="text/css">
		html, div, body, h3 {
			margin: 0;
			padding: 0;
		}
		h3 {
			display: inline-block;
			padding: 0.6em;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			var name = ${result}.response.name;
			var email = ${result}.response.email;
			$("#name").html("환영합니다. "+name+"님");
			$("#email").html(email);
		  });
	</script>
</head>
<body>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>SIST Naver_Login Success</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>
	<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
	<h3>'${user_name}' 님 환영합니다! </h3>
	<h3><a href="main/home">'${email}' 계정으로 접속하기</a></h3>
	<h3><a href="logout">로그아웃</a></h3>
</body>
</html> --%>