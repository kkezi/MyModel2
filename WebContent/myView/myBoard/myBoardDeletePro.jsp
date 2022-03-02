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
String mypass = request.getParameter("mypass");
MyBoardDao mbd = new MyBoardDao();
MyBoard mb = mbd.selectMyBoard(mynum);

String msg = "비밀번호가 다릅니다";
String url = "myBoardDeleteForm.jsp?mynum="+mynum;

if(mypass.equals(mb.getMypass())){//비번이 같으면 
	if(mbd.deleteMyBoard(mynum)>0) {
		msg = "게시글이 삭제되었습니다";
	} else {
		msg = "게시글 삭제가 실패하였습니다";
	}

	url = "myList.jsp";
}


%>

</body>
<script>
alert('<%=msg%>');
location.href='<%=url%>';
</script>
</html>