
<%@page import="myModel.MyMember"%>
<%@page import="myService.MyMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String myid = request.getParameter("myid");

if(myid == null) {
	myid ="";
}

MyMemberDao mmd = new MyMemberDao();
MyMember mm = mmd.selectMyOne(myid);
String mychk =(mm == null? "false":"true");
%>
<%=mychk%>