package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import controllers.BasicController;

/**
 * Basic Servlet
 * 
 * Servlets are the first things that browsers contact when they access our server.
 * 	In our case, servlets will do nothing more than redirect the client to a new .jsp page
 *  All of the computational work will be done in the controllers (see controllers.BasicController)
 * 
 */
public class BasicServlet extends HttpServlet {
	
	/*
	 * 
	 * You can ignore these first few fields and methods, they are auto-generated
	 */
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasicServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        processRequest(request, response);   
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
        processRequest(request, response);
        return;
    }

    
    
    
    
    
    
    /*
     * The processRequest() method is were we will be doing the decision-making
     * 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{    	
    	
    	//First, we get the command that the client has sent to the server
    	String command = request.getParameter("command");
    	command = command == null ? "" : command;
    	
    	
    	//This is the jsp page that we will forward the user to after we have done 
    	// any computations that we need
    	String forwardToPage = "home.jsp";
    	    		
    	
    	//Based on the command, we will decide what to do
    	switch(command) {
    	case "nameForm":
    		//Controller methods always return the name of the .jsp page that it wants to
    		//  forward the user to when it is done
    		forwardToPage = BasicController.nameForm(request);
    		break;
    	case "colorForm":
    		forwardToPage = BasicController.colorForm(request);
    		break;
    	default:
    		//Default, return back to the home page
    		forwardToPage = "home.jsp";
    	}
    	
    	//Redirect the user
        if(!response.isCommitted()) {
            request.getRequestDispatcher(forwardToPage).forward(request, response);
        }
        
        return;
    }
}