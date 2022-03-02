
<%@page import="myService.MyBoardDao"%>
<%@page import="myModel.MyBoard"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String mypath = application.getRealPath("/")+"/myboardupload/";
int mysize = 10*1024*1024;
MultipartRequest multi1 = new MultipartRequest(request,mypath,mysize,"UTF-8");

MyBoard mb = new MyBoard();

mb.setMywriter(multi1.getParameter("mywriter"));
mb.setMypass(multi1.getParameter("mypass"));
mb.setMysubject(multi1.getParameter("mysubject"));
mb.setMycontent(multi1.getParameter("mycontent"));
mb.setMyfile1(multi1.getFilesystemName("myfile1"));
mb.setMyip(request.getLocalAddr());




String myboardid = (String)session.getAttribute("myboardid");
if(myboardid==null) {
	myboardid = "1";
}
mb.setMyboardid(myboardid);

MyBoardDao mbd = new MyBoardDao();



//새 게시글인 경우 
mb.setMynum(mbd.nextMyNum());


//ref==num으로 만들기
mb.setMyref(mb.getMynum());

int num1 = mbd.insertMyBoard(mb);

String msg = "게시물 등록 실패ㅠㅠ";
String url = request.getContextPath()+"/myView/myBoard/myWriteForm.jsp";
if(num1 ==1) {
	msg = "게시물 등록 성공";
	url = request.getContextPath()+"/myView/myBoard/myList.jsp";
}




%>
<script>
alert("<%=msg%>")
location.href="<%=url%>"
</script>
</body>
</html>