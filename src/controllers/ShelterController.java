package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import beans.Client;
import beans.Shelter;
import db.DBClient;
import db.DBShelter;

public class ShelterController
{
	public static int stringToInt(String INPUT)
	{
		return(Integer.parseInt(INPUT));
	}
	public static double stringToDouble(String INPUT)
	{
		return(Double.parseDouble(INPUT));
	}
	public static String newShelter(HttpServletRequest request) {
		int ID=0;
		String comments=request.getParameter("comments");
		String name=request.getParameter("name");
		int totalBeds=stringToInt(request.getParameter("totalBeds"));
		double lat=stringToDouble(request.getParameter("lat"));
		double lon=stringToDouble(request.getParameter("long"));
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		int zip=stringToInt(request.getParameter("zip"));
		String address=request.getParameter("address");
		String phoneNumber=request.getParameter("phoneNumber");
		String email=request.getParameter("email");
		//Sets private variables of shelter
		Shelter shelter=new Shelter();
		shelter.setID(ID);
		shelter.setComments(comments);
		shelter.setName(name);
		shelter.setTotalBeds(totalBeds);
		shelter.setLat(lat);
		shelter.setLon(lon);
		shelter.setCity(city);
		shelter.setState(state);
		shelter.setZip(zip);
		shelter.setAddress(address);
		shelter.setPhoneNumber(phoneNumber);
		shelter.setEmail(email);
		DBShelter.newShelter(shelter);
		return "shelter/newShelter.jsp";
	}

	public static String updateShelter(HttpServletRequest request) 
	{
		int Id=stringToInt(request.getParameter("Id"));
		int availableBeds=stringToInt(request.getParameter("availableBeds"));
		DBShelter.updateCount(Id,availableBeds);
		
		request.setAttribute("shelter", getShelter(Id));
		
		ArrayList<Client> clients=DBClient.getPendingClientsForShelter(Id);
		request.setAttribute("clientList", clients);
		request.setAttribute("shelterList", DBShelter.getAllShelters());
		
		return "shelter/dashboard.jsp";
	}
	public static String getAllShelters(HttpServletRequest request)
	{
		ArrayList<Shelter> allShelters=DBShelter.getAllShelters();
		request.setAttribute("shelterList",allShelters);
		return("home.jsp");
	}
	public static String getShelterLogin(HttpServletRequest request) {
		ArrayList<Shelter> shelters = DBShelter.getAllShelters();
		request.setAttribute("shelterList", shelters);
		return "shelter/login.jsp";
	}
	public static String getViewDashBoard(HttpServletRequest request) {
		String shelterID_str = request.getParameter("shelterID");
		int shelterID = stringToInt(shelterID_str);
		
		request.setAttribute("shelter", getShelter(shelterID));
		
		ArrayList<Client> clients=DBClient.getPendingClientsForShelter(shelterID);
		request.setAttribute("clientList",clients);
		request.setAttribute("shelterList", DBShelter.getAllShelters());
		
		return "shelter/dashboard.jsp";
	}
	public static String getClearClient(HttpServletRequest request) {
		System.out.println("getClearClient");
		
		String shelterID_str = request.getParameter("shelterID");
		String clientID_str = request.getParameter("clientID");
		
		int shelterID = stringToInt(shelterID_str);
		int clientID = stringToInt(clientID_str);
		
		DBShelter.clearClient(clientID);
		
		ArrayList<Client> clients=DBClient.getPendingClientsForShelter(shelterID);
		request.setAttribute("clientList",clients);
		request.setAttribute("shelter", getShelter(shelterID));
		request.setAttribute("shelterList", DBShelter.getAllShelters());
		
		return "shelter/dashboard.jsp";
	}
	
	public static Shelter getShelter(int shelterID) {

		//Yes I know this is horrible, but we are running low on time
		ArrayList<Shelter> shelters = DBShelter.getAllShelters();
		for (Shelter s : shelters) {
			if (s.getID() == shelterID) {
				return s;
			}
		}
		return null;
	}
}
