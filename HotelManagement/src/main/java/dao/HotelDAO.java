package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Hotel;

public class HotelDAO {
	
	public static Hotel getHotel(int idHotel) {
		Hotel hotel = null;
	    Connection conn=SingletonConnection.getInstance();
    	try {
    	    PreparedStatement ps;
    		ps = conn.prepareStatement("select * from hotel where id=?");
    		ps.setInt(1, idHotel);
    	    ResultSet rs=ps.executeQuery();
	        if (rs.next()) {
	        	int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String city = rs.getString("city");
	            int stars = rs.getInt("stars");
	            String description = rs.getString("description");
	            String image = rs.getString("image");
	            hotel = new Hotel(id, name, city, stars, description, image);
	        }
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return hotel;
	}
	
	public static List<Hotel> listHotels(){
		List<Hotel> hotels = new ArrayList<>();
		Connection conn=SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select * from hotel");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String city = rs.getString("city");
	            int stars = rs.getInt("stars");
	            String description = rs.getString("description");
	            String image = rs.getString("image");
	            hotels.add(new Hotel(id, name, city, stars, description, image));
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return hotels;
	}
	
	public static void addHotel(Hotel hotel) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("insert into hotel(name, city, stars, description, image) values (?, ?, ?, ?, ?)");
			ps.setString(1, hotel.getName());
			ps.setString(2, hotel.getCity());
			ps.setInt(3, hotel.getStars());
			ps.setString(4, hotel.getDescription());
			ps.setString(5, hotel.getImage());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateHotel(Hotel hotel) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("update hotel set name=?, city=?, stars=?, description=?, image=? where id=?");
			ps.setString(1, hotel.getName());
			ps.setString(2, hotel.getCity());
			ps.setInt(3, hotel.getStars());
			ps.setString(4, hotel.getDescription());
			ps.setString(5, hotel.getImage());
			ps.setInt(6, hotel.getId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteHotel(int idHotel) {
		Connection conn=SingletonConnection.getInstance();
    	try {
    		PreparedStatement ps;
    		ps=conn.prepareStatement("delete from hotel where id=?");
    		ps.setInt(1, idHotel);
    		ps.executeUpdate();
    		ps.close();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
	}
	

}
