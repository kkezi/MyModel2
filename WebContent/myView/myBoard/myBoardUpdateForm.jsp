<%@page import="myModel.MyBoard"%>
<%@page import="myModel.MyMember"%>
<%@page import="myService.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>
<div class = 'mymargin'>
	<form action = "<%=request.getContextPath() %>/myBoard/myBoardUpdatePro" method ="post" enctype = "multipart/form-data" 
	name ="myf">
	<input type="hidden" name=myfile2 value="${mb.myfile1}"  >
	<input type="hidden" name =mynum value="${mb.mynum}" >
	<table>
		<caption>게시글 입력</caption>
		 <tr><td class= "header">작성자:</td>
			<td><input type ='text' name="mywriter" id= "user" size ='20' readonly = "readonly" value= "${mb.mywriter}"></td></tr>
		 <tr><td class ="header">비밀번호:</td>
			<td><input type = 'password' name="mypass" id ="pass" size ='20' ></td></tr>
		
			<tr><td class ="header">제목:</td>
			<td><input type = 'text' name="mysubject" id = "user" size ='10' value ="${mb.mysubject}"></td></tr>
		
			<tr><td class = "header">내용:</td>
			<td><textarea rows = "10" cols ="50" name = "mycontent" id="user">${mb.mycontent}</textarea></td></tr>
		
		<tr><td class ="header">파일저장</td>
		<td><input type='file' name = "myfile1" id="user"></td></tr>
		<tr><td colspan='2'><button type = 'submit'>수 정</button></td></tr>
		</table>
		
		
		
	</form>
</div>

</body>
</html>