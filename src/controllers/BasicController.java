package controllers;

import java.awt.Color;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;


/*
 * 
 * Controllers will be doing all of the computational work. Controllers may call
 * methods in other class files, access data from the client and server and 
 * perform any calculations needed. They always return a string that describes
 * the path of the .jsp file that the user will be forwarded to
 * 
 * 
 */
public class BasicController {

	
	/*
	 * This is a basic controller example method. 
	 * This method will get the name from the form that the user submitted,
	 *   make it all uppercase, and then give it back to the client.
	 * It will also create a timestamp of when the request was processed.
	 */
	public static String nameForm(HttpServletRequest request) {
		
		//We can access our form information using the getParameter() method
		//In the file home.jsp, we named the text input "myName".
		String name = request.getParameter("myName");
		
		//Make the name all uppercase
		String lowerName = name.toLowerCase();
		
		//We can sent information to the jsp file using the setAttribute() method
		//We will call the name "helloName"
		request.setAttribute("helloName", LowerName);
		
		
		//We can also set attributes to be things other than strings
		request.setAttribute("processTime", new Date());
		
		//These values will be accessed in the sayHello.jsp file
		
		//Always return the path to the jsp file we want to take the user to
		return "hello/sayHello.jsp";
	}

	public static String colorForm(HttpServletRequest request) {
		String hexColor = request.getParameter("color");
		
		request.setAttribute("bgColor", "#"+hexColor);
		
		System.out.println(hexColor);
		
		return "home.jsp";
	}
	
}
