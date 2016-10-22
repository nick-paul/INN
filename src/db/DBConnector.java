package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * A Class used for establishing a connection to the database.
 * @author npaul
 *
 */
public class DBConnector {
	private static Connection currentConnection = null; //Current database connection

	/** SQL Database driver */
	public final static String DB_Driver = "org.gjt.mm.mysql.Driver";
	
	/** Database name */
	public final static String DB_NAME = "robofestnet";
    
	/** Database URL */
	public final static String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
	
	/** Username for accessing database */
    private final static String USERNAME = "root";
    
    /** Password for accessing database */
    private final static String PASS = "Cassie8876";

	/**
	 * Check if the <code>currentConnection</code> is null. If so, create a new connection and
	 * assign it to <code>currentConnection</code>. Return <code>currentConnection</code>.
	 * This method should only be used within the <code>database</code> package.
	 * 
	 */
     protected static Connection getConnection(){
        if (currentConnection == null) {
        	try{
	        	Class.forName("com.mysql.jdbc.Driver");
	            currentConnection =  DriverManager.getConnection(DB_URL, USERNAME, PASS);
	        }catch(SQLException e){
	            e.printStackTrace();
	            System.out.println("SQLException: " + e.getMessage());
	            System.out.println("SQLState: " + e.getSQLState());
	            System.out.println("VendorError: " + e.getErrorCode());
	        }catch(ClassNotFoundException e) {
	            e.printStackTrace();
	        } 
        } 
        
        return currentConnection;
    }
     public static void main(String[] args) {
    	 getConnection();
    	 System.out.println("hello world!");
     }
}
