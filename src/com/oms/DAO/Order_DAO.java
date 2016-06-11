package com.oms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.oms.DBUtill.ConnectionManager;

import com.oms.bean.Order;
import com.oms.bean.User;


public class Order_DAO {
	
	
	public Order placeOrder(Order order ){
		Connection con = null;
	
		PreparedStatement Ps1 = null;
		PreparedStatement Ps2 = null;
                PreparedStatement Ps3 = null;
		ResultSet rs = null;
		ResultSet rs1=null;
		PreparedStatement Ps4 = null;
		ResultSet rs2 = null;
	
		con = ConnectionManager.getConnection();
		String Query2 = "Insert into Order_details (order_ID, User_Id ,Order_Date,Payment,Delivery_Type ,Delivery_Address,Status,card_number,card_type,name_on_card,payment_Status )"
			+"values(?,? ,?, ?, ?,?,?,?,?,?,?)";
		String Query1 = "select order_seq.nextval from dual";
     
		try {
			
			Ps2 = con.prepareStatement(Query1);
			rs1 = Ps2.executeQuery();
			if(rs1.next()){
			 order.setOrderId(rs1.getInt(1));
			}
			String query5="select sysdate from dual";
			Ps4=con.prepareStatement(query5);
			rs2=Ps4.executeQuery();
			if(rs2.next())
			{
				order.setOrderDate(rs2.getDate(1).toString());
			}
			
			
			Ps1 = con.prepareStatement(Query2);
			Ps1.setInt(1,order.getOrderId());
			System.out.println(order.getOrderId());
			Ps1.setInt(2, order.getUserID());
			Ps1.setString(3, (order.getOrderDate()));
			Ps1.setDouble(4, order.getPayment());
			Ps1.setString(5, order.getDelivery_type() );
			Ps1.setString(6, order.getDeliveryAddress());
			Ps1.setString(7, order.getStatus());
			Ps1.setLong(8, order.getCardNumber());
			Ps1.setString(9, order.getCard_type());
			Ps1.setString(10, order.getName_on_card());
			Ps1.setString(11, order.getPaymentStatus());
			
			int ordered = Ps1.executeUpdate();
			System.out.println(ordered);
			if(ordered < 1)
			{
				order.setOrderId(0);
			}
			else
                        {
                             String query3="insert into Order_Mapping values(?,?,?)";
                             for(int i=0;i<3;i++)
                             {
                                 if(order.getMusicId(i+1)!=0)
                                 {
                                         Ps3=con.prepareStatement(query3);
                                         Ps3.setInt(1,order.getOrderId());
                                         Ps3.setInt(2,order.getMusicId(i+1));
                                         Ps3.setInt(3,order.getQuantity(i+1));
                                         Ps3.executeUpdate();
                                 }
                            }
                       }

			

			
		} catch (SQLException e) {
			System.out.println("error in Placing Order");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return order;
		
	}
	
	
	public boolean CancelOrder(Order order ){
		Connection con = null;
		PreparedStatement Ps1 = null;
	
		ResultSet rs = null;
		boolean status = false;
		con = ConnectionManager.getConnection();
		
		String Query1 = "delete from order_details where order_Id =?";
		
     
		try {
	        Ps1 = con.prepareStatement(Query1);
	        Ps1.setInt(1, order.getOrderId());
			int deleted = Ps1.executeUpdate();
			if (deleted == 1) {
				status = true;
			} else {
				status = false;
			}
			

			
		} catch (SQLException e) {
			System.out.println("order is cancelled");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return status;
		
	}
         public boolean saveStatus(Order order )
         {
		Connection con = null;
		PreparedStatement Ps1 = null;
	
		ResultSet rs = null;
		boolean status = false;
		con = ConnectionManager.getConnection();
		
		String Query1 = "update order_details set status=? where order_Id =?";
		
     
		try {
	        Ps1 = con.prepareStatement(Query1);
                Ps1.setString(1,order.getStatus());
	        Ps1.setInt(2, order.getOrderId());
		int updated = Ps1.executeUpdate();
			if (updated == 1) {
				status = true;
			} else {
				status = false;
			}
			

			
		} catch (SQLException e) {
			System.out.println("order is cancelled");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return status;
		
	}
	
	
	public ArrayList<Order> getHistory(User user)
	{
		ArrayList<Order> orderList=new ArrayList<Order>();
		Connection con = null;
		
		PreparedStatement Ps1 = null;
		
		ResultSet rs = null;
		
	        PreparedStatement Ps2 = null;
		
		ResultSet rs1 = null;
		con = ConnectionManager.getConnection();
		
		String Query1 = "select * from Order_details where user_id=?";
     
		try {
			
			Ps1 = con.prepareStatement(Query1);
			Ps1.setInt(1, user.getUserID());
			rs= Ps1.executeQuery();
			while(rs.next())
			{
			   Order order=new Order();
			   order.setOrderId(rs.getInt(1));
			   order.setUserID(rs.getInt(2));
			   order.setOrderDate(rs.getString(3));
			   order.setPayment(rs.getInt(4));
			   order.setDelivery_type(rs.getString(5));
			   order.setDeliveryAddress(rs.getString(6));
			   order.setStatus(rs.getString(7));
			   order.setPaymentStatus(rs.getString(11));
			   order.setLSP_Name(rs.getString(12));
			   order.setAWB_Number(rs.getString(13));
                           String query2="select * from Order_Mapping where order_id=?";
                           Ps2 = con.prepareStatement(query2);
			Ps2.setInt(1, order.getOrderId());
			rs1= Ps2.executeQuery();
                        int i=1;
			while(rs1.next())
			{
			   order.setMusicId(i,rs1.getInt(2));
                           order.setQuantity(i,rs1.getInt(3));
			   i=i+1;
             }
			orderList.add(order);     
			}		
		        
			
			

			
		} catch (SQLException e) {
			System.out.println("error in Placing Order");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return orderList;
		
	}

		
	

	public ArrayList<Order> getOrders(String status,String type)
	{
		ArrayList<Order> orderList=new ArrayList<Order>();
		Connection con = null;
		
		PreparedStatement Ps1 = null;
		
		ResultSet rs = null;
                PreparedStatement Ps2 = null;
		
		ResultSet rs1 = null;
		
	
		con = ConnectionManager.getConnection();
		
		String Query1 = "select * from Order_details where status=? and delivery_type=?";
     
		try {
			
			Ps1 = con.prepareStatement(Query1);
			Ps1.setString(1, status);
                        Ps1.setString(2,type);
			rs= Ps1.executeQuery();
			while(rs.next())
			{
			   Order order=new Order();
			   order.setOrderId(rs.getInt(1));
			   order.setUserID(rs.getInt(2));
			   order.setOrderDate(rs.getString(3));
			   order.setPayment(rs.getInt(4));
			   order.setDelivery_type(rs.getString(5));
			   order.setDeliveryAddress(rs.getString(6));
			   order.setStatus(rs.getString(7));
			   order.setPaymentStatus(rs.getString(11));
			   order.setLSP_Name(rs.getString(12));
			   order.setAWB_Number(rs.getString(13));
                           String query2="select * from Order_Mapping where order_id=?";
                           Ps2 = con.prepareStatement(query2);
			Ps2.setInt(1, order.getOrderId());
			rs1= Ps2.executeQuery();
                        int i=1;
			while(rs1.next())
			{
			   order.setMusicId(i,rs1.getInt(2));
			   order.setQuantity(i,rs1.getInt(3));
                           i=i+1;
            }
			   orderList.add(order);   
			}		
		
			
			System.out.println(orderList.size());

			
		} catch (SQLException e) {
			System.out.println("error in Placing Order");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return orderList;
		
	}

		
	}
	

	
	
	


