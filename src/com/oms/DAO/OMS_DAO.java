package com.oms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.oms.DBUtill.ConnectionManager;
import com.oms.bean.Order;
import com.oms.bean.Store;
import com.oms.bean.User;

public class OMS_DAO {

	// ********************************************************************************************************************



	public User userValidation(String userName, int password) 
	{
		Connection con = null;
		con = ConnectionManager.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		
		ResultSet rs2 = null;
		User user=new User();
		try {

			ps = con.prepareStatement("select * from User_Credentials where User_Name=? and Password=?");
			ps.setString(1, userName);
			ps.setInt(2, password);
			rs = ps.executeQuery();
			if (rs.next())
			{
				
				user.setUserID(rs.getInt(1));
				user.setUserName(rs.getString(2));
				user.setPwd(rs.getInt(3));
				user.setSecretQuestion(rs.getString(4));
				user.setAnswer(rs.getInt(5));
				ps2 = con.prepareStatement("select * from User_Details where User_Id=?");
			
				ps2.setInt(1, user.getUserID());
				
				rs2 = ps2.executeQuery();
				//System.out.println(rs2.next());
				if (rs2.next())
				{
					user.setUserType(rs2.getString("User_Type"));
					System.out.println("INSIDE RS2"+rs2.getString("User_Type"));
					user.setFirstName(rs2.getString("First_Name"));
					System.out.println("INSIDE RS2"+rs2.getString("First_Name"));
					user.setLastName(rs2.getString("Last_Name"));
					System.out.println("INSIDE RS2"+rs2.getString("Last_Name"));
					user.setGender(rs2.getString("Gender"));
					System.out.println("INSIDE RS2"+rs2.getString("Gender"));
					user.setDOB(rs2.getString(("DateOfBirth")));
					System.out.println("INSIDE RS2"+rs2.getString("DateOfBirth"));
					user.setEmail(rs2.getString("EMail"));
					System.out.println("INSIDE RS2"+rs2.getString("EMail"));
					user.setMobileNumber(rs2.getLong("Mobile_Number"));
					System.out.println("INSIDE RS2"+rs2.getString("Mobile_Number"));
					user.setMailingAddress(rs2.getString("Mailing_Address"));
					System.out.println("INSIDE RS2"+rs2.getString("Mailing_Address"));
					user.setWeeklyNewsletter(rs2.getString("WEEKLY_NEWS_PAPER"));
					System.out.println("INSIDE RS2"+rs2.getString("WEEKLY_NEWS_PAPER"));
					 user.setOffersToMobile(rs2.getString("OFFERS_TO_MOBILE"));
					 System.out.println("INSIDE RS2"+rs2.getString("OFFERS_TO_MOBILE"));
					 con.commit();
				}
			} 
			
			
		} 
		catch (SQLException e) 
		{
			System.out.println("Exception occurs in validation query");
			e.printStackTrace();
		} 
		finally 
		{
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(ps);
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closePreparedStatement(ps2);
			ConnectionManager.closeResultSet(rs2);


		}
		return user;

	}

	// ********************************************************************************************************************

	public HashMap<Integer,String> fetchEmp(String role)
	{
		HashMap<Integer,String> emp=new HashMap<Integer,String>();
		Connection con = null;
		PreparedStatement Ps1 = null;
		PreparedStatement Ps2 = null;
		
		ResultSet rs = null;
		ResultSet rs1=null;
		int userId=0;
		String firstName="";
		int empID=0;
		con = ConnectionManager.getConnection();
		String query = "select * from " + role;
		try {
			Ps1 = con.prepareStatement(query);
			rs = Ps1.executeQuery();

			while (rs.next()) 
			{
				userId = rs.getInt("user_id");
				String query1 = "select first_name from  User_Details WHERE user_id=?";
				Ps2 = con.prepareStatement(query1);
				Ps2.setInt(1, userId);
				rs1 = Ps2.executeQuery();
				while (rs1.next()) 
				{
                   	firstName=rs1.getString("first_name");
				}
				empID=rs.getInt("emp_id");
				emp.put(empID, firstName);
			}

		} catch (SQLException e) {
			System.out.println("exception occured while viewing details");

			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closePreparedStatement(Ps2);

		}
		
		return emp;
	}
	
	public HashMap<Integer,String> fetchMusic()
	{
		HashMap<Integer,String> emp=new HashMap<Integer,String>();
		Connection con = null;
		PreparedStatement Ps1 = null;

		
		ResultSet rs = null;
	
	
		String title="";
		int musicID=0;
		con = ConnectionManager.getConnection();
		String query = "select music_id,title from music";
		try {
			Ps1 = con.prepareStatement(query);
			rs = Ps1.executeQuery();

			while (rs.next()) 
			{
				title=rs.getString("title");
				musicID=rs.getInt("music_id");
				emp.put(musicID, title);
			}

		} catch (SQLException e) {
			System.out.println("exception occured while viewing details");

			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);
		}
		
		return emp;
	}
	
	public boolean checkAvailabilty(String userName) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		con = ConnectionManager.getConnection();

		boolean status = false;
		try {

			ps = con.prepareStatement("select * from User_Credentials where User_Name=?");
			ps.setString(1, userName);

			rs = ps.executeQuery();
			if (rs.next()) 
			{
				status = true;
			} 
			else
				status = false;

		} catch (SQLException e) {
			System.out.println("Exception occur in Check Availabilty");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(ps);
			ConnectionManager.closeResultSet(rs);

		}
		return status;

	}

	// *****************************************************************************************************************

	public boolean createUser(User user) {
		Connection con = ConnectionManager.getConnection();

		PreparedStatement Ps = null;
		PreparedStatement Ps1 = null;
		PreparedStatement Ps2 = null;
		con = ConnectionManager.getConnection();
		ResultSet rs = null;
		String executeQuery = "insert Into User_Credentials values(user_seq.nextval,?,?,?,?)";
		boolean insertedStatus=false;
		int userId = 0;
		try {
			Ps = con.prepareStatement(executeQuery);
			Ps.setString(1, user.getUserName());
			Ps.setInt(2, user.getPwd());
			Ps.setString(3, user.getSecretQuestion());
			Ps.setInt(4, user.getAnswer());
			int inserted=Ps.executeUpdate();
	
			if(inserted==1)
			{
				inserted=0;
			  	Ps1 = con.prepareStatement("select User_Id from User_Credentials where User_Name = ?");
				   Ps1.setString(1, user.getUserName());
				   rs = Ps1.executeQuery();
				   if (rs.next()) 
			      {
					    userId = rs.getInt("User_Id");
				   }
				   String executeQuery2 ="insert Into User_Details values(?,?,?,?,?,?,?,?,?,?,?)";
			   Ps2 = con.prepareStatement(executeQuery2);
			   Ps2.setInt(1,userId);
			   Ps2.setString(2, user.getUserType());
			   Ps2.setString(3, user.getFirstName());
			   Ps2.setString(4, user.getLastName());
			   Ps2.setString(5, user.getGender());
			   Ps2.setString(6, user.getDOB());
			   Ps2.setString(7, user.getEmail());
			   Ps2.setLong(8,user.getMobileNumber());
			   Ps2.setString(9, user.getMailingAddress());
			   Ps2.setString(10, user.getWeeklyNewsletter());
			   Ps2.setString(11, user.getOffersToMobile());
			   inserted=Ps2.executeUpdate();
			   if(inserted==1)
				   insertedStatus=true;
			   else
				   insertedStatus=false;
			}
		

		} catch (SQLException e) {
			System.out.println("Exception occur in creating User");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps);
			ConnectionManager.closeResultSet(rs);

		}
		return insertedStatus;

	}

	// **************************************************************************

	public boolean updateChanges(User user) {
		Connection con = null;
		PreparedStatement Ps1 = null;
		ResultSet rs = null;
		boolean status = false;
		con = ConnectionManager.getConnection();
		String Query1 = "UPDATE User_Details set Email = ?,Mobile_number = ?,weekly_news_paper=?,offers_to_mobile=? WHERE user_ID = ?";

		try {
			Ps1 = con.prepareStatement(Query1);

			Ps1.setString(1, user.getEmail());
			Ps1.setLong(2, user.getMobileNumber());
			Ps1.setString(3, user.getWeeklyNewsletter());
			Ps1.setString(4, user.getOffersToMobile());
			Ps1.setInt(5, user.getUserID());
			int updated = Ps1.executeUpdate();

			if (updated==1) 
			{
				status = true;
			} 
			else {
				status = false;
			}
		} catch (SQLException e) {
			System.out.println("error in updation");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		return status;

	}


	// *****************************************************************************************

	public boolean deleteUser(int userId) {
		Connection con = null;
		PreparedStatement Ps1 = null;
		ResultSet rs = null;
		boolean status = false;
		con = ConnectionManager.getConnection();
		String query = "delete from User_Credentials where User_Id=?";
		try {

			Ps1 = con.prepareStatement(query);
			Ps1.setInt(1, userId);
			int deleted = Ps1.executeUpdate();
			if (deleted == 1) {
				status = true;
			} else {
				status = false;
			}

		} catch (SQLException e) {
			System.out.println("User is not deleted");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);
		}

		return status;

	}

	// *****************************************************************************
	public User viewEmployee(int Emp_ID, String Role) {
		Connection con = null;
		PreparedStatement Ps1 = null;
		PreparedStatement Ps2 = null;
		User user = new User();
		ResultSet rs = null;
		ResultSet rs1=null;
		int userId=0;
		user.setUserID(userId);
		con = ConnectionManager.getConnection();
		String query = "select user_id from " + Role + " WHERE EMP_ID=?";
		try {
			Ps1 = con.prepareStatement(query);
			Ps1.setInt(1, Emp_ID);
			rs = Ps1.executeQuery();

			if (rs.next()) {
				userId = rs.getInt(1);
				user.setUserID(userId);
				String query1 = "select first_name, last_name,DateofBirth,email,mobile_Number from  User_Details WHERE user_id=?";
				Ps2 = con.prepareStatement(query1);
				Ps2.setInt(1, userId);
				rs1 = Ps2.executeQuery();
				while (rs1.next()) {

					user.setFirstName(rs1.getString("first_name"));
					user.setLastName(rs1.getString("last_name"));
					user.setDOB(rs1.getString(("DateofBirth")));
					user.setEmail(rs1.getString("email"));
					user.setMobileNumber(rs1.getLong("mobile_Number"));
				}
			}

		} catch (SQLException e) {
			System.out.println("exception occured while viewing details");

			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closePreparedStatement(Ps2);

		}
		return user;

		// *******************************************************************************************************************
	}

	
	

	public boolean storeSuggestion(String Title, String AlbumName) 
	{
		Connection con = null;
		PreparedStatement Ps1 = null;
		PreparedStatement Ps2 = null;
		PreparedStatement Ps3 = null;
		PreparedStatement Ps4 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		int noofSuggestion=0;
		int check=0; 
		
		con = ConnectionManager.getConnection();
		boolean status = false;
		String query1 = "Select * from music where Title  =? and Album =?";
		String query2 = "Select * from Suggestion where Title =? and Album =?";
		String query3 = "Insert into suggestion (album,title,NumberofSuggestion) values(?,?,?)";
		String query4 = "Update Suggestion SET NumberofSuggestion=? where Title  =? and Album =?";

		try {
			Ps1 = con.prepareStatement(query1);
			Ps1.setString(1, Title);
			Ps1.setString(2, AlbumName);
			rs = Ps1.executeQuery();
			if (rs.next()) 
			{
				status = false;
			} 
			else 
			{
				Ps2 = con.prepareStatement(query2);
				Ps2.setString(1, Title);
				Ps2.setString(2, AlbumName);
				rs1 = Ps2.executeQuery();
				if (rs1.next())
				{
			         noofSuggestion =rs1.getInt("NumberofSuggestion");
			         Ps4 = con.prepareStatement(query4);
				     Ps4.setInt(1, noofSuggestion+1 );
				     Ps4.setString(2, Title);
				     Ps4.setString(3, AlbumName);
				     check = Ps4.executeUpdate();
						if (check == 1) 
						{
							status = true;
						} 
						else 
						{
							status = false;
						}
				} 
				else 
				{
					Ps3 = con.prepareStatement(query3);
					Ps3.setString(1, Title);
					Ps3.setString(2, AlbumName);
					Ps3.setInt(3, 1);
					
					check = Ps3.executeUpdate();
					if (check == 1) 
					{
						status = true;
					} 
					else 
					{
						status = false;
					}

				}

			}

		}

		catch (SQLException e) {
			System.out.println("Exception in storesuggestion");
			e.printStackTrace();
		}
		finally{
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closePreparedStatement(Ps2);
			ConnectionManager.closePreparedStatement(Ps3);
			ConnectionManager.closePreparedStatement(Ps4);
		}

		return status;

	}

	
// **********************************************************************************************************************
	public User forgotUser(User user) {
		Connection con = null;

		PreparedStatement Ps = null;
	
		ResultSet rs = null;
		con = ConnectionManager.getConnection();

		String query1 = "select * from  user_credentials WHERE user_name=?";
		try {
			Ps = con.prepareStatement(query1);
			Ps.setString(1, user.getUserName());
			rs = Ps.executeQuery();
			
			while(rs.next())
				{   
				user.setUserID(rs.getInt("USER_ID"));
				user.setPwd(rs.getInt("PASSWORD"));
				user.setSecretQuestion(rs.getString("SECRET_QUESTION"));
				user.setAnswer(rs.getInt("SECRET_ANSWER"));

			}
		} catch (SQLException e) {
			System.out.println("exception occurs");
			e.printStackTrace();
		}
		finally{
			ConnectionManager.closeConnection(con);
			
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closePreparedStatement(Ps);
			
		}
		return user;

	}

    public boolean changePassword(User user)
    {
    	Connection con = null;
        boolean status=false;
		PreparedStatement Ps2 = null;
		con = ConnectionManager.getConnection();

		String query1 = "update user_credentials set password=? where user_id=?";
		try {
			Ps2 = con.prepareStatement(query1);
			Ps2.setInt(1,user.getPwd());
			Ps2.setInt(2, user.getUserID());
			int updated= Ps2.executeUpdate();
			System.out.println(updated);
			if(updated>0)
			{
				status=true;
			}
			else
				status=false;
		}	
		catch (SQLException e) {
			System.out.println("exception occured while viewing details");

			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps2);

		}
		return status;
    }
    //************************************************************************************************************
    public ArrayList<Store> getStores(String city)
	{
		ArrayList<Store> storeList=new ArrayList<Store>();
		Connection con = null;
		
		PreparedStatement Ps1 = null;
		
		ResultSet rs = null;
                PreparedStatement Ps2 = null;
		
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		
		String cityName=city;
		con = ConnectionManager.getConnection();
		
		String Query1 = "select * from store_details where city=?";
     
		try {
			System.out.println("in dao:"+city);
			Ps1 = con.prepareStatement(Query1);
			Ps1.setString(1, cityName);
			rs= Ps1.executeQuery();
			while(rs.next())
			{
			   Store store=new Store();
			   store.setStoreId(rs.getInt(1));
			   store.setStoreName(rs.getString("STORE_NAME"));
			   store.setCity(rs.getString(3));
			   store.setEmpID(rs.getInt(4));
               String query2="select * from SM where emp_id=?";
                   Ps2 = con.prepareStatement(query2);
			       Ps2.setInt(1, store.getEmpID());
			       rs1= Ps2.executeQuery();
                   if(rs1.next())
                   {
                	   String query3="select First_Name,Last_name from user_details where user_id=?";
			           Ps1=con.prepareStatement(query3);
			           Ps1.setInt(1, rs1.getInt("user_id"));
			           rs2=Ps1.executeQuery();
			          if(rs2.next())
						{
						   store.setFirstName(rs2.getString("First_name"));
						   store.setLastName(rs2.getString("Last_Name"));
			            }
			       }		
                   storeList.add(store); 
			}
			System.out.println(storeList.size());

			
		} catch (SQLException e) {
			System.out.println("error in Placing Order");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(con);
			ConnectionManager.closePreparedStatement(Ps1);
			ConnectionManager.closeResultSet(rs);

		}
		
		return storeList;
		
	}

		
	}
	





