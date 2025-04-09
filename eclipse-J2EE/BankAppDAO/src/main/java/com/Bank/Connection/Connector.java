package com.Bank.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
public static Connection requestConnection() {
		
		Connection con =null;
		String url="jdbc:mysql://localhost:3306/bank";
		String user="root";
		String password="tiger";
		
	

		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
//			System.out.println("loaded and register the driver");
	
			
			con=DriverManager.getConnection(url, user, password);
		System.out.println("'Connection build succesfully'");
			
			
		}
		
			catch (ClassNotFoundException | SQLException e) {
			
			
			e.printStackTrace();
		}
		return con;
		
	}


}
