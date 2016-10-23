<%@ page import ="beans.Shelter" %>
<%@ page import ="java.util.ArrayList" %>
<% String contextPath = request.getContextPath(); %>
<% ArrayList<Shelter> shelters = (ArrayList<Shelter>)request.getAttribute("shelterList"); %>
<jsp:include page="/includes/header.jsp" />

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.pink-red.min.css" />
<script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
<style>
html {
	margin: 0;
	padding: 0;
}
body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}
form {
	margin: 0;
	padding: 0;
}
#map {
    height: 100%;
    width: 100%;
    padding: 0;
}
#shelterID {
	width: 100%;
}
.formButton {
	margin-left: auto;
	margin-right: auto;
}
.selectionList {
	margin-top: 12px;
	width: 100%;
}
#sidebar {
	margin: 0;
	padding: 0;
	z-index: 1;
	position: absolute;
	width: 500px;
	margin-right: 12px;
}
#bottombar {
	margin-bottom: 12px;
	margin-right: 12px;
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
        text-overflow: ellipsis;
        width: 100%;
        padding-left: 12px;
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

<div id="sidebar">

	<input id="pac-input" class="controls" type="text" placeholder="Set Location">
	<table class="selectionList mdl-data-table mdl-js-data-table mdl-shadow--2dp" id="shelterTable">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">Shelter</th>
				<th>Distance</th>
				<th>Remaining</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
			<% if (shelters != null) for(Shelter shelter : shelters) { %>
			<tr data-id="<%= shelter.getID() %>" data-lat="<%= shelter.getLat() %>" data-lng="<%= shelter.getLon() %>">
			    <td class="mdl-data-table__cell--non-numeric"><%= shelter.getName() %></td>
			    <td id="distance_<%= shelter.getID() %>"></td>
			    <td><%= shelter.getAvailableBeds() %></td>
			    <td>
				    <form action="<%= contextPath %>/ClientServlet?command=getClientInfo" method="POST">
					    <input type="hidden" name="shelterID" value="<%= shelter.getID() %>">
					    <input type="hidden" name="lat" class="latitude" value="">
					    <input type="hidden" name="lon" class="longitude" value="">
					    <!-- <a class="mdl-button mdl-js-button mdl-js-ripple-effect"><i class="material-icons">phone</i></a> --><input type="submit" value="REQUEST" class="formButton mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
				    </form>
			    </td>
		  	</tr>
			<% } %>
		</tbody>
	</table>
</div>
<div id="bottombar">
	<a href="<%= contextPath %>/ShelterServlet?command=shelterLogin" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" id="loginButton">SHELTER LOGIN</a>
</div>
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
	        map.controls[google.maps.ControlPosition.TOP_RIGHT].push($('#sidebar')[0]);
	        map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push($('#bottombar')[0]);

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
		    	
		    	$('.latitude').each(function() {
		    		$(this).val(location.lat);
		    	});
		    	$('.longitude').each(function() {
					$(this).val(location.lng);
		    	});
		    	
		    	$('#shelterTable > tbody > tr').each(function() {
		    		var distance = getDistanceMiles(
		    			location,
		    			{
							lat: $(this).data('lat'),
							lng: $(this).data('lng')
						}
		    		);
		    		$('#distance_' + $(this).data('id')).text(Math.round(distance) + ' miles');
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
		
		$(function(){
			$('#shelterID').on('change', function() {
				$('#latitude').val($(this).find(':selected').data('lat'));
				$('#longitude').val($(this).find(':selected').data('lng'));
			});
		});
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBsFbFzxam9hIy23IpUXvLgf4idAU10Wk&callback=initMap&libraries=places"></script>
        
<jsp:include page="/includes/footer.jsp" />
 
 