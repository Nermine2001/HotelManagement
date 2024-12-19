package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Account;

public class AccountDAO {
	
	public static boolean addAccount(Account account) {
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
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static void updateAccount(Account account) {
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("update account set username=?, password=?, email=?, role=? where id=?");
			ps.setString(1, account.getUsername());
			ps.setString(2, account.getPassword());
			ps.setString(3, account.getEmail());
			ps.setString(4, account.getRole());
			ps.setInt(5, account.getId());
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteAccount(int idAccount) {
		Connection conn=SingletonConnection.getInstance();
    	try {
    		PreparedStatement ps;
    		ps=conn.prepareStatement("delete from account where id=?");
    		ps.setInt(1, idAccount);
    		ps.executeUpdate();
    		ps.close();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
	}
	
	
	
	public static Account login(String username, String password) {
		Connection conn = SingletonConnection.getInstance();
		Account account = null;
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select * from account where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				account = new Account();
                account.setId(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setRole(rs.getString("role"));
			}
			else {
				return null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return account;
	}
	
	public static int countStaff() {
		int staff=0;
		Connection conn = SingletonConnection.getInstance();
		try {
			PreparedStatement ps;
			ps = conn.prepareStatement("select count(*) from account");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				staff=rs.getInt(1);
			}
			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return staff;
	}

}
