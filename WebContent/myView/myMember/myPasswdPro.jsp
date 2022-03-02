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
String msg = "";
String url ="";
 String curlog = (String)session.getAttribute("mymemberId");
 if(curlog == null || curlog.trim().equals("")) { %>
 <script>
	 alert("로그인이 필요합니다!")
	 location.href ="<%=request.getContextPath()%>/myView/myMember/myLoginForm.jsp"
</script>
 <%} else { 
 	MyMemberDao mmd = new MyMemberDao();
 	MyMember mm = mmd.selectMyOne(curlog);
 	String mypasswd = request.getParameter("mypasswd");
 	String mypasswd_new = request.getParameter("mypasswd_new");
 
 if(mypasswd.equals(mm.getMypasswd())) {
	  int num = mmd.newPasswd(curlog, mypasswd_new);
	 if(num > 0 ) {
		 msg= "비밀번호가 수정되었습니다";
		 url = "myMain.jsp";
	 } else { 
		 msg = "비밀번호 변경 오류가 발생되었습니다";
		 url = "myMain.jsp";
	 }
 } else {
	 msg="비밀번호가 현재 비밀번호와 다릅니다";
	 url = "myMember/myPasswdForm.jsp";
 }
 
 
 } %>
 <script>
 alert("<%=msg%>");
 location.href ="<%=request.getContextPath()%>/myView/<%=url%>";
 
 </script>
</body>
</html>