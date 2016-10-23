package controllers;

import javax.servlet.http.HttpServletRequest;

import beans.Client;
import db.DBClient;


public class ClientController {

	public static int stringToInt(String INPUT)
	{
		try {
			return(Integer.parseInt(INPUT));
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	public static double stringToDouble(String INPUT)
	{
		try {
			return(Double.parseDouble(INPUT));
		} catch (NumberFormatException e) {
			return -1;
		}
		
	}
	
	public static String newClient(HttpServletRequest request)
	{
		Client client=new Client();
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		int requestedShelterId=stringToInt(request.getParameter("id"));
		double lat=stringToDouble(request.getParameter("lat"));
		double lon =stringToDouble(request.getParameter("lon"));
		String phoneNumber=request.getParameter("phoneNumber");
		int eta=stringToInt(request.getParameter("eta"));
		int beds=stringToInt(request.getParameter("beds"));
		int age=stringToInt(request.getParameter("age"));		
		String gender=request.getParameter("gender");		
		client.setFirstName(firstName);
		client.setLastName(lastName);
		client.setRequestedShelterID(requestedShelterId);
		client.setLat(lat);
		client.setLon(lon);
		client.setPhoneNumber(phoneNumber);
		client.setEta(eta);
		client.setBeds(beds);
		client.setAge(age);	
		client.setGender(gender);
		DBClient.newClient(client);
		return("client/newClient.jsp");		
	}
	public static String getClientInfo(HttpServletRequest request) {
		int id=stringToInt(request.getParameter("shelterID"));
		double lat=stringToDouble(request.getParameter("lat"));
		double lon=stringToDouble(request.getParameter("lon"));
		request.setAttribute("shelterID", id);
		request.setAttribute("lat",lat);
		request.setAttribute("lon", lon);
		return ("client/newClient.jsp");
	}
	
}
