<%@page import="myModel.MyMember"%>
<%@page import="myService.MyMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> // 사진 수정
function win_upload1() {
	const myop = "width=500, height = 150, left=150, top=150";
	open('<%=request.getContextPath()%>/mySingle/myPictureForm.jsp',"", myop);
}
</script>
</head>
<body>
<hr>
<div class = 'mymargin'>
	<form action = "<%=request.getContextPath() %>/myMember/myMemberUpdatePro" method ="post" name="myf" >
	<input type="hidden" name = "mypicture">
	<table>
		<caption>회원정보수정</caption>
		<tr>
			<td rowspan = '4'><img src="<%=request.getContextPath() %>/myUpload/${m.mypicture}" width="200" height = "150" id ="mypic">
			<button type = "button" id="input_img" onclick = "win_upload1()">사진수정</button>
			<td class= 'header'>아이디</td>
			<td><input type ='text' id ='user' name="myid" readonly="readonly" size ='20' value = "${m.myid}"></td>
			
		</tr>
		<tr>
			<td class= 'header'>비밀번호</td>
			<td><input type = 'password' id ='user' name="mypasswd" size ='20'></td>
		</tr>
		<tr>
			<td class= 'header'>이름</td>
			<td><input type = 'text' id = 'user' name="myname" readonly="readonly" size ='10' value ="${m.myname}"></td>
		</tr>
		<tr>
			<td class= 'header'>성별</td>
			<td>
			<label><input type="radio" name="mygender" ${m.mygender ==1 ? "checked":"" } value="1" disabled="disabled">남 </label>
			<label><input type="radio" name="mygender" ${m.mygender ==2 ? "checked":"" } value="2" disabled="disabled">여 </label>
			</td>
		</tr>
		<tr>
			<td class= 'header'>전화번호</td>
			<td colspan ='2'><input type = 'tel' id = 'user' name = "mytel" value ="${m.mytel}"size = '11'></td>
		</tr>
		<tr>
		<td class= 'header'>이메일</td>
		<td colspan ='2'><input type='email' id= 'user' name = "myemail" value = "${m.myemail}" size = '60'></td>
		</tr>
		<tr>
		<td colspan = '3'><button type = 'submit'>회원정보수정</button>
		<button type = 'button' onclick = "location.href='<%=request.getContextPath()%>/myMember/myPasswdForm'">비밀번호변경</button></td>
		</tr>
	</table>
	</form>
	
</div>

</body>
</html>