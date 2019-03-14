package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;

import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.Bill;
import model.Product;
import model.Users;
import tools.MD5;

public class UsersDAO {

	// kiem tra email ton tai chua
	public boolean checkEmail(String email) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM users WHERE user_email = '" + email + "'";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				connection.close();
				return true;
			}
		} catch (SQLException e) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
		}

		return false;

	}

	// phuong thuc them tai khoan
	public boolean insertUser(Users u) throws SQLException {
		System.out.println(u.getUserEmail());
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO `shop`.`users` (`user_name`, `user_phone`, `user_address`, `user_email`, `user_pass`, `user_birth`, `user_sex`, `user_role`)"
        		+ " VALUES (?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getUserPhone());
            ps.setString(3, u.getUserAddress());
            ps.setString(4, u.getUserEmail());
            ps.setString(5, u.getUserPass());
            ps.setString(6, u.getUserBirth());
            ps.setString(7, u.getUserSex());
            ps.setBoolean(8, u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
	
	//update info user
	public boolean updateUserInfo(Users u) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE `shop`.`users` SET user_name =? ,user_phone = ?,user_address = ?,user_birth = ?,user_sex = ?"
        		+ " WHERE user_id = ?";
        try {
            PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getUserPhone());
            ps.setString(3, u.getUserAddress());
            ps.setString(4, u.getUserBirth());
            ps.setString(5, u.getUserSex());
            ps.setLong(6, u.getUserID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
	
	//update password user
		public boolean updateUserPass(String password,long user_id) throws SQLException {
	        Connection connection = DBConnect.getConnection();
	        String sql = "UPDATE `shop`.`users` SET user_pass =?  WHERE user_id = ?";
	        try {
	            PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
	            ps.setString(1, password);
	            ps.setLong(2, user_id);
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }
		
		//update Role
		public boolean updateUserRole(boolean userRole ,String userID) throws SQLException {
			        Connection connection = DBConnect.getConnection();
			        String sql = "UPDATE `shop`.`users` SET user_role =?  WHERE user_id = ?";
			        try {
			            PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			            ps.setBoolean(1, userRole);
			            ps.setString(2, userID);
			            ps.executeUpdate();
			            return true;
			        } catch (SQLException ex) {
			            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			        }
			        return false;
		}
		
		

	// kiem tra dang nhap
	 public Users login(String email, String password) throws SQLException {
	        Connection con = DBConnect.getConnection();
	        String sql = "select * from users where user_email='" + email + "' and user_pass='" + password + "'";
	        PreparedStatement ps;
	        try {
	            ps = (PreparedStatement) con.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                Users u = new Users();
	                u.setUserID(rs.getLong("user_id"));
	                u.setUserName(rs.getString("user_name"));
	                u.setUserPhone(rs.getString("user_phone"));
	                u.setUserAddress(rs.getString("user_address"));
	                u.setUserBirth(rs.getString("user_birth"));
	                u.setUserEmail(rs.getString("user_email"));
	                u.setUserPass(rs.getString("user_pass"));
	                u.setUserSex(rs.getString("user_sex"));
	                u.setUserRole(rs.getBoolean("user_role"));
	                con.close();
	                return u;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	 
	 public Users getUserByEmail(String UserEmail) throws SQLException {
		 Connection connection = DBConnect.getConnection();
		 String sql = "SELECT * FROM users WHERE user_email = ?";
		 PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		 ps.setString(1, UserEmail);
		 ResultSet rs = ps.executeQuery();
		 Users user = new Users();
		 while (rs.next()) {
			user.setUserID(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserAddress(rs.getString("user_address"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserBirth(rs.getString("user_birth"));
			user.setUserPass(rs.getString("user_pass"));
			user.setUserSex(rs.getString("user_sex"));
			user.setUserRole(rs.getBoolean("user_role"));
		}
		return user;
		 
	 }
	 
	 public Users getUserbyID(long user_id) throws SQLException {
		 Connection connection = DBConnect.getConnection();
		 String sql = "SELECT * FROM users WHERE user_id = ?";
		 PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		 ps.setLong(1, user_id);
		 ResultSet rs = ps.executeQuery();
		 Users user = new Users();
		 while (rs.next()) {
			user.setUserID(rs.getInt("user_id"));
			user.setUserName(rs.getString("user_name"));
			user.setUserAddress(rs.getString("user_address"));
			user.setUserPhone(rs.getString("user_phone"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserBirth(rs.getString("user_birth"));
			user.setUserPass(rs.getString("user_pass"));
			user.setUserSex(rs.getString("user_sex"));
			user.setUserRole(rs.getBoolean("user_role"));
		}
		return user;
		 
	 }
	 
	 public ArrayList<Users> getListUser() throws SQLException {

			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM users";
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<Users> list = new ArrayList<>();
			while (rs.next()) {
				Users user = new Users();
				user.setUserID(rs.getInt("user_id"));
				user.setUserName(rs.getString("user_name"));
				user.setUserAddress(rs.getString("user_address"));
				user.setUserPhone(rs.getString("user_phone"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserBirth(rs.getString("user_birth"));
				user.setUserPass(rs.getString("user_pass"));
				user.setUserSex(rs.getString("user_sex"));
				user.setUserRole(rs.getBoolean("user_role"));
				list.add(user);
			}
			return list;
		}
	 
	 public static void main(String[] args) throws SQLException {
//		 System.out.println(new java.util.Date().getTime());

//		 System.out.println(new UsersDAO().insertUser(new Users(new java.util.Date().getTime(),"nguyenhahaabcdè@gmail.com","11041998","nguyen pham van","0947060528","1998-04-11","thanh hoa","1",false)));
//		 for(Users u : new UsersDAO().getListUserByKeyWord_admin("pham van nguyen")) {
//			 System.out.println(u.getUserID()+" - "+u.getUserEmail());
//		 }
		 System.out.println(new UsersDAO().updateUserRole(false, "3"));

		}

}
