package controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;

import java.io.IOException;

import dao.AccountDAO;

/**
 * Servlet implementation class AdminServlet
 */
public class AuthenticationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AuthenticationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password are required.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        if (role == null || role.isEmpty()) {
            // Login logic
            Account account = AccountDAO.login(username, password);
            if (account != null) {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("email", account.getEmail());
                if (account.getRole().equals("admin")) {
                    response.sendRedirect("admin/dashboard");
                } else if (account.getRole().equals("agent")) {
                    response.sendRedirect("agent/dashboard");
                } else {
                    request.setAttribute("error", "Invalid role.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Invalid credentials.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            // Registration logic
            if (!"admin".equals(role) && !"agent".equals(role)) {
                request.setAttribute("error", "Invalid role for registration.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }

            boolean isAdded = AccountDAO.addAccount(new Account(username, password, email, role));
            if (isAdded) {
                request.setAttribute("success", role + " account created successfully. Please log in.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Account already exists. Please log in.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }

}
