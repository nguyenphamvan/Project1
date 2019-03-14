package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.Category;

public class CategoryDAO {

	//lấy danh sách thể loại
	public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            category.setDescription(rs.getString("category_description"));
            list.add(category);
        }
        return list;
    }
	
	public Category getCategory(long category_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM category where category_id = ' "+category_id+" ' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		Category category = new Category();
		while(rs.next()) {
			category.setCategoryID(rs.getLong("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setDescription(rs.getString("category_description"));
		}
		return category;	
	}
	
	
	//them moi danh muc san pham
	public boolean insertCategory(Category c) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO category(category_name,category_description) values(?,?)";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setString(1, c.getCategoryName());
			ps.setString(2, c.getDescription());
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
		}
		return false;
	}
	
	//sua danh muc san pham
	public boolean updateCategory(Category c) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE category SET category_name = ?, category_description = ? WHERE category_id = ?";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setString(1, c.getCategoryName());
			ps.setString(2, c.getDescription());
			ps.setLong(3, c.getCategoryID());
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
	
	//xoa danh muc san pham
	public boolean deleteCategory(long category_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "DELETE FROM category WHERE category_id = ?";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(1, category_id);
			return ps.executeUpdate()==1;
		} catch (Exception e) {

		}
		
		return false;
	}
	
	public static void main(String[] args) throws SQLException {
		CategoryDAO dao = new CategoryDAO();
		dao.updateCategory(new Category(3,"OPPO","OPPO Electronics Corp. là nhà sản xuất thiết bị điện tử Trung Quốc, có trụ sở đặt tại Đông Hoản, Quảng Đông. OPPO cung cấp một số sản phẩm chính như máy nghe nhạc MP3, Tivi LCD, eBook, DVD/Blu-ray và điện thoại thông minh. Thành lập vào năm 2004, công ty đã đăng ký tên thương hiệu OPPO ở nhiều quốc gia trên thế giới."));
		System.out.println(dao.getCategory(1));
	}
	
	
	
	
}
