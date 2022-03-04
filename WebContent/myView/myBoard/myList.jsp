<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>

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

<hr>
  <div class='mymargin'>
	<h2 align="center" >${myboardName}${myboardid}-${mypageInt}</h2>
	<p align="right"><a href ="<%=request.getContextPath() %>/myBoard/myWriteForm">글쓰기</a></p>
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
 		<c:forEach var= "mb" items = "${list1}">
  		<tr>
   			<td>${myboardnum}</td>
   			<c:set var = "myboardnum" value = "${myboardnum - 1 }" ></c:set>
   			
    		<td class ="title">
    		<c:if test = "${mb.myreflevel > 0 }">
    		<img src = "<%=request.getContextPath() %>/myImage/level.gif" width="${7*mb.myreflevel}">
    		 <img src = "<%=request.getContextPath() %>/myImage/re.gif">
    		</c:if>
    		<a href = "<%=request.getContextPath() %>/myBoard/myBoardInfo?mynum=${mb.mynum}" >${mb.mysubject}</a></td>
    		<td>${mb.mywriter}</td>
    		<td>${mb.myregdate}</td>
    		<td>${mb.myfile1}</td>
   			<td>${mb.myreadcnt}</td>
  		</tr>
  		</c:forEach>
  		</tbody>
	</table>
	
		
    <p align = "left">
    <c:if test = "${countmyboard > 0 }">
	글 개수 : ${countmyboard}
	</c:if>
	<c:if test = "${countmyboard == 0 }">
	 등록된 게시물이 없습니다
	 </c:if>
	</p>
	</div>
	
	
	
	
	
	<div class="w3-center">
		<div class="w3-bar">
			<c:if test = "${mystartPage <= mybottomLine}" >
			<a class = "disabledPage">◀</a>
			</c:if>
			<c:if test = "${mystartPage > mybottomLine}">
  			 <a href="<%=request.getContextPath() %>/myBoard/myList?mypageNum=${mystartPage-mybottomLine}" class="w3-bar-item w3-button">◀</a>
  			</c:if>
  			
  			<c:forEach var = "i" begin="${mystartPage}" end = "${myendPage}">
  		     <c:if test = "${i==mypageInt}"> <a href="<%=request.getContextPath() %>/myBoard/myList?mypageNum=${i}" class = "w3-button w3-gray">${i}</a></c:if>
  		   	 <c:if test = "${i!=mypageInt}"> <a href="<%=request.getContextPath() %>/myBoard/myList?mypageNum=${i}" class = "w3-button">${i}</a></c:if>
  			</c:forEach>
  			
  			<c:if test = "${myendPage >= mymaxPage}">
  			<a class = "disabledPage" >▶</a>
  			</c:if>
  			<c:if test = "${myendPage < mymaxPage}">
  			<a class = "w3-button" href="<%=request.getContextPath()%>/myBoard/myList?mypageNum=${mystartPage+mybottomLine}" >▶</a>
			</c:if>
		</div>
	</div>
			


</body>
</html>