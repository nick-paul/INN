<%@ page import ="beans.Shelter" %>
<%@ page import ="java.util.ArrayList" %>

<% String contextPath = request.getContextPath(); %>
<% ArrayList<Shelter> shelters = new ArrayList<Shelter>(); %>

<jsp:include page="/includes/header.jsp" />
<style>
#map {
height: 400px;
width: 100%;
}
.controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
</style>

<p>
Request a bed.
</p>

<input id="pac-input" class="controls" type="text" placeholder="Search Box">
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
		
		function showPositionDefault() {
	        showPosition(null);
		}
		
		function showPosition(position) {
			var location = position ? {lat: position.coords.latitude, lng: position.coords.longitude} : {lat: 38.6270, lng: -90.1994};
			
		    var map = new google.maps.Map(document.getElementById('map'), {
				zoom: 7,
				center: location
			});
		    
		    if (position) {
		    	var marker = new google.maps.Marker({
					position: location,
					map: map
				});
		    }
			
			var shelterMarkers = [];
			
			<% for(Shelter shelter : shelters) { %>
			shelterMarkers.push(
				new google.maps.Marker({
					position: {
							lat: <%= shelter.getLat() %>,
							lng: <%= shelter.getLon() %>
						},
					}
					map: map
				})
			);
			<% } %>
			
			var input = document.getElementById('pac-input');
	        var searchBox = new google.maps.places.SearchBox(input);
	        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	        // Bias the SearchBox results towards current map's viewport.
	        map.addListener('bounds_changed', function() {
	          searchBox.setBounds(map.getBounds());
	        });

	        var markers = [];
	        // Listen for the event fired when the user selects a prediction and retrieve
	        // more details for that place.
	        searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();

	          if (places.length == 0) {
	            return;
	          }

	          // Clear out the old markers.
	          markers.forEach(function(marker) {
	            marker.setMap(null);
	          });
	          markers = [];

	          // For each place, get the icon, name and location.
	          var bounds = new google.maps.LatLngBounds();
	          places.forEach(function(place) {
	            if (!place.geometry) {
	              console.log("Returned place contains no geometry");
	              return;
	            }
	            var icon = {
	              url: place.icon,
	              size: new google.maps.Size(71, 71),
	              origin: new google.maps.Point(0, 0),
	              anchor: new google.maps.Point(17, 34),
	              scaledSize: new google.maps.Size(25, 25)
	            };

	            // Create a marker for each place.
	            markers.push(new google.maps.Marker({
	              map: map,
	              icon: icon,
	              title: place.name,
	              position: place.geometry.location
	            }));

	            if (place.geometry.viewport) {
	              // Only geocodes have viewport.
	              bounds.union(place.geometry.viewport);
	            } else {
	              bounds.extend(place.geometry.location);
	            }
	          });
	          map.fitBounds(bounds);
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBsFbFzxam9hIy23IpUXvLgf4idAU10Wk&callback=initMap&libraries=places"></script>
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
 
 