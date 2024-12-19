package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import models.RoomType;

public class RoomTypeDAO {
	
	public static RoomType getRoom(int idRoom) {
		RoomType room = null;
	    Connection conn=SingletonConnection.getInstance();
    	try {
    	    PreparedStatement ps;
    		ps = conn.prepareStatement("select * from roomtype where id=?");
    		ps.setInt(1, idRoom);
    	    ResultSet rs=ps.executeQuery();
	        if (rs.next()) {
	        	int id = rs.getInt("id");
	            String label = rs.getString("label");
	            int capacity = rs.getInt("capacity");
	            int price = rs.getInt("price");
	            int hotelId = rs.getInt("hotelId");
	            room = new RoomType(id, label, capacity, price, hotelId);
	        }
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return room;
	}
	
	public static List<RoomType> listRooms(){
		List<RoomType> roomtypes = new ArrayList<>();
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select * from roomtype");
		    ResultSet rs = ps.executeQuery();
		    while(rs.next()) {
		    	roomtypes.add(new RoomType(
		    			rs.getInt("id"),
		    			rs.getString("label"),
		    			rs.getInt("capacity"),
		    			rs.getInt("price")
		    			));
		    }
		    ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return roomtypes;
	}
	
	public static void addRoomType(RoomType room) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("insert into roomtype(label, capacity, price, hotelId) values (?, ?, ?, ?)");
			ps.setString(1, room.getLabel());
			ps.setInt(2, room.getCapacity());
			ps.setInt(3, room.getPrice());
			ps.setInt(4, room.getHotelId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateRoomType(RoomType room) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("update roomtype set label=?, capacity=?, price=?, hotelId=? where id=?");
			ps.setString(1, room.getLabel());
			ps.setInt(2, room.getCapacity());
			ps.setInt(3, room.getPrice());
			ps.setInt(4, room.getHotelId());
			ps.setInt(5, room.getId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteRoomType(int idRoomType) {
		Connection conn=SingletonConnection.getInstance();
    	try {
    		PreparedStatement ps;
    		ps=conn.prepareStatement("delete from roomtype where id=?");
    		ps.setInt(1, idRoomType);
    		ps.executeUpdate();
    		ps.close();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
	}
	
	public static int countRooms() {
		int rooms=0;
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select count(*) from roomtype");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				rooms=rs.getInt(1);
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rooms;
	}

}
