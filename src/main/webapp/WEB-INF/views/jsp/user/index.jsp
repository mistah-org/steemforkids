<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="org.mistah.model.admin.SystemUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%
		List<SystemUser> users = (List<SystemUser>) request.getAttribute("users");
	%>
	<%
		for (SystemUser user : users) {
			pageContext.setAttribute("firstname", user.getFirstName());
	%>
	<div>${firstname}</div>
	<%
		}
	%>
</body>
</html>