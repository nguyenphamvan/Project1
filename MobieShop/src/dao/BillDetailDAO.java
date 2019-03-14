package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.BillDetail;
import model.Product;

public class BillDetailDAO {
	
	public void insertBillDetail(BillDetail bd) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ps.setLong(1, bd.getBillDetailID());
		ps.setLong(2, bd.getBillID());
		ps.setLong(3, bd.getProductID());
		ps.setLong(4, bd.getPrice());
		ps.setInt(5, bd.getQuantity());
		ps.executeUpdate();
		
		
	}
	
	public ArrayList<BillDetail> getBillDetailByBillID(long bill_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM bill_detail where bill_id = '" + bill_id + "' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<BillDetail> listBillDetail = new ArrayList<>();
		while (rs.next()) {
			BillDetail billDetail = new BillDetail();
			billDetail.setBillDetailID(rs.getLong("bill_detail_id"));
			billDetail.setBillID(rs.getLong("bill_id"));
			billDetail.setProductID(rs.getLong("product_id"));
			billDetail.setPrice(rs.getLong("price"));
			billDetail.setQuantity(rs.getInt("quantity"));
			listBillDetail.add(billDetail);
			
		}
		return listBillDetail;
	}
	
	public ArrayList<BillDetail> getBillDetailByUserID(long user_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT bill_id,product_id,price,quantity,user_id , order_date FROM bill_detail natural join bill natural join users"
				+ "WHERE user_id = '" + user_id + "'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<BillDetail> listBillDetail = new ArrayList<>();
		while (rs.next()) {
			BillDetail billDetail = new BillDetail();
			billDetail.setBillID(rs.getLong("bill_id"));
			billDetail.setProductID(rs.getLong("product_id"));
			billDetail.setPrice(rs.getLong("price"));
			billDetail.setQuantity(rs.getInt("quantity"));
			listBillDetail.add(billDetail);
			
		}
		return listBillDetail;
	}

	public static void main(String[] args) throws SQLException {
		BillDetailDAO billDetailDAO = new BillDetailDAO();
		for(BillDetail billDetail : billDetailDAO.getBillDetailByBillID(1)) {
			System.out.println(billDetail.getBillDetailID()+" - "+billDetail.getBillID()+" - "+billDetail.getProductID()+" - "
					+billDetail.getPrice()+" - "+billDetail.getQuantity());
		}
		
	}

}
