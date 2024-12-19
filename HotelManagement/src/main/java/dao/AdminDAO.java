package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Account;

public class AdminDAO {
	
	public static List<Account> listAccounts() {
		List<Account> accounts = new ArrayList<>();
		Connection conn=SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select id, username, password, email, role from account where role=?");
			ps.setString(1, "agent");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
	            String username = rs.getString("username");
	            String password = rs.getString("password");
	            String email = rs.getString("email");
	            String role = rs.getString("role");
	            accounts.add(new Account(id, username, password, email, role));
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return accounts;
	}
	
	public static void createAgentAccount(Account account) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("insert into account (username, password, email, role) values (?, ?, ?, ?)");
			ps.setString(1, account.getUsername());
			ps.setString(2, account.getPassword());
			ps.setString(3, account.getEmail());
			ps.setString(4, account.getRole());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
