package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
	private static final String url = "jdbc:mysql://Localhost:3306";
	private static final String userName = "root";
	private static final String password = "";
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url,userName, password);
			System.out.println("connect successfully");
			return connection;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Fail to connect");
			e.printStackTrace();
		}
		
		return connection;
	}
	
	
}



