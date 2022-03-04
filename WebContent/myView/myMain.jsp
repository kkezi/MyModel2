<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<div class="w3-content w3-display-container">
  <img class="mySlides" src="<%=request.getContextPath() %>/myImage/img_nature_wide.jpg">
  <img class="mySlides" src="<%=request.getContextPath() %>/myImage/img_mountains_wide.jpg">
  <img class="mySlides" src="<%=request.getContextPath() %>/myImage/img_snow_wide.jpg">
  <div class="w3-center w3-display-bottommiddle" style="width:100%">
    <div class="w3-left" onclick="plusDivs(-1)"> &#10094;</div>
    <div class="w3-right" onclick="plusDivs(1)"> &#10095;</div>
    <span class="w3-badge demo w3-border" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border" onclick="currentDiv(3)"></span>
  </div>
</div>



</body>
</html>