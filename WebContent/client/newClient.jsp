<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<jsp:include page="/includes/header.jsp" />

Create a Client.
	<form action="<%= contextPath %>/ClientServlet?command=newClient" method="POST">
		<input type="text" name="firstName" placeholder="first name">
    	<input type="text" name="lastName" placeholder="last name"><br>
    	<br>
    	<input type="number" name="id" placeholder="ID"><br>
    	<input type="number" name="lat" placeholder="latitude"><br>
    	<input type="number" name="lon" placeholder="longitude"><br>
    	<br>
    	<input type="text" name="phoneNumber" placeholder="phone (###) ###-####"><br>
		<br>
   		<input type="number" name="eta" placeholder="estimated time of arrival at shelter"><br>
		<br>
		<input type="number" name="beds" placeholder="number of beds required"><br>
		<br>
		<input type="number" name="age" placeholder="your age"><br>
		<br>
    	<input type="text" name="gender" placeholder="gender"><br>
    	<br>	
		<input type="submit" value="Submit">
	</form>

        
<jsp:include page="/includes/footer.jsp" />