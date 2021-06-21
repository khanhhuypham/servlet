package model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;
import java.text.ParseException;

public class OperationToMyList {
//    private final String filePath = "C:/Users/huy/Desktop/MyWork/Cybersoft/baitapJSP/book1.csv";
    private LinkedList<Product> myList = new LinkedList<>();
   
	
	public OperationToMyList(String filePath){
		String line = "";
	    try{
	        BufferedReader br = new BufferedReader(new FileReader(filePath));
	        line = br.readLine();
	        while ((line = br.readLine()) != null){
	            String[] values = line.split(",");
	            /*convert String date to Date format*/
	            Date importDate = new SimpleDateFormat("dd/MM/yyyy").parse(values[5]);
	            Date saleDate = new SimpleDateFormat("dd/MM/yyyy").parse(values[6]);
	            Date expirationDate = new SimpleDateFormat("dd/MM/yyyy").parse(values[7]);
	
	            Product x = new Product(values[0], values[1], values[2], Integer.parseInt(values[3]), Integer.parseInt(values[4]), importDate, saleDate, expirationDate, values[8]);
	            this.myList.add(x);
	        }
	    } catch (IOException | ParseException e) {
	        e.printStackTrace();
	    }
	    
    }
	public OperationToMyList() {
		
	}
	
	
    /*hiện thực code cho các phương thức sau: 
	 * -findAllCustomer: trả về danh sách customer đang quản lý
	 * -findCustomerByCode: trả về 1 customer có code bằng với tham số được truyền vào
	 * -deleteCustomerByCode: xóa customer có mã code bằng với tham số được truyền vào
	 * -addNewCustomer: thêm customer vào danh sách quản lý
	 * */
		
	public LinkedList<Product> findAllProducts(){
		    return myList;
	 }
	
	public Product findProductByCode(String ID) {
		if(ID == null || ID.equals(""))
			return null;
		
		for(Product product: myList) {
			if(product.getProductID().equals(ID))
				return product;
		}
		
		return null;
	}
	
	public void deleteProductByID(String ID) {
		if(ID == null || ID.equals("")) {
			return;
		}else {
			for(Product product : myList) {
				if(!product.getProductID().equals(ID)) {
					continue;
				}
				myList.remove(product);
				return;
			}
		}
	
	}
	
	public void addNewProduct(Product x) {
		if(x.getProductID() == null || x.getProductID().equals("")){
			return;
		}else {
			for(Product product : myList) {
				if(!product.getProductID().equals(x.getProductID())) {
					continue;
				}
				return;
			}
		}
		myList.add(x);
	}
	
	public void update(Product productToUpdate, String IDToUpdate) {
		for(int i  = 0; i < myList.size(); i++) {
			if(!myList.get(i).getProductID().equals(IDToUpdate)) {
				continue;
			}
			productToUpdate.setProductID(IDToUpdate);
			myList.set(i, productToUpdate);
		}
	}
	
	

}