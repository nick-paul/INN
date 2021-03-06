<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<jsp:include page="/includes/header.jsp" />

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

<div id="heading">
	<div id="nestedHeading">
		<h2>Register a New Shelter</h2>
	</div>
</div>
<div id="content">
	<div id="nestedContent">
	<form action="<%= contextPath %>/ShelterServlet?command=newShelter" method="POST">
		<div class="mdl-card mdl-shadow--2dp" style="width: 100%; min-height: 0;">
		<div class="mdl-card__supporting-text" style="padding: 32px;">
		  <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="name">
		    <label class="mdl-textfield__label" >Shelter Name</label>
		 </div>
		 <br />


     	<div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="comments">
		    <label class="mdl-textfield__label" >Comments</label>
		 </div>
		 <br />

   		  <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="number" name="totalBeds">
		    <label class="mdl-textfield__label" >Total # Of Beds</label>
		 </div>
		 <br />
		 <br />

		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="lat">
		    <label class="mdl-textfield__label" >Latitude</label>
		 </div>
		 &nbsp;&nbsp;&nbsp;
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="long">
		    <label class="mdl-textfield__label" >Longitude</label>
		 </div>
		 <br />
		 <br />
		 
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="address">
		    <label class="mdl-textfield__label" >Address</label>
		 </div>
		<br />
    	
  		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="city">
		    <label class="mdl-textfield__label" >City</label>
		 </div>
		&nbsp;&nbsp;&nbsp;
	    	<select name="state">
	    	      <option value="" disabled selected>Select a State</option>
				<option value="AL">Alabama</option>
				<option value="AK">Alaska</option>
				<option value="AZ">Arizona</option>
				<option value="AR">Arkansas</option>
				<option value="CA">California</option>
				<option value="CO">Colorado</option>
				<option value="CT">Connecticut</option>
				<option value="DE">Delaware</option>
				<option value="DC">District Of Columbia</option>
				<option value="FL">Florida</option>
				<option value="GA">Georgia</option>
				<option value="HI">Hawaii</option>
				<option value="ID">Idaho</option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana</option>
				<option value="IA">Iowa</option>
				<option value="KS">Kansas</option>
				<option value="KY">Kentucky</option>
				<option value="LA">Louisiana</option>
				<option value="ME">Maine</option>
				<option value="MD">Maryland</option>
				<option value="MA">Massachusetts</option>
				<option value="MI">Michigan</option>
				<option value="MN">Minnesota</option>
				<option value="MS">Mississippi</option>
				<option value="MO">Missouri</option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska</option>
				<option value="NV">Nevada</option>
				<option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
				<option value="OR">Oregon</option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island</option>
				<option value="SC">South Carolina</option>
				<option value="SD">South Dakota</option>
				<option value="TN">Tennessee</option>
				<option value="TX">Texas</option>
				<option value="UT">Utah</option>
				<option value="VT">Vermont</option>
				<option value="VA">Virginia</option>
				<option value="WA">Washington</option>
				<option value="WV">West Virginia</option>
				<option value="WI">Wisconsin</option>
				<option value="WY">Wyoming</option>
			</select>
		&nbsp;&nbsp;&nbsp;
		<div class="mdl-textfield mdl-js-textfield" style="width:100px;">
  			<input class="mdl-textfield__input" type="number" name="zip">
		    <label class="mdl-textfield__label">Zip Code</label>
		 </div>
		 <br />
		 
		 <br />
		 
		 
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="phoneNumber">
		    <label class="mdl-textfield__label" >Phone Number</label>
		 </div>
		 <br />
		 
		 <div class="mdl-textfield mdl-js-textfield">
  			<input class="mdl-textfield__input" type="text" name="email">
		    <label class="mdl-textfield__label" >email@example.com</label>
		 </div>
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

