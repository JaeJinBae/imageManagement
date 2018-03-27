<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	#insertWrap{
		width:30%;
		margin:0 auto;
		margin-top:20px;
		border:1px solid black;
		padding:5px;
	}
	#insertWrap #f1{
		width:400px;
		margin:0 auto;
	} 
</style>
<script type="text/javascript">
	$(function(){
		function idCheck(){
			var id=$("input[name='id']").val();
			$.ajax({
				url:"idConfirm/"+id,
				type:"get",
				dataType:"text",
				success:function(json){
					console.log(json); 
					if(json=="0"){
						alert("사용 가능한 아이디 입니다.");
						return true;
					}else{
						alert("사용 불가능한 아이디 입니다.");
						return false;
					}
				}
			});
		}
		
		function formCheck(){
			var name=$("input[name='name']").val();
			var id=$("input[name='id']").val();
			var pw=$("input[name='pw']").val();
			var pwch=$("input[name='pwConfirm']").val();
			var mail=$("input[name='mail']").val();
			var phone=$("input[name='phone']").val();
			
			var pname=/^[가-힣]{2,5}$/;
			var pid=/^[a-z]+[a-z0-9]{5,15}$/;
			var ppw =/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{7,20}$/;
			if(pname.test(name)==false){
				alert("이름은 2~5자 한글만 가능합니다.");
				return false;
			}
			if(pid.test(id)==false){
				alert("아이디는 6자 이상 영어, 숫자만 가능합니다.");
				return false;
			}
			if(ppw.test(pw)==false){
				alert("비밀번호는 8~20자 영어, 숫자, 특수문자(~!@#$%^&*)만 가능합니다.");
				return false;
			}
			if(pw!=pwch){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			if(name==""||id==""||pw==""||mail==""||phone==""){
				alert("정보를 모두 입력해 주세요.");
				return false;
			}
			if(idCheck()==false){
				alert("아이디가 중복됩니다.");
			}
		}
		
		$("#idConfirm").click(function(){
			idCheck();
		});
		$("#f1").submit(function(){
			
			return formCheck();
			
		});
	});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="insertWrap">
		<form id="f1" method="post" action="register">
			<table>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
					<td><input type="button" id="idConfirm" value="중복확인"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="text" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan="2"><input type="text" name="pwConfirm"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2"><input type="text" name="mail"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2"><input type="text" name="phone"></td>
				</tr>
			</table>
			<input type="submit" value="가입">
		</form>
	</div>
</body>
</html>