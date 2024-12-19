package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Account;
import models.Hotel;
import models.RoomType;

public class AgentDAO {
	
	public static Account getAgentById(int id) {
        Account agent = null;
        Connection conn = SingletonConnection.getInstance();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM account WHERE id = ?");
            ps.setInt(1, id);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                agent = new Account();
                agent.setId(resultSet.getInt("id"));
                agent.setUsername(resultSet.getString("username"));
                agent.setPassword(resultSet.getString("password"));
                agent.setEmail(resultSet.getString("email"));
                agent.setRole(resultSet.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return agent;
    }

	public static List<Hotel> getHotels(String name, String city, String stars) {
		List<Hotel> hotels = new ArrayList<>();
		StringBuilder q = new StringBuilder("select * from hotel where 1=1");

		if (name != null && !name.isEmpty()) {
			q.append(" and name like ?");
		}
		if (city != null && !city.isEmpty()) {
			q.append(" and city like ?");
		}
		if (stars != null && !stars.isEmpty()) {
			q.append(" and stars = ?");
		}
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement(q.toString());

			int indice = 1;

			if (name != null && !name.isEmpty()) {
				ps.setString(indice++, "%" + name + "%");
			}
			if (city != null && !city.isEmpty()) {
				ps.setString(indice++, "%" + city + "%");
			}
			if (stars != null && !stars.isEmpty()) {
				ps.setInt(indice++, Integer.parseInt(stars));
			}

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String n = rs.getString("name");
				String c = rs.getString("city");
				int s = rs.getInt("stars");
				String des = rs.getString("description");
				String im = rs.getString("image");
				hotels.add(new Hotel(id, n, c, s, des, im));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hotels;
	}
	
	public static List<RoomType> getRooms(){
		ArrayList<RoomType> rooms = new ArrayList<>();
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select * from roomtype");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				rooms.add(new RoomType(
						rs.getInt("id"),
						rs.getString("label"),
						rs.getInt("capacity"),
						rs.getInt("price"),
						rs.getInt("hotelId")
						));
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rooms;
	}

	public static void manageHotel(String action, Hotel hotel) {
		if (action == null || hotel == null) {
			System.out.println("Invalid action or hotel data");
			return;
		}

		switch (action) {
		case "add":
			HotelDAO.addHotel(hotel);
			break;
		case "update":
			HotelDAO.updateHotel(hotel);
			break;
		case "delete":
			HotelDAO.deleteHotel(hotel.getId());
			break;
		default:
			System.out.println("Unknown");
			break;
		}
	}
	
	public static void manageRoomTypes(String action, RoomType room) {
		if (action == null || room == null) {
			System.out.println("Invalid action or hotel data");
			return;
		}

		switch (action) {
		case "add":
			RoomTypeDAO.addRoomType(room);
			break;
		case "update":
			RoomTypeDAO.updateRoomType(room);
			break;
		case "delete":
			RoomTypeDAO.deleteRoomType(room.getId());
			break;
		default:
			System.out.println("Unknown");
			break;
		}
	}
	
	

}
