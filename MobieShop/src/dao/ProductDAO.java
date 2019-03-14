package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.Product;

public class ProductDAO {
	
	public ArrayList<Product> getListProduct() throws SQLException {

		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM product";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setCategoryID(rs.getLong("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}
		return list;
	}

	public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {

		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE category_id = '" + category_id + "'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setCategoryID(rs.getLong("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}
		return list;
	}

	// hiển thị thông tin chi tiết sản phẩm
	public Product getProduct(long productID) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE product_id = '" + productID + "'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		Product product = new Product();
		while (rs.next()) {
			product.setProductID(rs.getLong("product_id"));
			product.setCategoryID(rs.getLong("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
		}
		return product;

	}

	public int countProductByCategory(long categoryID) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT count(product_id) FROM shop.product WHERE category_id = '" + categoryID + "'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt(1);
		}

		return count;
	}
	
	public int countProductByKeyword(String keyWord) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT count(product_id) FROM shop.product natural join shop.category "
				+ "WHERE (product_name LIKE '%"+keyWord+"%') OR (category_name LIKE '%"+keyWord+"%') OR (product_price LIKE '%"+keyWord+"%') ";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt(1);
		}

		return count;
	}

	public ArrayList<Product> getListProductByPage(long categoryID, int firstResult, int maxResult)
			throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM product WHERE category_id = ' " + categoryID + " ' limit ?,? ";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}

		return list;

	}

	public ArrayList<Product> getListProductByKeyWord(String keyWord, int firstResult, int maxResult) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM shop.product natural join shop.category \r\n" + "WHERE (product_name LIKE '%" + keyWord
				+ "%') OR (category_name LIKE '%" + keyWord + "%') OR (product_price LIKE '%" + keyWord + "%') limit ?,?";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}

		return list;

	}
	
	
	public ArrayList<Product> getListProductSame(long category_id, long product_id) throws SQLException {

		Connection connection = DBConnect.getConnection();
		String sql = "SELECT product_id, category_id, product_name,product_image1,product_image2,product_image3,hedieuhanh,camara,cpu,ram,rom,product_price,product_quantity, count(*) as soluong \r\n" + 
				"FROM product  \r\n" + 
				"WHERE category_id = '"+category_id+"' AND product_id != '"+product_id+"'  \r\n" +
				"group by product_name \r\n" + 
				"ORDER BY RAND() \r\n" +
				"limit 0,4;";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setCategoryID(rs.getLong("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}
		return list;
	}
	
	
	public ArrayList<Product> getListProductNews() throws SQLException {

		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM product ORDER BY product_id DESC LIMIT 0,8;";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}
		return list;
	}
	
	
	public ArrayList<Product> getListProductHot() throws SQLException {

		Connection connection = DBConnect.getConnection();
		String sql = "SELECT product_id, category_id, product_name,product_image1,product_image2,product_image3,hedieuhanh,camara,cpu,ram,rom,product_price,product_quantity, count(*) as soluong \r\n" + 
				"FROM bill_detail natural join product  \r\n" + 
				"group by product_name \r\n" + 
				"order by soluong DESC \r\n" +
				"limit 0,4;";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		while (rs.next()) {
			Product product = new Product();
			product.setProductID(rs.getLong("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductImage1(rs.getString("product_image1"));
			product.setProductImage2(rs.getString("product_image2"));
			product.setProductImage3(rs.getString("product_image3"));
			product.setHedieuhanh(rs.getString("hedieuhanh"));
			product.setCamara(rs.getString("camara"));
			product.setCpu(rs.getString("cpu"));
			product.setRam(rs.getString("ram"));
			product.setRom(rs.getString("rom"));
			product.setProductPrice(rs.getLong("product_price"));
			product.setQuantity(rs.getLong("product_quantity"));
			list.add(product);
		}
		return list;
	}
	
	
	//them san pham vao kho
	public boolean insertProduct(Product p) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO product(category_id,product_name,product_image1,product_image2,product_image3,hedieuhanh,camara,cpu,ram,rom,product_price,product_quantity) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?);";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(1, p.getCategoryID());
			ps.setString(2, p.getProductName());
			ps.setString(3, p.getProductImage1());
			ps.setString(4, p.getProductImage2());
			ps.setString(5, p.getProductImage3());
			ps.setString(6, p.getHedieuhanh());
			ps.setString(7, p.getCamara());
			ps.setString(8, p.getCpu());
			ps.setString(8, p.getRam());
			ps.setString(10, p.getRom());
			ps.setDouble(11, p.getProductPrice());
			ps.setLong(12, p.getQuantity());
			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean updateProduct(Product p) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE product SET category_id = ?,product_name = ?,product_image1 = ?,product_image2 = ?,product_image3 = ?,hedieuhanh = ?,camara = ?,cpu = ?,ram = ? ,rom = ? ,product_price = ?,product_quantity = product_quantity + ?\r\n" + 
				"WHERE product_id = ?;";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(1, p.getCategoryID());
			ps.setString(2, p.getProductName());
			ps.setString(3, p.getProductImage1());
			ps.setString(4, p.getProductImage2());
			ps.setString(5, p.getProductImage3());
			ps.setString(6, p.getHedieuhanh());
			ps.setString(7, p.getCamara());
			ps.setString(8, p.getCpu());
			ps.setString(9, p.getRam());
			ps.setString(10, p.getRom());
			ps.setDouble(11, p.getProductPrice());
			ps.setLong(12, p.getQuantity());
			ps.setLong(13, p.getProductID());
			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean updateQuantityProduct(long product_id, long quantity) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE product SET quantity = quantity - ? "
				+ "WHERE product_id = ?;";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(2, product_id);
			ps.setLong(1, quantity);
			
			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean deleteProduct(long product_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "DELETE FROM product WHERE product_id = ?";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setLong(1, product_id);
			return ps.executeUpdate()==1;
		} catch (Exception e) {

		}
		
		return false;
	}

	public static void main(String[] args) throws SQLException {
		ProductDAO dao = new ProductDAO();
		for (Product p : dao.getListProductByKeyWord("samsung",0,8)) {
			System.out.println(p.getProductName());
		}
		System.out.println(dao.countProductByKeyword("samsung"));
		// System.out.println(dao.getProduct(1).getProductName());
		
//		dao.updateProduct(new Product(18, 3, "OPPO Find X", "image/oppo-find-x.jpg", "Android 8.1 (Oreo)", "camara trước 25 MP, camara sau 20 MP và 16 MP (2 camera)", "Snapdragon 845 8 nhân","8 GB","256 GB", 150000,5));

	}

}
