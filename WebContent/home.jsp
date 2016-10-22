<%@ page import ="beans.Shelter" %>
<%@ page import ="java.util.ArrayList" %>

<% String contextPath = request.getContextPath(); %>
<% ArrayList<Shelter> shelters = (ArrayList<Shelter>)request.getAttribute("shelterList"); %>
<% System.out.println("data: " + shelters); %>

<jsp:include page="/includes/header.jsp" />
<style>
#map {
height: 400px;
width: 100%;
background-color: grey;
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
    <script>
		function getDistanceMiles(latLng1, latLng2) {
			var dLat = (latLng2.lat - latLng1.lat) * (Math.PI / 180);
			var dLon = (latLng2.lng - latLng1.lng) * (Math.PI / 180);
			
			var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
				Math.cos(latLng1.lat * (Math.PI / 180)) * Math.cos(latLng2.lat * (Math.PI / 180)) * 
				Math.sin(dLon / 2) * Math.sin(dLon / 2); 
			
			var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); 
			
			return 3959.0 * c;
		}
    	
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
			
		    var map = new google.maps.Map($('#map')[0], {
				zoom: 7,
				center: location
			});
		    
		    if (position) {
		    	var marker = new google.maps.Marker({
					position: location,
					map: map
				});
		    	
		    	$('#shelterList > option').each(function() {
		    		var distance = getDistanceMiles(
		    			location,
		    			{
							lat: this.data('lat'),
							lng: this.data('lng')
						}
		    		);
		    		this.text(this.data('name') + ', ' + distance + ' miles away');
		    	});
		    }
			
			var shelterMarkers = [];
			
			<% if (shelters != null) for(Shelter shelter : shelters) { %>
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
			
			var input = $('#pac-input')[0];
	        var searchBox = new google.maps.places.SearchBox(input);
	        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	        map.addListener('bounds_changed', function() {
	        	searchBox.setBounds(map.getBounds());
	        });

	        var markers = [];

	        searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();

	          if (places.length == 0) {
	            return;
	          }

	          markers.forEach(function(marker) {
	            marker.setMap(null);
	          });
	          markers = [];

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
     	
		<input type="hidden" name="latitude"> <input type="hidden" name="longitude">
	
		<select id="shelterList" name="shelter" size="5">
			<% if (shelters != null) for(Shelter shelter : shelters) { %>
			<option value="<%= shelter.getID() %>" data-name="<%= shelter.getName() %>" data-lat="<%= shelter.getLat() %>" data-lng="<%= shelter.getLon() %>"><%= shelter.getName() %></option>
			<% } %>
		</select>
		
		<input type="text" name="firstName" placeholder="First name"> <input type="text" name="lastName" placeholder="Last name"><br>
		<br>
		
		<input type="tel" name="phoneNumber" placeholder="Phone number"><br>
		<br>
		
		<input type="number" name="age" placeholder="Age"><br>
		<br>
		
		Number of beds: <select name="numberOfBeds">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
		</select><br>
		<br>
		
		<input type="submit" value="Get bed">
	</form>
</p>
        
<jsp:include page="/includes/footer.jsp" />
 
 