package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import beans.Shelter;
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
		return "shelter/updateShelter.jsp";
	}
	public static String getAllShelters(HttpServletRequest request)
	{
		ArrayList<Shelter> allShelters=DBShelter.getAllShelters();
		request.setAttribute("shelterList",allShelters);
		return("home.jsp");
	}
}
