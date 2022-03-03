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

<script>
const myimg = opener.document.querySelector("#mypic");
myimg.src = "<%=request.getContextPath()%>/myUpload/${myfilename}";
opener.document.myf.mypicture.value= "${myfilename}";
self.close()
</script>

</body>
</html>