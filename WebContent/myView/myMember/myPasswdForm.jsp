<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkPass(myf){
	if(myf.mypasswd.value =='' ) {
		alert("현재 비밀번호를 입력해주세요")
		myf.mypasswd.focus()
		return false
	}
	if(myf.mypasswd_new.value=='' ) {
		alert("새 비밀번호를 입력해주세요")
		myf.mypasswd_new.focus()
		return false
	}
	if(myf.mypasswd_confirm.value=='' ) {
		alert("새 비밀번호를 확인해주세요")
		myf.mypasswd_confirm.focus()
		return false
	}
	if(myf.mypasswd_new.value != myf.mypasswd_confirm.value ) {
		alert("새 비밀번호가 다릅니다")
		myf.mypasswd_confirm.value=""
		myf.mypasswd_confirm.focus()
		return false
	}
	if(myf.mypasswd_new.value == myf.mypasswd.value ) {
		alert("같은 비밀번호는 사용할 수 없습니다")
		myf.mypasswd_new.value=""
		myf.mypasswd_new.focus()
		return false
	}
	return true;
	
	
}


</script>
<body>
<%
String curlog = (String)session.getAttribute("mymemberId");

if (curlog==null||curlog.trim().equals("")) { %>
	<script>
	alert("로그인이 필요합니다")
	location.href = "<%=request.getContextPath() %>/myView/myMember/myLoginForm.jsp";
	</script>
<% } else { %>
	
<!-- passwd confirm start -->
	<div class ='mymargin'>
	<form autocomplete ="on" action = "<%=request.getContextPath()%>/myView/myMember/myPasswdPro.jsp" method ="post"
	name = "myf" onsubmit = "return checkPass(this)"> 
		<table>
		<caption>비밀번호 변경</caption>
		<tr>
			<th>아이디 </th>
			<td><input type ='text' id = "user_id" name="myid" size = '20' readonly ="readonly" value="<%=curlog%>"></td>
		</tr>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type = 'password' id = "user_pw" name="mypasswd" size ='20' ></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type = 'password' id = "user_pw" name="mypasswd_new" size ='20' ></td>
		</tr>
		<tr>
			<th>새 비밀번호 확인</th>
			<td><input type = 'password' id = "user_pw" name="mypasswd_confirm" size ='20' ></td>
		</tr>
		<tr>
			<td colspan ='2'>
			<button type ='submit'>비밀번호 변경</button>
			</td>
		</tr>
		</table>
	</form>
	</div>
	<% } %>
</body>
</html>