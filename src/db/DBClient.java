package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.Client;
import beans.Shelter;


public class DBClient {

	public static void newClient(Client client) {
		try {
			Connection conn = DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO client VALUES(0,?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, client.getRequestedShelterID());;
			ps.setString(2, client.getFirstName());
			ps.setString(3, client.getLastName());
			ps.setDouble(4, client.getLat());
			ps.setDouble(5, client.getLon());
			ps.setString(6, client.getPhoneNumber());
			ps.setInt(7, client.getEta());
			ps.setInt(8,  client.getBeds());
			ps.setInt(9, client.getAge());
			ps.setString(10, client.getGender());
			ps.setBoolean(11, client.isPending());
			
			ps.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static ArrayList<Client> getPendingClientsForShelter(int shelterID) {
		ArrayList<Client> clients = new ArrayList<Client>();

		try {
			PreparedStatement ps = DBConnector.getConnection().prepareStatement(
					"SELECT * FROM client WHERE requestedShelterID=?;");
			
			ps.setInt(1, shelterID);
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				clients.add(getClientBean(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return clients;
	}

	private static Client getClientBean(ResultSet rs) {
		Client client = new Client();	
		
		try {
			client.setId(rs.getInt("id"));
			client.setRequestedShelterID(rs.getInt("requestedShelterID"));
			client.setFirstName(rs.getString("firstName"));
			client.setLastName(rs.getString("lastName"));
			client.setLon(rs.getLong("lon"));
			client.setLat(rs.getLong("lat"));
			client.setPhoneNumber(rs.getString("phoneNumber"));
			client.setEta(rs.getInt("eta"));
			client.setBeds(rs.getInt("numBeds"));
			client.setAge(rs.getInt("age"));
			client.setGender(rs.getString("gender"));
			client.setPending(rs.getBoolean("pending"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return client;
	}
}
