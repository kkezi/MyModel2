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
MyBoard mb = mbd.selectMyBoard(mynum); //원래 것 가져오기
mbd.readMyCountUp(mynum); //조회수

//myboardid 게시판 여러개 관리 
String myboardid ="";
if(request.getParameter("myboardid")!=null) {
	session.setAttribute("myboardid", request.getParameter("myboardid"));
	session.setAttribute("mypageNum", "1");
}
myboardid = (String)session.getAttribute("myboardid");

if(myboardid == null) {
	myboardid = "1";
}
String myboardName="공지사항";
switch(myboardid) {
case "3": myboardName="QnA"; break;
case "2": myboardName= "자유게시판"; break;

}

%>

<hr>
<div class="mymargin">
			
			<table >
			<caption><%=myboardName %></caption>
			<tr>
			<th>작성자: </th><td><%=mb.getMywriter() %></td>
			</tr>
			<tr>
			<th>제목: </th><td><%=mb.getMysubject() %></td>
			</tr>
			<tr>
			<th height ="250px">내용: </th><td><%=mb.getMycontent() %></td>
			</tr>
			<tr>
			<th>파일: </th><td><img src = "<%=request.getContextPath() %>/myboardupload/<%=mb.getMyfile1() %>"></td>
			</tr>
			<tr><td colspan='2'>
			<button class="btn btn-dark" onclick ="location.href ='myBoardReplyForm.jsp?mynum=<%=mb.getMynum()%>'">답 변</button>
			<button class="btn btn-dark" onclick ="location.href ='myBoardUpdateForm.jsp?mynum=<%=mb.getMynum()%>'">수 정</button>
			<button class="btn btn-dark" onclick ="location.href ='myBoardDeleteForm.jsp?mynum=<%=mb.getMynum()%>'">삭 제</button>
			<button class="btn btn-dark" onclick ="location.href ='myList.jsp'">목록으로</button></td></tr>
			
			</table>
			
			
					
			
			
			
</div>

</body>
</html>