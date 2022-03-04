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

<hr>
<div class="mymargin">
			
			<table >
			<caption>${myboardName}</caption>
			<tr>
			<th>작성자: </th><td>${mb.mywriter}</td>
			</tr>
			<tr>
			<th>제목: </th><td>${mb.mysubject}</td>
			</tr>
			<tr>
			<th height ="250px">내용: </th><td>${mb.mycontent}</td>
			</tr>
			<tr>
			<th>파일: </th><td><img src = "<%=request.getContextPath() %>/myboardupload/${mb.myfile1}"></td>
			</tr>
			<tr><td colspan='2'>
			<button class="btn btn-dark" onclick ="location.href ='<%=request.getContextPath()%>/myBoard/myBoardReplyForm?mynum=${mb.mynum}'">답 변</button>
			<!--"location.href ='myBoardReplyForm?mynum=${mb.mynum}'" 이렇게도 가능-->
			
			<button class="btn btn-dark" onclick ="location.href ='<%=request.getContextPath()%>/myBoard/myBoardUpdateForm?mynum=${mb.mynum}'">수 정</button>
			<button class="btn btn-dark" onclick ="location.href ='<%=request.getContextPath()%>/myBoard/myBoardDeleteForm?mynum=${mb.mynum}'">삭 제</button>
			<button class="btn btn-dark" onclick ="location.href ='myList'">목록으로</button></td></tr>
			
			</table>
			
			
					
			
			
			
</div>

</body>
</html>