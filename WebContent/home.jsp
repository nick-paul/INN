<%@ page import ="beans.Shelter" %>
<%@ page import ="java.util.ArrayList" %>

<% String contextPath = request.getContextPath(); %>
<% ArrayList<Shelter> shelters = (ArrayList<Shelter>)request.getAttribute("shelterList"); %>
<%
	Shelter shelterx = new Shelter();
	// 0,'Gateway 180', 'Largest 24-Hour Emergency Housing In Missouri', 300, 300, 38.637569, -90.204685, 'St. Louis', 'Missuori', 63106, '1000 19th St', '123456', 'email@domain.com'
	shelterx.setID(0);
	shelterx.setName("Gateway 180x");
	shelterx.setComments("World's hargest hackathon");
	shelterx.setTotalBeds(15);
	shelterx.setAvailableBeds(14);
	shelterx.setLat(38.637569);
	shelterx.setLon(-90.204685);
	shelterx.setCity("St. Louis");
	shelterx.setState("Missouri");
	shelterx.setZip(21501);
	shelterx.setAddress("123 Fake St");
	shelterx.setPhoneNumber("1234567890");
	shelterx.setEmail("a@a.a");
	shelters.add(shelterx);
%>
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
    	var map;
    	
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
		
			map = new google.maps.Map($('#map')[0], {
				center: {lat: 38.6270, lng: -90.1994},
				zoom: 7
			});
			
			var shelterMarkers = [];
			
			<% if (shelters != null) for(Shelter shelter : shelters) { %>
			shelterMarkers.push(
				new google.maps.Marker({
					position: {
						lat: <%= shelter.getLat() %>,
						lng: <%= shelter.getLon() %>
					},
					label: 'S',
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

	        var marker;

	        searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();

	          if (places.length == 0) {
	            return;
	          }
	          
	          if (marker) {
	        	  marker.setMap(null);
	          }

	          var bounds = new google.maps.LatLngBounds();
	          
	          var place = places[0];
	          if (!place.geometry) {
	              return;
	            }
	            var icon = {
	              url: place.icon,
	              size: new google.maps.Size(71, 71),
	              origin: new google.maps.Point(0, 0),
	              anchor: new google.maps.Point(17, 34),
	              scaledSize: new google.maps.Size(25, 25)
	            };

	          showPosition({
				coords: {
	        	  latitude: place.geometry.location.lat(),
	        	  longitude: place.geometry.location.lng()
	          	}
	          });
			});
			
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
		
		function showPosition(position, isShelter) {
			var location = position ? {lat: parseFloat(position.coords.latitude), lng: parseFloat(position.coords.longitude)} : {lat: 38.6270, lng: -90.1994};
		    if (position) {
		    	var marker = new google.maps.Marker({
					position: location,
					map: map
				});
		    	
		    	$('#shelterID > option').each(function() {
		    		var distance = getDistanceMiles(
		    			location,
		    			{
							lat: $(this).data('lat'),
							lng: $(this).data('lng')
						}
		    		);
		    		$(this).text($(this).data('name') + ', ' + Math.round(distance) + ' miles away, ' + $(this).data('beds') + ' beds available');
		    	});
		    }
			
			map.panTo(location);
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
	<form action="<%= contextPath %>/ClientServlet?command=getClientInfo" method="POST">
     	
		<input type="hidden" name="lat"> <input type="hidden" name="lon">
	
		<select id="shelterID" name="shelter" size="5">
			<% if (shelters != null) for(Shelter shelter : shelters) { %>
			<option value="<%= shelter.getID() %>" data-name="<%= shelter.getName() %>" data-beds="<%= shelter.getAvailableBeds() %>" data-lat="<%= shelter.getLat() %>" data-lng="<%= shelter.getLon() %>"><%= shelter.getName() %></option>
			<% } %>
		</select>
		
		<input type="submit" value="Get bed">
	</form>
</p>
        
<jsp:include page="/includes/footer.jsp" />
 
 