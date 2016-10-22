package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.Shelter;

public class DBShelter {
	
	
	public static void newShelter(Shelter shelter) {
		try {
			Connection conn = DBConnector.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO shelter VALUES(0,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, shelter.getName());
			ps.setString(2, shelter.getComments());
			ps.setInt(3, shelter.getTotalBeds());
			ps.setInt(4, shelter.getTotalBeds()); //Avail beds
			ps.setDouble(5, shelter.getLat());
			ps.setDouble(6, shelter.getLon());
			ps.setString(7, shelter.getCity());
			ps.setString(8,shelter.getState());
			ps.setInt(9, shelter.getZip());
			ps.setString(10, shelter.getAddress());
			
			ps.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/** Update the number of available beds in a shelter */
	public static void updateCount(int id, int bedCount) {
		try {
			PreparedStatement ps = DBConnector.getConnection().prepareStatement(
					"UPDATE shelter SET availBeds=? WHERE id=?");
		
		
			ps.setInt(1, bedCount);
			ps.setInt(2, id);
			
			ps.executeQuery();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(DBConnector.getConnection().prepareStatement(""));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
