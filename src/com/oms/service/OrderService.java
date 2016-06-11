package com.oms.service;

import java.util.ArrayList;

import com.oms.DAO.Order_DAO;
import com.oms.bean.Order;
import com.oms.bean.User;

public class OrderService
{
    Order_DAO dao=new Order_DAO();
	public Order placeOrder(Order order)
	{
		return dao.placeOrder(order);
	}
	public ArrayList<Order> getHistory(User user)
	{
		return dao.getHistory(user);
	}
        public ArrayList<Order> getOrders(String status,String type)
	{
		return dao.getOrders(status,type);
	}
	public boolean cancelOrder(Order order)
	{
		return dao.CancelOrder(order);
	}
        public boolean saveStatus(Order order)
	{
		return dao.saveStatus(order);
	}  
	
}
