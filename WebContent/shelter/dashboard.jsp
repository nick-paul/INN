<%@page import="table.Table"%>
<%@page import="beans.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Shelter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% Shelter shelter = (Shelter)request.getAttribute("shelter"); %>

<h2><%= shelter.getName() %></h2>
<% ArrayList<Client> clientList=(ArrayList<Client>)request.getAttribute("clientList");%>


<%
	Table clientTable = new Table("Col1", "col2", "col3");
	
	for (int i = 0; i < 5; i++) {
		clientTable.addRow("A" + i, "B" + i, "C" + i);
	}
	

%>

<%= clientTable.toHTML() %>

</body>
</html>