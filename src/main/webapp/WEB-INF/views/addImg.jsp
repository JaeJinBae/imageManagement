<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	#addimgForm{
		width:60%;
		margin:0 auto;
	}
	#dropBox img{
		width:200px;
		height:200px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#file").change(function(){
			$("#dropBox").empty();
			var file=document.getElementById("file");
			
			$(file.files).each(function(i,obj){
				var reader=new FileReader();
				reader.onload=function(e){
					var imgObj=$("<img>").attr("src",e.target.result);
					$("#dropBox").append(imgObj);
				}
				reader.readAsDataURL(file.files[i]);
			});
			
		});
	});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="addimgForm">
		<form method="post" action="${pageContext.request.contextPath}/addImg" enctype="multipart/form-data">
			<div class="form-group">
				<label>Image File</label>
				<input type="hidden" name="mNo" value="${mno}">
				<input type="file" id="file" name="imageFiles" multiple="multiple" class="form-control">
			</div>
			<div id="dropBox">
			
			</div>
			<div class="form-group">
				<input type="submit" value="upload" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>