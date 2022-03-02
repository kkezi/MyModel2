<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
int mynum = Integer.parseInt(request.getParameter("mynum"));

%>

<!-- delete start -->
	<div class ='mymargin'>
	<form autocomplete ="on" action = "<%=request.getContextPath()%>/myView/myBoard/myBoardDeletePro.jsp"> <!-- 저장된 아이디 사용 -->
		<input type ="hidden" name ="mynum"	value = "<%=mynum%>">
		<table>
		<caption>게시물 삭제</caption>
		
		<tr>
			<th>비밀번호</th>
			<td><input type = 'password' id = "user_pw" name="mypass" size ='20' ></td>
		</tr>
		<tr>
			<td colspan ='2'>
			<button type ='submit' >삭 제</button>
			
			</td>
		</tr>
		</table>
	</form>
	</div>




</body>
</html>