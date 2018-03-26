<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#addimgForm{
		width:60%;
		margin:0 auto;
	}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="addimgForm">
		<form method="post" action="addImg" enctype="multipart/form-data">
			<div class="form-group">
				<label>Image File</label>
				<input type="hidden" name="mno" value="${mno}">
				<input type="file" name="imageFiles" multiple="multiple" class="form-control">
			</div>
			<div class="form-group">
				<input type="submit" value="submit" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>