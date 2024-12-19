package controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Hotel;
import models.RoomType;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.AccountDAO;
import dao.HotelDAO;
import dao.RoomTypeDAO;
import dao.VisitorDAO;



public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rooms = RoomTypeDAO.countRooms();
		int visitors = VisitorDAO.countVisitors();
		int staff = AccountDAO.countStaff();
		List<RoomType> roomtypes = RoomTypeDAO.listRooms();
		List<Hotel> hotels = HotelDAO.listHotels();
		request.setAttribute("rooms", rooms);
		request.setAttribute("visitors", visitors);
		request.setAttribute("staff", staff);
		request.setAttribute("roomtypes", roomtypes);
		request.setAttribute("hotels", hotels);
		System.out.println("Hotels in doGet: " + hotels+" et "+rooms+visitors+staff+" RoomTypes: "+roomtypes);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String city = request.getParameter("city");
	    String stars = request.getParameter("stars");
	    String roomType = request.getParameter("roomtype");
	    String minPrice = request.getParameter("minPrice");
	    String maxPrice = request.getParameter("maxPrice");

	    
	    List<Hotel> hotels;

	    try {
	    	 
	        int starsInt = (stars != null && !stars.isEmpty() && !stars.equals("null")) ? Integer.parseInt(stars) : 0;
	        int minPriceInt = (minPrice != null && !minPrice.isEmpty()) ? Integer.parseInt(minPrice) : 0;
	        int maxPriceInt = (maxPrice != null && !maxPrice.isEmpty()) ? Integer.parseInt(maxPrice) : Integer.MAX_VALUE;

	        System.out.println("City: " + city);
	        System.out.println("Stars: " + stars);
	        System.out.println("Room Type: " + roomType);
	        System.out.println("Min Price: " + minPrice);
	        System.out.println("Max Price: " + maxPrice);

	        
	        if ((city == null || city.isEmpty()) &&
	            (starsInt == 0) &&
	            (roomType == null || roomType.isEmpty()) &&
	            (minPriceInt == 0) &&
	            (maxPriceInt == Integer.MAX_VALUE)) {
	            
	            hotels = HotelDAO.listHotels(); 
	        } else {
	            hotels = VisitorDAO.searchHotels(city, starsInt, roomType, minPriceInt, maxPriceInt);
	        }
	    } catch (Exception e) {
	    	request.setAttribute("error", "Erreur lors du chargement des hotels");
	        hotels = new ArrayList<>(); 
	        e.printStackTrace();
	    }

	    
	    request.setAttribute("hotels", hotels);
	    System.out.println("Hotels in doPost: " + hotels);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
