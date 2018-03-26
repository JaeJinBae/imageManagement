<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	#loginContainer{
		width:50%;
		margin:0 auto;
		margin-top:50px;
	}
	#loginContainer #loginForm{
		width:50%;
		margin:0 auto;
		border:1px solid black;
		text-align: center;
		padding: 20px;
	}
	#loginContainer #loginForm table{
		width:100%;
		margin:0 auto;
	}
</style>
<script type="text/javascript">
	$(function(){
		function idpwCheck(){
			var id=$("input[name='id']").val();
			var pw=$("input[name='pw']").val();
			if(id==""||pw==""){
				alert("아이디와 비밀번호를 모두 입력하세요.");
				return;
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/"+id+"/"+pw,
				type:"post",
				dataType:"text",
				success:function(json){
					console.log(json);
					
					if(json!="1"){
						alert("아이디와 비밀번호를 다시 확인하세요.");
					}else{
						location.href="imgList";
					}
				}
			});
		}
	
		$("#btnLogin").click(function(){
			idpwCheck();
		});
	});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="loginContainer">
		<div id="loginForm">
			<h1>Login</h1>
			<table>
				<tr>
					<th>로그인</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" id="btnLogin" class="btn btn-primary" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="register"><input type="button" class="btn btn-info" value="회원가입"></a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
