package controllers;

import jakarta.servlet.ServletException;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Hotel;
import models.RoomType;

import java.io.IOException;
import java.util.List;

import dao.AgentDAO;
import dao.HotelDAO;
import dao.RoomTypeDAO;

/**
 * Servlet implementation class AgentDashboardServlet
 */
public class AgentDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgentDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("filterName");
		String city = request.getParameter("filterCity");
		String stars = request.getParameter("filterStars");
		List<Hotel> hotels = AgentDAO.getHotels(name, city, stars);
		List<RoomType>  rooms = AgentDAO.getRooms();
		request.setAttribute("hotels", hotels);
		request.setAttribute("rooms", rooms);
		request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if("addHotel".equals(action)) {
			String name = request.getParameter("name");
			String city = request.getParameter("city");
			int stars = Integer.parseInt(request.getParameter("stars"));
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			
			if (name == null || name.trim().isEmpty() || 
				    city == null || city.trim().isEmpty() || 
				    stars == 0 ||
				    description == null || description.trim().isEmpty() ||
				    image==null || image.trim().isEmpty()) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
				    return;
				}
			
			AgentDAO.manageHotel("add", new Hotel(name, city, stars, description, image));
			response.sendRedirect(request.getContextPath() + "/agent/dashboard");
		}else if("updateHotel".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String city = request.getParameter("city");
			int stars = Integer.parseInt(request.getParameter("stars"));
			String description = request.getParameter("description");
			String image = request.getParameter("image");
			
			if (name == null || name.trim().isEmpty() || 
				    city == null || city.trim().isEmpty() || 
				    stars == 0 ||
				    description == null || description.trim().isEmpty() ||
				    image==null || image.trim().isEmpty()) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
				    return;
				}
			
			AgentDAO.manageHotel("update", new Hotel(id, name, city, stars, description, image));
			response.sendRedirect(request.getContextPath() + "/agent/dashboard");
		}else if("deleteHotel".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			AgentDAO.manageHotel("delete", HotelDAO.getHotel(id));
			List<Hotel> hotels = HotelDAO.listHotels();
		    List<RoomType> rooms = AgentDAO.getRooms();

		   
		    request.setAttribute("hotels", hotels);
		    request.setAttribute("rooms", rooms);
			request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
		}
		
		if("addRoom".equals(action)) {
			String label = request.getParameter("label");
			int capacity = Integer.parseInt(request.getParameter("capacity"));
			int price = Integer.parseInt(request.getParameter("price"));
			int hotelId = Integer.parseInt(request.getParameter("hotelId"));
			
			if (label == null || label.trim().isEmpty() || 
				    capacity == 0 || price == 0 || hotelId == 0) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
				    return;
				}
			
			AgentDAO.manageRoomTypes("add", new RoomType(label, capacity, price, hotelId));
			response.sendRedirect(request.getContextPath() + "/agent/dashboard");
		}else if("updateRoom".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			String label = request.getParameter("label");
			int capacity = Integer.parseInt(request.getParameter("capacity"));
			int price = Integer.parseInt(request.getParameter("price"));
			int hotelId = Integer.parseInt(request.getParameter("hotelId"));
			
			if (label == null || label.trim().isEmpty() || 
				    capacity == 0 || price == 0 || hotelId == 0) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
				    return;
				}
			
			AgentDAO.manageRoomTypes("update", new RoomType(id, label, capacity, price, hotelId));
			response.sendRedirect(request.getContextPath() + "/agent/dashboard");
		}else if("deleteRoom".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			AgentDAO.manageRoomTypes("delete", RoomTypeDAO.getRoom(id));
			List<Hotel> hotels = HotelDAO.listHotels();
		    List<RoomType> rooms = AgentDAO.getRooms();

		   
		    request.setAttribute("hotels", hotels);
		    request.setAttribute("rooms", rooms);
			request.getRequestDispatcher("/agent/dashboard.jsp").forward(request, response);
		}
		
	}

}
