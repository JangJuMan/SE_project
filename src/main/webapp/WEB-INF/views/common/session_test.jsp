<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		if('${session_validity}' != 'true'){
			alert("세션이 만료되었습니다.");
			document.location.href = "http://localhost:8080/spring/login";
		}
	</script>
</body>
</html>