package controllers;

import jakarta.servlet.ServletException;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;

import java.io.IOException;
import java.util.List;

import dao.AccountDAO;
import dao.AdminDAO;
import dao.AgentDAO;

/**
 * Servlet implementation class AdminDashboardServlet
 */
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Account> agents = AdminDAO.listAccounts();
		request.setAttribute("agents", agents);
		request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if("create".equals(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String role = "agent";
			
			if (username == null || username.trim().isEmpty() || 
				    password == null || password.trim().isEmpty() || 
				    email == null || email.trim().isEmpty()) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
				    return;
				}
			
			AdminDAO.createAgentAccount(new Account(username, password, email, role));
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		}else if("update".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String role = "agent";
			
			if (id <= 0 ||
					username == null || username.trim().isEmpty() || 
				    password == null || password.trim().isEmpty() || 
				    email == null || email.trim().isEmpty()) {
				    request.setAttribute("error", "All fields are required.");
				    request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
				    return;
				}
			AccountDAO.updateAccount(new Account(id, username, password, email, role));
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		}else if("delete".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			AccountDAO.deleteAccount(id);
			request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
		}
	}

}
