
<%@page import="db.DBShelter"%>
<%@ page import ="beans.Shelter" %>
<%@ page import ="java.util.ArrayList" %>
<% String contextPath = request.getContextPath(); %>

<jsp:include page="/includes/header.jsp" />


<h2>Shelters in Database:</h2>

<% ArrayList<Shelter> shelters = DBShelter.getAllShelters(); %>

<% for (Shelter s : shelters) { %>
	<p> <%= s.getName() %></p>
<% } %>

<jsp:include page="/includes/footer.jsp" />
 
 