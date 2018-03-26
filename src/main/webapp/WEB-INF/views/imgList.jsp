<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	#imgList{
		width:60%;
		margin:0 auto;
		text-align: center;
		margin-top:50px;
	}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	
	<div id="imgList">
		<a href="addImg/${mno}" id="btnUpload"><button>사진 업로드 하기</button></a>
	</div>
</body>
</html>