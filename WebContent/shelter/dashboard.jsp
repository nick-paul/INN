<%@page import="table.Table"%>
<%@page import="beans.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Shelter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/includes/header.jsp" />
<% ArrayList<Client> clientList=(ArrayList<Client>)request.getAttribute("clientList");
   String contextPath = request.getContextPath();
   Shelter shelter = (Shelter)request.getAttribute("shelter");

	double ratioShelter = 1 -(double)shelter.getAvailableBeds() / (double)shelter.getTotalBeds();
	double percent = ratioShelter * 100;
	
	String color = "";
	if (percent < 33) {
		color = "green";
	} else if (percent < 70) {
		color = "orange";
	} else {
		color = "red";
	}
%>



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
	}
		.meter { 
			height: 20px;  /* Can be anything */
			position: relative;
			margin: 20px 0 20px 0; /* Just for demo spacing */
			background: #555;
			-moz-border-radius: 25px;
			-webkit-border-radius: 25px;
			border-radius: 25px;
			padding: 10px;
			-webkit-box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);
			-moz-box-shadow   : inset 0 -1px 1px rgba(255,255,255,0.3);
			box-shadow        : inset 0 -1px 1px rgba(255,255,255,0.3);
		}
		.meter > span {
			display: block;
			height: 100%;
			   -webkit-border-top-right-radius: 8px;
			-webkit-border-bottom-right-radius: 8px;
			       -moz-border-radius-topright: 8px;
			    -moz-border-radius-bottomright: 8px;
			           border-top-right-radius: 8px;
			        border-bottom-right-radius: 8px;
			    -webkit-border-top-left-radius: 20px;
			 -webkit-border-bottom-left-radius: 20px;
			        -moz-border-radius-topleft: 20px;
			     -moz-border-radius-bottomleft: 20px;
			            border-top-left-radius: 20px;
			         border-bottom-left-radius: 20px;
			background-color: rgb(43,194,83);
			background-image: -webkit-gradient(
			  linear,
			  left bottom,
			  left top,
			  color-stop(0, rgb(43,194,83)),
			  color-stop(1, rgb(84,240,84))
			 );
			background-image: -moz-linear-gradient(
			  center bottom,
			  rgb(43,194,83) 37%,
			  rgb(84,240,84) 69%
			 );
			-webkit-box-shadow: 
			  inset 0 2px 9px  rgba(255,255,255,0.3),
			  inset 0 -2px 6px rgba(0,0,0,0.4);
			-moz-box-shadow: 
			  inset 0 2px 9px  rgba(255,255,255,0.3),
			  inset 0 -2px 6px rgba(0,0,0,0.4);
			box-shadow: 
			  inset 0 2px 9px  rgba(255,255,255,0.3),
			  inset 0 -2px 6px rgba(0,0,0,0.4);
			position: relative;
			overflow: hidden;
		}
		.meter > span:after, .animate > span > span {
			content: "";
			position: absolute;
			top: 0; left: 0; bottom: 0; right: 0;
			background-image: 
			   -webkit-gradient(linear, 0 0, 100% 100%, 
			      color-stop(.25, rgba(255, 255, 255, .2)), 
			      color-stop(.25, transparent), color-stop(.5, transparent), 
			      color-stop(.5, rgba(255, 255, 255, .2)), 
			      color-stop(.75, rgba(255, 255, 255, .2)), 
			      color-stop(.75, transparent), to(transparent)
			   );
			background-image: 
				-moz-linear-gradient(
				  -45deg, 
			      rgba(255, 255, 255, .2) 25%, 
			      transparent 25%, 
			      transparent 50%, 
			      rgba(255, 255, 255, .2) 50%, 
			      rgba(255, 255, 255, .2) 75%, 
			      transparent 75%, 
			      transparent
			   );
			z-index: 1;
			-webkit-background-size: 50px 50px;
			-moz-background-size: 50px 50px;
			-webkit-animation: move 2s linear infinite;
			   -webkit-border-top-right-radius: 8px;
			-webkit-border-bottom-right-radius: 8px;
			       -moz-border-radius-topright: 8px;
			    -moz-border-radius-bottomright: 8px;
			           border-top-right-radius: 8px;
			        border-bottom-right-radius: 8px;
			    -webkit-border-top-left-radius: 20px;
			 -webkit-border-bottom-left-radius: 20px;
			        -moz-border-radius-topleft: 20px;
			     -moz-border-radius-bottomleft: 20px;
			            border-top-left-radius: 20px;
			         border-bottom-left-radius: 20px;
			overflow: hidden;
		}
		
		.animate > span:after {
			display: none;
		}
		
		@-webkit-keyframes move {
		    0% {
		       background-position: 0 0;
		    }
		    100% {
		       background-position: 50px 50px;
		    }
		}
		
		.orange > span {
			background-color: #f1a165;
			background-image: -moz-linear-gradient(top, #f1a165, #f36d0a);
			background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0, #f1a165),color-stop(1, #f36d0a));
			background-image: -webkit-linear-gradient(#f1a165, #f36d0a); 
		}
		
		.red > span {
			background-color: #f0a3a3;
			background-image: -moz-linear-gradient(top, #f0a3a3, #f42323);
			background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0, #f0a3a3),color-stop(1, #f42323));
			background-image: -webkit-linear-gradient(#f0a3a3, #f42323);
		}
		
		.nostripes > span > span, .nostripes > span:after {
			-webkit-animation: none;
			background-image: none;
		}
	</style>
<div id="heading">
	<div id="nestedHeading">
		<h2><%= shelter.getName() %></h2>
	</div>
</div>
<div id="content">
	<div id="nestedContent">
		<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp" style="width: 100%;">
		  <thead>
		    <tr>
		      <th class="mdl-data-table__cell--non-numeric">Name</th>
		      <th>Gender</th>
		      <th>Age</th>
		      <th>Beds</th>
		      <th>Phone</th>
		      <th>&nbsp;</th>
		    </tr>
		  </thead>
			<tbody>
				<% if (clientList != null) for (Client c:clientList) { %>		
				<tr>
					<td><%= c.getFirstName() %> <%= c.getLastName() %></td>
					<td><%= c.getGender() %></td>
					<td><%= c.getAge() %></td>
					<td><%= c.getBeds() %></td>
					<td><%= c.getPhoneNumber() %></td>
					<td><a class="mdl-button mdl-js-button mdl-js-ripple-effect" href="<%= contextPath %>/ShelterServlet?command=clearClient&shelterID=<%= shelter.getID() %>&clientID=<%= c.getId() %>"><i class="material-icons">cancel</i></a></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		
		<form action="<%=request.getContextPath() %>/ShelterServlet?command=updateShelter" name="updateShelter" method="POST">
		<div class="mdl-card mdl-shadow--2dp" style="width: 100%; margin-top: 65px; min-height: 0;">
		  <div class="mdl-card__supporting-text">
		    You have <input type="number" name="availableBeds" value="<%= shelter.getAvailableBeds() %>" style="width: 60px;"/> / <%= shelter.getTotalBeds() %> beds remaining.
			<input type="hidden" name="Id" value="<%= shelter.getID() %>" />
				<div class="meter nostripes <%= color %> ">
				<span style="width: <%= percent %>%;">&nbsp;&nbsp;<%= shelter.getTotalBeds()-shelter.getAvailableBeds() %> / <%=shelter.getTotalBeds() %></span>
			</div>
		  </div>
		  <div class="mdl-card__actions mdl-card--border">
		     <button type="submit" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">UPDATE</button>
		  </div>
		</div>
		</form>
	</div>
	
</div>

<jsp:include page="/includes/footer.jsp" />
