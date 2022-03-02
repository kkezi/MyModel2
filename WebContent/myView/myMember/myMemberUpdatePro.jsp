
<%@page import="myModel.MyMember"%>
<%@page import="myService.MyMemberDao"%>
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
int num1 = 0;
String curlog =(String)session.getAttribute("mymemberId");


//수정 못할때 떠야할 메세지와 url
String msg = "비밀번호가 다릅니다. 확인 후 다시 입력하세요";
String url = request.getContextPath() +"/myView/myMember/myMemberUpdate.jsp";


if(curlog == null || curlog.trim().equals("")) { //로그인 정보가 없을때
	%> 
	<script>
	alert("로그인이 필요합니다")
	location.href="<%=request.getContextPath()%>+"/myView/myMember/myLoginForm.jsp";
	</script>
<% } else { 
	String mytel = request.getParameter("mytel");
	String myemail = request.getParameter("myemail");
	String mypicture = request.getParameter("mypicture");
	String mypasswd = request.getParameter("mypasswd");
	
	MyMemberDao mmd = new MyMemberDao();
	MyMember mm = mmd.selectMyOne(curlog);
	System.out.println(mm);
	mm.setMytel(mytel);
	mm.setMyemail(myemail);
	mm.setMypicture(mypicture);
	
	
	if(mm.getMypasswd().equals(mypasswd)) {
		
		num1 = mmd.updateInfo(mm);
		msg ="회원정보 수정되었습니다";
		url = request.getContextPath()+"/myView/myMain.jsp";
	} 
	}

%>
<script>
alert("<%=msg%>");
location.href ="<%=url%>";
</script>
</body>
</html>