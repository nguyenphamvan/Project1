package model;

public class Product {
	
	private long productID;
	private long categoryID;
	private String productName;
	private String productImage1;
	private String productImage2;
	private String productImage3;
	private String hedieuhanh;
	private String camara;
	private String cpu;
	private String ram;
	private String rom;
	private long productPrice;
	private long quantity;
	
	public Product() {
		super();
	}

	public Product(long productID, long categoryID, String productName, String productImage1,String productImage2,String productImage3,
			String hedieuhanh,String camara, String cpu, String ram, String rom, long productPrice, long quantity) {
		super();
		this.productID = productID;
		this.categoryID = categoryID;
		this.productName = productName;
		this.productImage1 = productImage1;
		this.productImage2 = productImage2;
		this.productImage3 = productImage3;
		this.hedieuhanh = hedieuhanh;
		this.camara = camara;
		this.cpu = cpu;
		this.ram = ram;
		this.rom = rom;
		this.productPrice = productPrice;
		this.quantity = quantity;
	}

	public long getProductID() {
		return productID;
	}

	public void setProductID(long productID) {
		this.productID = productID;
	}

	public long getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage1() {
		return productImage1;
	}

	public void setProductImage1(String productImage1) {
		this.productImage1 = productImage1;
	}
	

	public String getProductImage2() {
		return productImage2;
	}

	public void setProductImage2(String productImage2) {
		this.productImage2 = productImage2;
	}

	public String getProductImage3() {
		return productImage3;
	}

	public void setProductImage3(String productImage3) {
		this.productImage3 = productImage3;
	}

	public String getHedieuhanh() {
		return hedieuhanh;
	}

	public void setHedieuhanh(String hedieuhanh) {
		this.hedieuhanh = hedieuhanh;
	}

	public String getCamara() {
		return camara;
	}

	public void setCamara(String camara) {
		this.camara = camara;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getRom() {
		return rom;
	}

	public void setRom(String rom) {
		this.rom = rom;
	}

	public long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	
	
	
	

}
