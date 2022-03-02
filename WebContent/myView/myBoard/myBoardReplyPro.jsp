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
request.setCharacterEncoding("utf-8");


MyBoardDao mbd = new MyBoardDao();
MyBoard mb = new MyBoard();

mb.setMywriter(request.getParameter("mywriter"));
mb.setMypass(request.getParameter("mypass"));
mb.setMysubject(request.getParameter("mysubject"));
mb.setMycontent(request.getParameter("mycontent"));
mb.setMyfile1("");
mb.setMyip(request.getLocalAddr());



//boardid 
String myboardid = (String)session.getAttribute("myboardid");
if(myboardid == null){
	myboardid ="1";
}
mb.setMyboardid(myboardid);


int mynum = Integer.parseInt(request.getParameter("mynum"));
int myref = Integer.parseInt(request.getParameter("myref"));
int myreflevel = Integer.parseInt(request.getParameter("myreflevel"));
int myrefstep = Integer.parseInt(request.getParameter("myrefstep"));


String msg = "답변 오류발생";
String url = "myBoardReplyForm.jsp?mynum="+mynum;

mbd.myrefStepAdd(myref, myrefstep);

mb.setMynum(mbd.nextMyNum());
mb.setMyref(myref);
mb.setMyreflevel(myreflevel+1);
mb.setMyrefstep(myrefstep+1);

if(mbd.insertMyBoard(mb) > 0) {
	msg = "답변 등록 완료";
	url = "myList.jsp";
}
%>
</body>
<script>
alert('<%=msg%>')
location.href = "<%=url%>"
</script>
</html>