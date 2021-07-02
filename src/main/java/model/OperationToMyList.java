package model;

import java.util.LinkedList;


import repository.ProductRepository;



public class OperationToMyList {

    private LinkedList<Product> myList;
    private ProductRepository productRepository;
	
    public OperationToMyList() {
		productRepository = new ProductRepository();
		myList = new LinkedList<>();
		
	}
	
	
	
    /*hiện thực code cho các phương thức sau: 
	 * -findAllCustomer: trả về danh sách customer đang quản lý
	 * -findCustomerByCode: trả về 1 customer có code bằng với tham số được truyền vào
	 * -deleteCustomerByCode: xóa customer có mã code bằng với tham số được truyền vào
	 * -addNewCustomer: thêm customer vào danh sách quản lý
	 * */
	
	public LinkedList<Product> loadDataFromDataBase() {
		this.myList = productRepository.getData();
	    return myList;
	}
	
	public int size() {
		return myList.size();
	}
	
	public boolean checkExistence(String ID) {
		for(Product product: myList) {
			if(product.getProductID().equals(ID))
				return true;
		}
		return false;
	}
	
	public Product findProductByCode(String ID) {
		for(Product product: myList) {
			if(product.getProductID().equals(ID))
				return product;
		}
		
		return null;
	}
	
	public void deleteProductByID(String ID) {
		for(Product product : myList) {
			if(!product.getProductID().equals(ID)) {
				continue;
			}
			myList.remove(product);
			return;
		}
		
	
	}
	
	public void addNewProduct(Product x) {
		for(Product product : myList) {
			if(!product.getProductID().equals(x.getProductID())) {
				continue;
			}
			return;
		}
		
		myList.add(x);
	}
	
	public void update(Product productToUpdate) {
		for(int i  = 0; i < myList.size(); i++) {
			if(!myList.get(i).getProductID().equals(productToUpdate.getProductID())) {
				continue;
			}
			myList.set(i, productToUpdate);
		}
	}
	
	

}