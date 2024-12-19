package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Booking;
import models.Hotel;

public class VisitorDAO {
	
	public static List<Hotel> searchHotels(String city, Integer stars, String roomtype, Integer minPrice, Integer maxPrice) {
	    List<Hotel> hotels = new ArrayList<>();
	    StringBuilder q = new StringBuilder(
	        "SELECT h.*, rt.label AS roomtype, rt.price AS price " +
	        "FROM hotel h, roomtype rt " +
	        "WHERE 1 = 1"
	    );
	    
	    if(city != null && !city.isEmpty()) {
	    	q.append(" AND h.city like ?");
	    }

	    if (stars != null) {
	        q.append(" AND h.stars = ?");
	    }
	    if (roomtype != null && !roomtype.isEmpty()) {
	        q.append(" AND rt.label LIKE ?");
	    }
	    if (minPrice != null) {
	        q.append(" AND rt.price >= ?");
	    }
	    if (maxPrice != null) {
	        q.append(" AND rt.price <= ?");
	    }

	    Connection conn = SingletonConnection.getInstance();

	    try (PreparedStatement ps = conn.prepareStatement(q.toString())) {
	        int index = 0;
	        if(city != null && !city.isEmpty()) {
	        	ps.setString(index++, "%" + city + "%");
	        }

	        if (stars != null) {
	            ps.setInt(index++, stars);
	        }
	        if (roomtype != null && !roomtype.isEmpty()) {
	            ps.setString(index++, "%" + roomtype + "%");
	        }
	        if (minPrice != null) {
	            ps.setInt(index++, minPrice);
	        }
	        if (maxPrice != null) {
	            ps.setInt(index++, maxPrice);
	        }

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String name = rs.getString("name");
	                String cityResult = rs.getString("city");
	                int starRating = rs.getInt("stars");
	                String description = rs.getString("description");
	                String image = rs.getString("image");

	                // Optionally retrieve roomtype and price if needed:
	                String roomTypeResult = rs.getString("roomtype");
	                int price = rs.getInt("price");

	                // Assuming Hotel class has a constructor for these fields.
	                hotels.add(new Hotel(id, name, cityResult, starRating, description, image, roomTypeResult, price));
	            }
	        }
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    System.out.println("filtered hotels : "+hotels);
	    return hotels;
	}

	
	public static int countVisitors() {
		int visitors=0;
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select count(*) from booking");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				visitors=rs.getInt(1);
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return visitors;
	}
	
	public static void booking(Booking booking) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("insert into booking(name, email, checkin, checkout, num_adults, num_children, hotelId, roomId) values (?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, booking.getName());
			ps.setString(2, booking.getEmail());
			ps.setDate(3, booking.getCheckin());
			ps.setDate(4, booking.getCheckout());
			ps.setInt(5, booking.getNum_adults());
			ps.setInt(6, booking.getNum_children());
			ps.setInt(7, booking.getHotelId());
			ps.setInt(8, booking.getRoomId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
