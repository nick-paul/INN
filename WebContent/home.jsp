<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String contextPath = request.getContextPath(); %>

<jsp:include page="/includes/header.jsp" />
<style>
      #map {
        height: 400px;
        width: 100%;
       }
    </style>

<p>
Request a bed.
</p>

<div id="map"></div>
    <script>
		function initMap() {
			
			if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(showPosition, showError);
		    } else {
		        console.log("Geolocation is not supported by this browser.");
		        showPositionDefault();
		    }
			
		}
		
		function getLocation() {
		    
		}
		
		function showPositionDefault() {
			var position = {
	        		coords: {
	        			latitude: 38.6270,
						longitude: -90.1994
	        		}
	        }
	        showPosition(position);
		}
		
		function showPosition(position) {
			console.log(position);
		    var map = new google.maps.Map(document.getElementById('map'), {
				zoom: 7,
				center: {lat: position.coords.latitude, lng: position.coords.longitude}
			});
			var marker = new google.maps.Marker({
				position: {lat: position.coords.latitude, lng: position.coords.longitude},
				map: map
			});
		}
		
		function showError(error) {
		    switch(error.code) {
		        case error.PERMISSION_DENIED:
		            console.log("User denied the request for Geolocation.");
		            showPositionDefault();
		            break;
		        case error.POSITION_UNAVAILABLE:
		            console.log("Location information is unavailable.");
		            showPositionDefault();
		            break;
		        case error.TIMEOUT:
		            console.log("The request to get user location timed out.");
		            showPositionDefault();
		            break;
		        case error.UNKNOWN_ERROR:
		            console.log("An unknown error occurred.");
		            showPositionDefault();
		            break;
		    }
		}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBsFbFzxam9hIy23IpUXvLgf4idAU10Wk&callback=initMap">
    </script>

<p>test</p>
<p>
	<form action="<%= contextPath %>/ShelterServlet?command=updateShelter" method="POST">
     	
     	<input type="hidden" name="shelter">

<!-- 		<input type="text" name="lat" placeholder="Latitude"> <input type="text" name="long" placeholder="Longitude"><br>
		<br>
    	<input type="text" name="address" placeholder="Address"><br>
    	<input type="text" name="city" placeholder="City"> <select name="state">
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
		</select> <input type="text" name="zip" placeholder="Zip"><br>
		<br> -->
	
		<input type="submit" value="Get bed">
	</form>
</p>
        
<jsp:include page="/includes/footer.jsp" />
 
 