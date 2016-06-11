package com.oms.DBUtill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionManager {

	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@172.24.137.30:1521:orcl";
		try {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
			   con = DriverManager.getConnection(url, "e843828", "JS1951v");

		    } 
		catch (ClassNotFoundException e)
		{
			System.out.println("Class is not found");
			e.printStackTrace();
		} 
		catch (SQLException e)
		{
			System.out.println("SQL Exception");
			e.printStackTrace();
		}

		return con;
	}

	public static void closeConnection(Connection con)
	{
		if(con!=null)
		{
			try
			{
				con.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		
				
	}
			
	public static void closePreparedStatement(PreparedStatement ps)
	{
		if(ps!=null)
		{
			try 
			{
				ps.close();
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
	public static void closeResultSet(ResultSet rs)
	{
		if(rs!=null)
		{
			try 
			{
				rs.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
		}
	}
	}
