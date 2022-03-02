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

mb.setMynum(Integer.parseInt(multi1.getParameter("mynum")));
mb.setMypass(multi1.getParameter("mypass"));
mb.setMysubject(multi1.getParameter("mysubject"));
mb.setMycontent(multi1.getParameter("mycontent"));
mb.setMyfile1(multi1.getFilesystemName("myfile1"));

MyBoardDao mbd = new MyBoardDao();

if(mb.getMyfile1()==null || mb.getMyfile1().equals(""))	 {
	mb.setMyfile1(multi1.getParameter("myfile2"));
}

MyBoard m = mbd.selectMyBoard(mb.getMynum());

String msg = "비밀번호가 다릅니다";
String url = "myBoardUpdateForm.jsp?mynum="+mb.getMynum();

//비번이 같으면 수정가능 
if (mb.getMypass().equals(m.getMypass())) {
	if(mbd.updateMyBoard(mb)>0) {
		msg="수정완료";
		url = "myBoardInfo.jsp?mynum="+mb.getMynum();
	} else {
		msg = "수정실패";
	}
}

%>
</body>
<script>
alert('<%=msg%>');
location.href = "<%=url%>";

</script>
</html>