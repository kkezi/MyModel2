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
String curlog = (String)session.getAttribute("mymemberId");

String msg = "";
String url ="";

if(curlog == null || curlog.trim().equals("")) { %>
	<script>
	alert("로그인을 먼저 해주세요");
	location.href ="<%=request.getContextPath()%>/myView/myMember/myLoginForm.jsp";
	
	</script>
	
<% } else { //아이디 확인되면 
	String mypasswd = request.getParameter("mypasswd");
	
	MyMemberDao mmd = new MyMemberDao();
	MyMember mm = mmd.selectMyOne(curlog);
	
	if(mm.getMypasswd().equals(mypasswd)) { // 비번도 같으면
		int num1 = mmd.deleteInfo(curlog); //탈퇴하기
		
		if(num1 == 0) { //삭제 오류발생시
			msg = curlog+ "님 탈퇴 오류 발생";
			url = request.getContextPath()+"/myView/myMain.jsp";
		} else { //삭제 성공시 
			session.invalidate(); //로그아웃시키기
			msg = curlog+"님 탈퇴되었습니다";
			url =request.getContextPath()+"/myView/myMain.jsp";
		}
	} else { //비번 다르면
	msg = "비밀번호가 다릅니다";
	url = request.getContextPath()+"/myView/myMember/myDeleteForm.jsp";
 } 
 }%> 
 <script>
 alert("<%=msg%>");
 location.href = "<%=url%>";
 </script>
</body>
</html>