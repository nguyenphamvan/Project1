package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.PreparedStatement;

import connect.DBConnect;
import model.Bill;
import model.Product;

public class BillDAO {

	public void insertBill(Bill bill) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ps.setLong(1, bill.getBillID());
		ps.setLong(2, bill.getUserID());
		ps.setLong(3, bill.getTotal());
		ps.setString(4, bill.getPayment());
		ps.setString(5, bill.getAddress());
		ps.setTimestamp(6, bill.getOrderDate());
		ps.setTimestamp(7, null);
		ps.setString(8, "PREPARING");
		ps.executeUpdate();

	}

	// lay danh sach don hang
	public ArrayList<Bill> getListBill() throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM bill";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Bill> list = new ArrayList<>();
		while (rs.next()) {
			Bill bill = new Bill();
			bill.setBillID(rs.getLong("bill_id"));
			bill.setUserID(rs.getLong("user_id"));
			bill.setTotal(rs.getLong("total"));
			bill.setPayment(rs.getString("payment"));
			bill.setAddress(rs.getString("address"));
			bill.setOrderDate(rs.getTimestamp("order_date"));
			bill.setShipDate(rs.getTimestamp("ship_date"));
			bill.setStatus(rs.getString("status"));
			list.add(bill);
		}
		return list;

	}

	// lay danh sach don hang theo billID
	public ArrayList<Bill> getListBillByUserID(long user_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM bill WHERE user_id = '" + user_id + "' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Bill> list = new ArrayList<>();
		while (rs.next()) {
			Bill bill = new Bill();
			bill.setBillID(rs.getLong("bill_id"));
			bill.setUserID(rs.getLong("user_id"));
			bill.setTotal(rs.getLong("total"));
			bill.setPayment(rs.getString("payment"));
			bill.setAddress(rs.getString("address"));
			bill.setOrderDate(rs.getTimestamp("order_date"));
			bill.setShipDate(rs.getTimestamp("ship_date"));
			bill.setStatus(rs.getString("status"));
			list.add(bill);
		}
		return list;

	}
	
	

	public boolean updateBill(long bill_id, Timestamp date, String status) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE bill SET status = ?, ship_date = ? WHERE bill_id = '" + bill_id + "' ";
		try {
			PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
			ps.setNString(1, status);
			if (status.equals("FINISH")) {

				ps.setTimestamp(2, date);
			} else {
				ps.setTimestamp(2, null);
			}

			return (ps.executeUpdate() == 1);
		} catch (Exception e) {
		}
		return false;
	}

	public Bill getBillByID(long user_id) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT * FROM bill WHERE user_id = '" + user_id + "' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Bill bill = new Bill();
		while (rs.next()) {

			bill.setUserID(rs.getLong("user_id"));
			bill.setTotal(rs.getLong("total"));
			bill.setPayment(rs.getString("payment"));
			bill.setAddress(rs.getString("address"));
			bill.setOrderDate(rs.getTimestamp("order_date"));
			bill.setShipDate(rs.getTimestamp("ship_date"));
			bill.setStatus(rs.getString("status"));
		}
		return bill;

	}
	
	public long getRevenueByDate(String date) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "select sum(total) as revenue from bill where  DATE(ship_date) = '"+date+"' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		long sum = 0;
		while (rs.next()) {
			sum += rs.getLong("revenue");
		}
		return sum;

	}
	
	public long getRevenueByMonth(String month) throws SQLException {
		Connection connection = DBConnect.getConnection();
		String sql = "select sum(total) as revenue from bill where  MONTH(ship_date) = '"+month+"' ";
		PreparedStatement ps = (PreparedStatement) connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		long sum = 0;
		while (rs.next()) {
			sum += rs.getLong("revenue");
		}
		return sum;

	}

	public static void main(String[] args) throws SQLException {

		System.out.println(new BillDAO().getRevenueByDate("2018-11-15"));
		// System.out.println(bill.getDate());
		System.out.println(new BillDAO().getRevenueByMonth("11"));

	}

}
