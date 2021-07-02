package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Product {
	private String productID;
	private String category;
	private String productName;
	private float price;
	private float quantity;
	private Date importDate;
	private Date saleDate;
	private Date expirationDate;
	private String productDescription;
	
	public Product() {}
	public Product(String productID, String category, String productName, float price, float quantity,
            Date importDate, Date saleDate, Date expirationDate, String productDescription){
		 this.productID = productID;
		 this.category = category;
		 this.productName = productName;
		 this.price = price;
		 this.quantity = quantity;
		 this.importDate = importDate;
		 this.saleDate = saleDate;
		 this.expirationDate = expirationDate;
		 this.productDescription = productDescription;
	}
	
	
	
	
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getImportDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String importdate = formatter.format(this.importDate);
		return importdate;
	}
	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}
	public String getSaleDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String saledate = formatter.format(this.importDate);
		return saledate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}
	public String getExpirationDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String expirationdate = formatter.format(this.importDate);
		return expirationdate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	
}
