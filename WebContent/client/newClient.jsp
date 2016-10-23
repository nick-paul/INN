<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<style>
	html {
		margin: 0;
		padding: 0;
	}
	body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
		background: #f3f3f3;
	}
	#heading {
		background-color: #1565C0;
		width: 100%;
		height: 200px;
		margin: 0;
		padding: 0;
		color: white;
		position: relative;
		-webkit-box-shadow: inset 0px -47px 5px -46px rgba(92,92,92,0.63);
		-moz-box-shadow: inset 0px -47px 5px -46px rgba(92,92,92,0.63);
		box-shadow: inset 0px -47px 5px -46px rgba(92,92,92,0.63);
	}
	#nestedHeading {
		position: absolute;
		width: 100%;
		bottom: 25px;
		text-align: center;
	}
	#content {
		width: 100%;
		margin: 0;
		padding: 0;
	}
	#nestedContent {
		max-width: 850px;
		margin-left: auto;
		margin-right: auto;
		padding-top: 65px;
		padding-bottom: 65px;
	}
</style>

<jsp:include page="/includes/header.jsp" />
<%Integer id=(Integer)(request.getAttribute("shelterID")); %>
<%Double lat=(Double)(request.getAttribute("lat")); %>
<%Double lon=(Double)(request.getAttribute("lon")); %>

<div id="heading">
	<div id="nestedHeading">
		<h2>Request a Space</h2>
	</div>
</div>
<div id="content">
	<div id="nestedContent">
	<form action="<%= contextPath %>/ClientServlet?command=newClient" method="POST">
		<div class="mdl-card mdl-shadow--2dp" style="width: 100%; min-height: 0;">
		  <div class="mdl-card__supporting-text" style="padding: 32px;">
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
		  </div>
		  <div class="mdl-card__actions mdl-card--border">
		     <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">SUBMIT</button>
		  </div>
		</div>
		</form>
	</div>
</div>

<jsp:include page="/includes/footer.jsp" />