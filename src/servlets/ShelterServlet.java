package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ShelterController;

public class ShelterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShelterServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        processRequest(request, response);   
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
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
    	case "newShelter":
    		forwardToPage = ShelterController.newShelter(request);
    		break;
    	case "updateShelter":
    		forwardToPage = ShelterController.updateShelter(request);
    		break;
    	case "getAllShelters":
    		forwardToPage=ShelterController.getAllShelters(request);
    		break;
    	case "shelterLogin":
    		forwardToPage = ShelterController.getShelterLogin(request);
    		break;
    	case "viewDashboard":
    		forwardToPage = ShelterController.getViewDashBoard(request);
    		break;
    	case "clearClient":
  
    		forwardToPage = ShelterController.getClearClient(request);
    		break;
    	default:
    		//Default, return back to the home page
    		forwardToPage = "home.jsp";
    	}
    	
    	//Redirect the user
        if(!response.isCommitted()) 
        {
            request.getRequestDispatcher(forwardToPage).forward(request, response);
        }
        return;
    }
}

