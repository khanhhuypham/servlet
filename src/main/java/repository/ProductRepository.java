package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.LinkedList;

import dbconnection.MySQLConnection;
import model.Product;

public class ProductRepository {
	public LinkedList<Product> getData() {
		LinkedList<Product> productList = new LinkedList<>();
		try {
			Connection connection = MySQLConnection.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT * FROM baitapjsp.productlist";
			ResultSet resultSet = statement.executeQuery(query);
			while(resultSet.next()) {
				Product product = new Product();
				product.setProductID(resultSet.getString("productID"));
				product.setCategory(resultSet.getString("category"));
				product.setProductName(resultSet.getString("productName"));
				product.setPrice(resultSet.getFloat("price"));
				product.setQuantity(resultSet.getFloat("quantity"));
				product.setProductDescription(resultSet.getString("productDescription"));
				productList.add(product);
			}
			return productList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList;
		
	}
	
	public Product findProductByCode(String ID) {
		Product product = null;
		Connection connection = MySQLConnection.getConnection();
		String query = "SELECT * FROM baitapjsp.productlist WHERE productID = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, ID);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				product = new Product();
				product.setCategory(resultSet.getString("category"));
				product.setProductName(resultSet.getString("productName"));
				product.setPrice(resultSet.getFloat("price"));
				product.setQuantity(resultSet.getFloat("quantity"));
				product.setProductDescription(resultSet.getString("productDescription"));
			
			}
			return product;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	
	public int addNewProduct(Product x) {
		
		try {
			Connection connection = MySQLConnection.getConnection();
			String query = "INSERT INTO baitapjsp.productlist(productID, category, productName, price, quantity, importDate, saleDate, expirationDate, productDescription)"
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1,x.getProductID());
			statement.setString(2,x.getCategory());
			statement.setString(3,x.getProductName());
			statement.setFloat(4,x.getPrice());
			statement.setFloat(5, x.getQuantity());
			statement.setDate(6, null);
			statement.setDate(7, null);
			statement.setDate(8, null);
			statement.setString(9, x.getProductDescription());
			int result = statement.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public int deleteProductByID(String ID) {
		Connection connection = MySQLConnection.getConnection();
		String query = "DELETE FROM baitapjsp.productlist WHERE productID = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, ID);
			int result = statement.executeUpdate();
			return result;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
	
	public int updateProduct(Product product) {
		try {
			Connection connection = MySQLConnection.getConnection();
			String query = "UPDATE baitapjsp.productlist SET "
					+ "productID = ?, category = ?, productName = ?, price = ?, quantity = ?,"
					+ "importDate = ?, saleDate = ?, expirationDate = ?, productDescription = ? "
					+ "WHERE productID = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, product.getProductID());
			statement.setString(2, product.getCategory());
			statement.setString(3, product.getProductName());
			statement.setFloat(4, product.getPrice());
			statement.setFloat(5, product.getQuantity());
			statement.setDate(6, null);
			statement.setDate(7, null);
			statement.setDate(8, null);
			statement.setString(9, product.getProductDescription());
			int result = statement.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	} 
	
}
