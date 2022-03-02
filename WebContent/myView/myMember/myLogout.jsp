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
session.invalidate();

%>
<script>
alert("<%=curlog %>님이 로그아웃되었습니다!");
location.href = "<%=request.getContextPath() %>/myView/myMember/myLoginForm.jsp";
</script>
</body>
</html>