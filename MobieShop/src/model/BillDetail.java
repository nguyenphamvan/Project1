package model;

public class BillDetail {
	
	private long billDetailID;
	private long billID;
	private long productID;
	private long price;
	private int quantity;
	
	
	public BillDetail() {
		super();
	}


	public BillDetail(long billDetailID, long billID, long productID, long price, int quantity) {
		super();
		this.billDetailID = billDetailID;
		this.billID = billID;
		this.productID = productID;
		this.price = price;
		this.quantity = quantity;
	}


	public long getBillDetailID() {
		return billDetailID;
	}


	public void setBillDetailID(long billDetailID) {
		this.billDetailID = billDetailID;
	}


	public long getBillID() {
		return billID;
	}


	public void setBillID(long billID) {
		this.billID = billID;
	}


	public long getProductID() {
		return productID;
	}


	public void setProductID(long productID) {
		this.productID = productID;
	}



	public long getPrice() {
		return price;
	}


	public void setPrice(long price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	

}
