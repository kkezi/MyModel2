<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- login start -->
	<div class ='mymargin'>
	<form autocomplete ="on" action = "<%=request.getContextPath()%>/myMember/myLoginPro"> <!-- 저장된 아이디 사용 -->
		<table>
		<caption>로그인</caption>
		<tr>
			<th>아이디 </th>
			<td><input type ='text' id = "user_id" name="myid" size = '20' ></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type = 'password' id = "user_pw" name="mypasswd" size ='20' ></td>
		</tr>
		<tr>
			<td colspan ='2'>
			<input type ='submit' value = '로그인' onclick="log()"> 
			<input type ='button' value ="회원가입" onclick="sign()">
			</td>
		</tr>
		</table>
	</form>
	</div>
	
</body>
</html>


