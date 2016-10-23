<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<jsp:include page="/includes/header.jsp" />
<%Integer id=(Integer)(request.getAttribute("shelterID")); %>
<%Double lat=(Double)(request.getAttribute("lat")); %>
<%Double lon=(Double)(request.getAttribute("lon")); %>
<h2>Please Enter Your Information</h2>
<p>We will send your info the the shelter of your choice<p>
<br />
<br />

	<form action="<%= contextPath %>/ClientServlet?command=newClient" method="POST">
		<div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="firstName">
		    <label class="mdl-textfield__label" >First Name...</label>
		 </div>
	<br />
		<div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="lastName">
		    <label class="mdl-textfield__label">Last Name...</label>
		 </div>
	<br >
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="phoneNumber">
		    <label class="mdl-textfield__label">Phone Number...</label>
		 </div>
		 
		 <br />
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="number" name="eta">
		    <label class="mdl-textfield__label" >ETA (in minutes)...</label>
		 </div>
		 <br />
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="number" name="beds">
		    <label class="mdl-textfield__label" ># Of Beds</label>
		 </div>
		 <br />
		 
		<div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="number" name="age">
		    <label class="mdl-textfield__label" >Age</label>
		 </div>
		 <br />
		 
		 
		<div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="gender">
		    <label class="mdl-textfield__label" >Gender</label>
		 </div>
   
    	<input type="hidden" name="id"  value=<%=id%>>
    	<input type="hidden" name="lat" value=<%=lat%>>
    	<input type="hidden" name="lon" value=<%=lon %>>
		<br />
		
		<input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="submit" value="Submit">
	</form>

        
<jsp:include page="/includes/footer.jsp" />