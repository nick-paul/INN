<%@page import="table.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Shelter"%>
<jsp:include page="/includes/header.jsp" />

<% ArrayList<Shelter> shelters = (ArrayList<Shelter>)request.getAttribute("shelterList"); %>

<table style="height:100%; width:100%; position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
	<tr align="center" >
		<td>
			<form action="<%=request.getContextPath() %>/ShelterServlet?command=viewDashboard" name="loginForm" method="POST">
			<select name="shelterID">
			<% for (Shelter s : shelters)  {%>
				<option value="<%=s.getID()%>"><%=s.getName() %>
			<% } %>
			</select>
			<input type="hidden" name="form_submitted" value="true">
			<hr />
			<button type="submit" class="btn btn-primary">Login</button>
			</form>
		</td>
	</tr>
</table>

<jsp:include page="/includes/footer.jsp" />
