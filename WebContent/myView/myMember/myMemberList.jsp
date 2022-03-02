<%@page import="java.lang.reflect.Member"%>
<%@page import="java.util.List"%>
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


<%
MyMemberDao mmd = new MyMemberDao();
List<MyMember> myli = mmd.myMemberList();


%>

<body>
<div class = 'mymargin'>
	<table>
	<caption>회원정보</caption>
		<tr>
			<td class ='items' colspan ='8' > 회원수:<%=myli.size() %></td>
		</tr>
 		<thead>
 		<tr>
 			<th>아이디</th>
    		<th>이름</th>
    		<th>성별</th>
    		<th>전화번호</th>
    		<th>이메일</th>
    		<th>사진</th>
    		</tr>
 		</thead>
 		<tbody>
 		<% for(MyMember mm: myli) { %>
 		<tr>
 			<td><%=mm.getMyid() %></td>
 			<td><%=mm.getMyname() %></td>
 			<td><%=mm.getMygender()==1?"남자":"여자"%></td>
 			<td><%=mm.getMytel()%></td>
 			<td><%=mm.getMyemail()%></td>
 			<td><%=mm.getMypicture()%></td>
 			</tr>
 			<% } %>
 		</tbody>
 		
	</table>
</div>

</body>
</html>