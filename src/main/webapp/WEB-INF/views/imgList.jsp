<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript">
	$(function(){
		$(document).on("click",".btnDel", function(){
			var file=$(this).attr("data-del").substring(27);//원본
			var path=$(this).attr("data-del").substring(0,25);
			var fileName=$(this).attr("data-del");
			
			for(var i=0;i<2;i++){
				$.ajax({
		            url : "deleteFile?filename=" + fileName,
		            type : "get",
		            dataType : "text",
		            success : function(result){
		               console.log(result);
		            }
		         })
		        fileName=path+file;
			} 
	        $(this).parent().remove();
		});
	});
</script> 
</head>
<body> 
<jsp:include page="include/header.jsp"></jsp:include>
	
	<div id="imgList">
		<a href="addImg/${vo.mno}" id="btnUpload"><button>사진 업로드 하기</button></a>
		<div class="form-group" id="image_wrap">
			<c:forEach var="file" items="${vo.files}">
				<div class="imgWrap">
				<c:set var="leng" value="${fn:length(file)}"/>
					<p>${fn:substring(file,64, leng)}</p>
					<img src="displayFile?filename=${file}">
					<button data-del="${file }" class="btnDel">X</button>
				</div>
				
			</c:forEach>
		</div>
	</div>
</body>
</html>