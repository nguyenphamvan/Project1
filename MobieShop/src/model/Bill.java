package model;

import java.sql.Timestamp;

public class Bill {
	
	private long billID;
	private long userID;
	private long total;
	private String payment;
	private String address;
	private Timestamp orderDate;
	private Timestamp shipDate;
	private String status;
	
	
	public Bill() {
		super();
	}


	public Bill(long billID, long userID, long total, String payment, String address, Timestamp orderDate,
			Timestamp shipDate, String status) {
		super();
		this.billID = billID;
		this.userID = userID;
		this.total = total;
		this.payment = payment;
		this.address = address;
		this.orderDate = orderDate;
		this.shipDate = shipDate;
		this.status = status;
	}


	public long getBillID() {
		return billID;
	}


	public void setBillID(long billID) {
		this.billID = billID;
	}


	public long getUserID() {
		return userID;
	}


	public void setUserID(long userID) {
		this.userID = userID;
	}


	public long getTotal() {
		return total;
	}


	public void setTotal(long total) {
		this.total = total;
	}


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}



	public Timestamp getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}


	public Timestamp getShipDate() {
		return shipDate;
	}


	public void setShipDate(Timestamp shipDate) {
		this.shipDate = shipDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
	

}
