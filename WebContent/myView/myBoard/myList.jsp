<%@page import="myModel.MyBoard"%>
<%@page import="java.util.List"%>
<%@page import="myService.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.disabledPage {
	color: gray;
	}

</style>

</head>
<body>
<%
String myboardid = "";
int mypageInt = 1;
int mylimit = 5;

//myboardid 게시판 여러개 관리 
if(request.getParameter("myboardid")!=null) {
	session.setAttribute("myboardid", request.getParameter("myboardid"));
	session.setAttribute("mypageNum", "1");
}
myboardid = (String)session.getAttribute("myboardid");

if(myboardid == null) {
	myboardid = "1";
}



//mypageNum이 파라미터로 넘어왔을때는 세션으로 저장하기 ---> 글 입력하고 현재 페이지로 오게 하는 것 
if(request.getParameter("mypageNum")!= null) {
	session.setAttribute("mypageNum", request.getParameter("mypageNum"));
}
String mypageNum = (String)session.getAttribute("mypageNum");
if(mypageNum==null) {
	mypageNum="1";
}
mypageInt = Integer.parseInt(mypageNum);




MyBoardDao mbd = new MyBoardDao();
int countmyboard = mbd.countMyBoard(myboardid);


List<MyBoard> list1 = mbd.myBoardList(mypageInt,mylimit,countmyboard,myboardid);

int myboardnum = countmyboard - mylimit*(mypageInt-1); 
/*
1p -- 1 ~ 5
2p -- 6 ~ 10
3p -- 11 ~ 15 
*/
int mybottomLine = 5;
int mystartPage = (mypageInt-1)/mybottomLine * mybottomLine + 1 ; //1,6,11
int myendPage = mystartPage + mybottomLine -1; //5,10,15
int mymaxPage = (countmyboard/mylimit) + (countmyboard % mylimit ==0? 0:1);
if(myendPage > mymaxPage) myendPage = mymaxPage;


String myboardName="공지사항";
switch(myboardid) {
case "3": myboardName="QnA"; break;
case "2": myboardName= "자유게시판"; break;

}

%>
<hr>
  <div class='mymargin'>
	<h2 align="center" ><%=myboardName%><%=myboardid %>-<%=mypageInt %></h2>
	<p align="right"><a href ="<%=request.getContextPath() %>/myView/myBoard/myWriteForm.jsp">글쓰기</a></p>
	<table>
		
		<thead>
 		<tr>
 			<th>번호</th>
    		<th>제목</th>
    		<th>작성자</th>
    		<th>등록일</th>
    		<th>파일</th>
    		<th>조회수</th>
 		</tr>
 		</thead>
 		<tbody>
 		<%
 			for(MyBoard mb : list1) {
 				
 		%>
  		<tr>
   			<td><%=myboardnum-- %></td>
   			
    		<td class ="title">
    		<% if(mb.getMyreflevel() > 0) { %>
    		<img src = "<%=request.getContextPath() %>/myImage/level.gif" width="<%=7*mb.getMyreflevel()%>">
    		 <img src = "<%=request.getContextPath() %>/myImage/re.gif">
    		<% } %>
    		<a href = "myBoardInfo.jsp?mynum=<%=mb.getMynum()%>"><%=mb.getMysubject() %></a></td>
    		<td><%=mb.getMywriter() %></td>
    		<td><%=mb.getMyregdate() %></td>
    		<td><%=mb.getMyfile1() %></td>
   			<td><%=mb.getMyreadcnt() %></td>
  		</tr>
  		<% } %>
  		</tbody>

	</table>
    <p align = "left">
	<%if(countmyboard > 0) { %>글 개수 : <%=countmyboard %>
	<%} else { %> 등록된 게시물이 없습니다
	 	<% } %>
	</p>
	</div>
	
	
	<div class="w3-center">
		<div class="w3-bar">
  			<a <%if(mystartPage <= mybottomLine){ %> class= "disabledPage" <%} else { %> href="myList.jsp?mypageNum=<%=mystartPage-mybottomLine %>" class="w3-bar-item w3-button"<%}%> >◀</a>
  			<% for(int i = mystartPage; i <= myendPage; i++) { %>
  		     
  		   	<a href="myList.jsp?mypageNum=<%=i %>" <%if(i==mypageInt) {%> class = "w3-button w3-gray"<% } else {%> class="w3-button" <%} %> > <%=i %></a>  
			 
			
  		     
  			<%}  %>
  			<a <%if(myendPage>=mymaxPage){ %> class = "disabledPage" <%} else { %> href="myList.jsp?mypageNum=<%=mystartPage+mybottomLine %>" class="w3-button"<%}%> >▶</a>
		</div>
	</div>
	


</body>
</html>