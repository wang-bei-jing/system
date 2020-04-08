<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	if(session.getAttribute("teacher")==null){
		out.println("<script type='text/javascript'>alert('请登录后操作!');location='views/login.jsp';</script>");
	}
%>