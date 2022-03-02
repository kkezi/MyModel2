<%@page import="myModel.MyBoard"%>
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
<%
 int mynum = Integer.parseInt(request.getParameter("mynum"));
MyBoardDao mbd = new MyBoardDao();
MyBoard mb = mbd.selectMyBoard(mynum);//원래의 것 가져오기 


%>


<hr>
<div class = "mymargin">
	<form action = "<%=request.getContextPath() %>/myView/myBoard/myBoardReplyPro.jsp" method ="post"  
	name ="myf">
	<input type ="hidden" name="mynum" value ="<%=mb.getMynum() %>" >
	<input type ="hidden" name="myref" value ="<%=mb.getMyref() %>" >
	<input type ="hidden" name="myreflevel" value ="<%=mb.getMyreflevel() %>" >
	<input type ="hidden" name="myrefstep" value ="<%=mb.getMyrefstep() %>" >
	<div>
		
		 <table >
		 <caption>게시글 답글</caption>
			<tr><td class= "header">작성자:</td>
			<td><input type ='text' name="mywriter" id= "user" size ='20'></td></tr>
			<tr><td class ="header">비밀번호:</td>
			<td><input type = 'password' name="mypass" id ="pass" size ='20'></td></tr>
		
			<tr><td class ="header">제목:</td>
			<td><input type = 'text' name="mysubject" id = "user" size ='10' value ="re:"<%=mb.getMysubject() %>></td></tr>
		
			<tr><td class = "header">내용:</td>
			<td><textarea rows = "10" cols ="50" name = "mycontent" id="user"></textarea></td></tr>
		
			
			<tr><td colspan ='2'> <button type = 'submit'>답글 입력</button></td></tr>
		</table>
		</div>
		
		
	</form>
</div>




</body>
</html>