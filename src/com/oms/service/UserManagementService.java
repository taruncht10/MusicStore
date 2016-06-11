package com.oms.service;



import java.util.ArrayList;
import java.util.HashMap;

import com.oms.DAO.OMS_DAO;
import com.oms.bean.Order;
import com.oms.bean.Store;
import com.oms.bean.User;

public class UserManagementService {
	
	OMS_DAO dao = new OMS_DAO();
	public boolean createUser(User user)
	{
		return dao.createUser(user);
	}
	public HashMap<Integer,String> fetchEmp(String role)
	{
		return dao.fetchEmp(role);
	}
	public HashMap<Integer,String> fetchMusic()
	{
		return dao.fetchMusic();
	}
	public User userValidation(String userName,int password)
	{
		return dao.userValidation(userName, password);
	}
	public boolean checkAvailabilty(String userName)
	{
		return dao.checkAvailabilty(userName);
		
	}
	public User forgotUser(User user)
	{
		return dao.forgotUser(user);
		
	}
	public boolean changePassword(User user)
	{
		return dao.changePassword(user);
	}
	public boolean updateChanges(User user)
	{
		return dao.updateChanges(user);
		
	}
	public boolean deleteUser(int userId)
	{
		return dao.deleteUser(userId);
	}
	public User viewEmployee(int empid,String role)
	{
		return dao.viewEmployee(empid,role);
	}
	public boolean storeSuggestion(String album,String title)
	{
		return dao.storeSuggestion(album,title);
	}
    public ArrayList<Store> getStores(String city)
	{
		return dao.getStores(city);
	}
	
}
