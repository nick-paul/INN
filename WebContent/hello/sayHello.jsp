<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%-- We can get information from the server using getAttribute()
		This method returns a generic Object so we must cast it
		when we access it. For example:
		
			String text = (String)request.getAttribute("text");
			ArrayList<Date> dates = (ArrayList<Date>)request.getAttribute("dates");
			
	 All of these values were set in BasicController.nameForm()
--%>

<% 
	String helloName = (String)request.getAttribute("helloName");
	Date processTime = (Date)request.getAttribute("processTime");
	
	//Format the Date object into something pretty
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String processTime_str = df.format(processTime);
	
%>


<h2>Hello <%=helloName %></h2>
<br />
<p>Your request was processed on <%= processTime_str %>. </p>


</body>
</html>