<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	body{
		margin:0;
	}
	#header{
		margin:0;
		padding:10px;
		width:100%;
		background: #5587ED;
		min-width:620px;
		text-align:center;
	}
	#header h2{
		margin-top:10px;
	}
	#header #loginStatus{
		width:100%;
		text-align: right;
		color:black;
		font-weight: bold;
	}
	#header #loginStatus a{
		color:black;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div id="header">
		<h2>~~~~ 파일 업로드 ~~~~ </h2>
		<div id="loginStatus">
			<c:if test="${sessionScope.id != null}">
				<p>${id}님 환영합니다.</p>
				<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
			</c:if>
			<c:if test="${sessionScope.id == null}">
				<p>로그인이 필요합니다.</p>
				
			</c:if>
		</div>
	</div>
</body>
</html>