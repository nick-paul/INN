<%@page import="table.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Shelter"%>
<jsp:include page="/includes/header.jsp" />

<% ArrayList<Shelter> shelters = (ArrayList<Shelter>)request.getAttribute("shelterList"); %>

<style>
@charset "utf-8";
/* CSS Document */

h1{
  margin: 0 auto;
  padding-top: 20%;
  padding-left: 15%;
  text-transform:uppercase;
	font-size:30px;
	color:white;
}


h2{
	margin: 0 auto;
	padding-left: 15%;
	font-size:18px;
	color:#fff;
}


body {
	font-family: Helvetica;
	margin:0 auto;
  min-height:100%;
  margin-top: -14%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
	}

.nav {
	
	margin: 0 auto;
	margin-top: 15px;
	margin-left: 15%;
	width: 300px;
	height: 300px;
	background: #fff;
	border-radius: 5px; 
	text-align: center;
	padding-top: 1px;
	box-shadow: 0 0 10px rgba(0,0,0, .5);
  
}

.username {
	border: 1px solid #a6a6a6;
	width: 230px;
	height: 40px;
	border-radius: 3px;
	margin-top: 25px;
	padding-left: 9px;
	color: #6c6c6c;
	background: #fcfcfc;
	outline: none;
}

.password {
	border: 1px solid #a6a6a6;
	width: 230px;
	height: 40px;
	border-radius: 3px;
	margin-top: 5px;
  margin-right: 3px;
	padding-left: 9px;
	color: #6c6c6c;
	background: #fcfcfc;
	outline: none;
}

.password:hover, .username:hover {
	box-shadow: 0 0 10px rgba(178,34,34, 1); 
	border: 1px #b22222	 solid ;
}

.password:focus, .username:focus, .button:focus, .button:hover:focus{
	box-shadow: 0 0 10px rgba(178,34,34, 1); 
	border: 1px #b22222	 solid ;
}

.button {
  color:#fff;
  font-size:20px;
	border: 1px solid #a6a6a6;
	width: 243px;
	height: 43px;
	border-radius: 5px;
	margin-top: 5px;
	margin-right: 6px;
	outline: none;
  background: rgb(255,48,25); /* Old browsers */
  background: -moz-linear-gradient(top,  rgb(255,48,25) 0%, rgb(207,4,4) 100%); /* FF3.6+ */
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgb(255,48,25)), color-stop(100%,rgb(207,4,4))); /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top,  rgb(255,48,25) 0%,rgb(207,4,4) 100%); /* Chrome10+,Safari5.1+ */
  background: -o-linear-gradient(top,  rgb(255,48,25) 0%,rgb(207,4,4) 100%); /* Opera 11.10+ */
  background: -ms-linear-gradient(top,  rgb(255,48,25) 0%,rgb(207,4,4) 100%); /* IE10+ */
  background: linear-gradient(to bottom,  rgb(255,48,25) 0%,rgb(207,4,4) 100%); /* W3C */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff3019', endColorstr='#cf0404',GradientType=0 ); /* IE6-9 */
}

  
.button:hover{
    background: rgb(204,0,0); /* Old browsers */
  background: -moz-linear-gradient(top,  rgb(204,0,0) 0%, rgb(204,0,0) 100%); /* FF3.6+ */
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgb(204,0,0)), color-stop(100%,rgb(204,0,0))); /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top,  rgb(204,0,0) 0%,rgb(204,0,0) 100%); /* Chrome10+,Safari5.1+ */
  background: -o-linear-gradient(top,  rgb(204,0,0) 0%,rgb(204,0,0) 100%); /* Opera 11.10+ */
  background: -ms-linear-gradient(top,  rgb(204,0,0) 0%,rgb(204,0,0) 100%); /* IE10+ */
  background: linear-gradient(to bottom,  rgb(204,0,0) 0%,rgb(204,0,0) 100%); /* W3C */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cc0000', endColorstr='#cc0000',GradientType=0 ); /* IE6-9 */
}
  
label {
  position: relative;
  top: 5px;
  margin-right: 115px;
}
label span {
  margin-left: 5px;
  font-size:14px;
}

	


</style>

<table style="height:100%; width:100%; position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
	<tr align="center" >
		<td>
			<div class="nav">
				<form action="<%=request.getContextPath() %>/ShelterServlet?command=viewDashboard" name="loginForm" method="POST">
				<p>Select your shelter</p>
				<select class="username" name="shelterID">
				<% for (Shelter s : shelters)  {%>
					<option value="<%=s.getID()%>"><%=s.getName() %>
				<% } %>
				</select>
				<p>Enter password</p>
				<input type="password" name="password" class="password"/> 
				<hr />
				<button type="submit" class="button">Login</button>
				</form>
			</div>
		</td>
	</tr>
</table>

<jsp:include page="/includes/footer.jsp" />