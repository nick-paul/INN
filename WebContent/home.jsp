<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HelloWorldJSP</title>
</head>
<body style="background-color: <%= request.getAttribute("bgColor")%>;">




<%-- 
JSP comment blocks start with <%-- and end with the reverse

	Code inside <% .. %> is translated into literal java code
	Everything else is HTML
	
	Expressions inside <%= .. %> are evaluated and a string is returned.
	  Code inside these braces DO NOT need a semicolon
	  For example, we will define a String variable in a java block
	  and then insert the variable data using the <%= %> block
	  
JSP close comment 
--%>


<%
	//This will be translated into literal java code
	String header = "Welcome!";
%>

<%-- Notice: we do not include a semicolon after "header" --%>
<h1><%= header %></h1>





<%-- You may also include fragments of java code in java blocks
     for example, below we will display the text "Good Morning"
     or "Good Afternoon" depending on whether is it AM or PM
--%>

<%
	//First, get the current time
	//This is nomal java code
	Calendar cal = Calendar.getInstance();
%>
	
<%-- Everywhere we want to use Java (even partial java statements),
     we must wrap in Java blocks, everywhere else is translated directly into html.
--%>

<% if (cal.get(Calendar.AM_PM) == Calendar.PM) { %>
	<h2>Good Afternoon</h2>
<% } else { %>
	<h2>Good Morning</h2>
<% } %>
	
	
	

	
<%-- If we want to send data to the server, we will use a form.
		HTML forms require an "action" if we want them to submit to our server.
		The action is just a URL that the data will be posted to.
		In this case, we will have the form post the data to our BasicServlet.java
		class. 
	
	In web.xml, you will find a "servlet-mapping" field that maps the name
		"basicServlet" to the servlet "serlets.BasicServlets". We will use the name
		basicServlet in our URL
		
	To get the complete URL, we will need the context path. The context
		path is the front of the url and includes the domain (i.e. "http://google.com/..."
		We can get this information using the following java code: 
		
	We want to add a '?' followed by a list of parameters after our full URL.
	    Parameters are key/value pairs separated by '&'. For example:
	      
	      http://some_url.com/some/page?key1=value1&key2=value2&...
	    
	    These key/value pairs will be directly accessible by the server and we
	    can use them to decide what information we are submitting. For our
	    form, we will add the pair "command=nameForm". This way the server
	    can access the value for the key "command" and know that we are submitting
	    the form named "nameForm".
	    
	Add method="POST" to the form to tell the client (chrom, firefox, etc.) that we
	    want to submit the data to the server.
--%>

<% String contextPath = request.getContextPath(); %>

<%-- Now we can define the action of our form to be (context path) + (BasicServlet location) --%>
<form action="<%= contextPath %>/basicServlet?command=nameForm" method="POST">

	<%--
		Next, we will add an input to the form.
		For a basic text input we use the type "text"
		We also add a name to the input so the server can access it later
			in this case we will call it "myName"
	--%>
	<p>Enter your name</p>
	<input type="text" name="myName">
	
	<%-- All forms should have a submit button,
		 this button will automatically execute the action of the form
    --%>
	<input type="submit" value="Submit">
	
	
</form>

<br />
<hr />
<br />

<%-- Below we have another form that asks for the users favorite color using a dropdown list --%>
<p>Please select a color:</p>
<form action="<%= contextPath %>/basicServlet?command=colorForm" method="POST">
	<select name="color">
	    <option value="0000FF">Blue</option>
	    <option value="00FF00">Green</option>
	    <option value="FF0000">Red</option>
	    <option value="FFF000">Yellow</option>
  	</select>
  	<input type="submit" value="Submit">
</form>

</form>
</body>
</html>