package com.oms.controller;

import java.io.IOException;
import java.io.PrintWriter;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import com.oms.bean.Order;
import com.oms.bean.Store;
import com.oms.bean.User;
import com.oms.service.UserManagementService;

public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
{
   request.setAttribute("Error","No TailGating");
   RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
   rd.forward(request,response);
}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("method is invoked");
		String action = request.getParameter("action");
		System.out.println(action);
		UserManagementService userService=new UserManagementService();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		
		//---------------------------------------------------------------------------------------------------------------------------
		if(action.equals("authentication"))
		{
			
			User user=new User();
			user.setUserID(0);		
			String username=request.getParameter("username");
			user.setPassword(request.getParameter("password"));
			int hash=user.hashCodePwd();
			user = userService.userValidation(username,hash);
			user.setPassword(request.getParameter("password"));
			HashMap<Integer,String> emp=new HashMap<Integer,String>();
			HashMap<Integer,String> music=new HashMap<Integer,String>();
			System.out.println(user.getUserID());
			if (user.getUserID()>0)
			{  
				System.out.println("inside");
				
				HttpSession session=request.getSession();  
		        session.setAttribute("user",user); 
		        if(user.getUserType().equals("MRM"))
	        	{
	        	    music=userService.fetchMusic();
	        	    session.setAttribute("musicID",music);
	        	}
		        if(user.getUserType().equals("IA")||user.getUserType().equals("CA"))
		        {
		        	emp=userService.fetchEmp("SM");
		        	session.setAttribute("SM",emp);
		        	if(user.getUserType().equals("IA"))
		        	{
		        	emp=userService.fetchEmp("CA");
		        	session.setAttribute("CA",emp);
		        	emp=userService.fetchEmp("MRM");
		        	session.setAttribute("MRM",emp);
		        	}
		        }
		        RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
			    rd.forward(request, response);
               
			} 
			else 
			{
				out.print("<h4> Enter the correct credentials  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("Authentication.jsp");
				rd.include(request, response);
				
			}

		}

	//--------------------------------------------------------------------------------------------------------------------------------
		
		if (action.equals("createUser"))
		{
			User user = new User();
			boolean checkuser=false;
			boolean insertedStatus=false;
			user.setUserName(request.getParameter("username"));
            checkuser=userService.checkAvailabilty(user.getUserName());
			if (checkuser == true) 
			{
				out.print("<h4> Username not available. </h4>");
				
			 RequestDispatcher rd=request.getRequestDispatcher("CustomerRegistration.jsp");
			  rd.include(request,response);
				
			} 
			else
			{
				user.setPassword(request.getParameter("password"));
				user.setPwd(user.hashCodePwd());
				
				user.setSecretQuestion(request.getParameter("securityQuestion"));
				user.setSecretAnswer(request.getParameter("securityAnswer"));
				user.setAnswer(user.hashCodeAns());
				
				user.setFirstName(request.getParameter("name"));
				user.setLastName(request.getParameter("lastname"));
				user.setGender(request.getParameter("gender"));
				user.setDOB(request.getParameter("date"));
				
				
				user.setEmail(request.getParameter("mail"));
				user.setUserType("user");
				user.setMobileNumber(Long.parseLong(request.getParameter("mobNo")));
				user.setMailingAddress(request.getParameter("Address"));
				String[] weekly=request.getParameterValues("checkWeekly");
				String[] offer=request.getParameterValues("checkOffer");
				if(weekly==null) {
					user.setWeeklyNewsletter("false");
				}
				else {
					user.setWeeklyNewsletter("true");
				}
				if(offer==null)  {
					user.setOffersToMobile("false");
				}
				else {
					user.setOffersToMobile("true");
				}
				insertedStatus = userService.createUser(user);
				if(insertedStatus==true)
				{   
					out.print("<h4> Registration done successsfully  </h4>");
					 RequestDispatcher rd=request.getRequestDispatcher("Authentication.jsp");
					  rd.include(request,response);
				}
				else
				{
					out.print("<h4> Registration not done </h4>");
					 RequestDispatcher rd=request.getRequestDispatcher("CustomerRegistration.jsp");
					  rd.include(request,response);
				}
			}
		}
		//---------------------------------------------------------------------------------------------------
		if (action.equals("logout"))
		{
			if(request.getParameter("cancel").equals("false"))
			{
				HttpSession session= request.getSession();	
			    session.setAttribute("user", null);
			    session.invalidate();
			   
			    response.sendRedirect("HomePage.jsp");
			}
			
			else 
			{
				RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
				rd.forward(request, response);
			}
		}
		
		//-----------------------------------------------------------------------------------------------------------------------------------------
		if (action.equals("forgotUser"))
		{
			User user = new User();
			user.setUserID(0);
			user.setUserName(request.getParameter("username"));
			user = userService.forgotUser(user);
	
			if (user.getUserID()>0) 
			{
				HttpSession session= request.getSession();
				session.setAttribute("user_Change",user);
				RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
				rd.forward(request,response);
			} 
			else
			{
                out.print("<h4> Enter the correct username  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("forgotuser.jsp");
				rd.include(request, response);
			}
			   	
			}
		//-----------------------------------------------------------------------------------------------------
		if(action.equals("forgotPassword"))
		{
			String securityAnswer=request.getParameter("Answer");
			HttpSession session= request.getSession();
			User user=(User)session.getAttribute("user_Change");
			User change=new User();
			change.setSecretAnswer(securityAnswer);
			int ans=change.hashCodeAns();
			System.out.println(user.getAnswer());
			System.out.println(ans);
			if(user.getAnswer()==ans)
			{
				user.setPassword(request.getParameter("pwd"));
				user.setPwd(user.hashCodePwd());
				boolean check=userService.changePassword(user);
				
				if(check==true)
				{
					out.print("<h4> Password is changed </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("Authentication.jsp");
					rd.include(request, response);
				}
				else
				{
					out.print("<h4> Enter the correct details  </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
					rd.include(request, response);
				}
			}
			else
			{
				out.print("<h4> Enter the correct security answer  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
				rd.include(request, response);
			}
		}
if (action.equals("confirmUserChange"))
		{
			User user = new User();
			String UserName=request.getParameter("username");
			HttpSession session=request.getSession();
            user=(User)session.getAttribute("user"); 

			if (user.getUserName().equals(UserName)) 
			{
				RequestDispatcher rd = request.getRequestDispatcher("ConfirmPwdChange.jsp");
				rd.forward(request, response);
			} 
			else
			{	out.print("<h4> Enter the correct username  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("ConfirmUserChange.jsp");
				rd.include(request, response);
			}
			   	
			}
		//-----------------------------------------------------------------------------------------------------
		if(action.equals("confirmPwdChange"))
		{
			String securityAnswer=request.getParameter("Answer");
			HttpSession session= request.getSession();
			User user=(User)session.getAttribute("user");
			User change=new User();
			change.setSecretAnswer(securityAnswer);
			int ans=change.hashCodeAns();
			System.out.println(user.getAnswer());
			System.out.println(ans);
			if(user.getAnswer()==ans)
			{
				user.setPassword(request.getParameter("pwd"));
				user.setPwd(user.hashCodePwd());
				boolean check=userService.changePassword(user);
				
				if(check==true)
				{       out.print("<h4> Password successfully changed  </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
					rd.include(request, response);
				}
				else
				{       out.print("<h4> Enter the correct details  </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("ConfirmPwdChange.jsp");
					rd.include(request, response);
				}
			}
			else
			{
				out.print("<h4> Enter the correct security answer  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("ConfirmPwdChange.jsp");
				rd.include(request, response);
			}
		}
		//---------------------------------------------------------------------------------------------------
		if(action.equals("updateUser"))
		{
			
			HttpSession context= request.getSession();
			User user=(User)context.getAttribute("user");
			
			user.setEmail(request.getParameter("mail"));
			System.out.println(request.getParameter("mobNo"));
			user.setMobileNumber(Long.parseLong(request.getParameter("mobNo")));
			if(request.getParameter("checkOffer").equals("true"))
				user.setOffersToMobile("true");
			else
				user.setOffersToMobile("false");
			if(request.getParameter("checkWeek").equals("true"))
				user.setWeeklyNewsletter("true");
			else
				user.setWeeklyNewsletter("false");
			
			boolean save=userService.updateChanges(user);
		
				if(save==true)
				{
					response.sendRedirect("SecondHomePage.jsp");
				}
				else
				{
                    out.print("<h4> Enter the correct details  </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
					rd.include(request, response);
				}
			}
		//-------------------------------------------------------------------------------------------
		if(action.equals("deleteUser"))
		{
			
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			System.out.println(user.getPassword());
			String pwd=user.getPassword();
			String pwdr=request.getParameter("password");
			if(pwd.equals(pwdr))
					{
							boolean delete=userService.deleteUser(user.getUserID());
				            if(delete)
				            {
					               response.sendRedirect("HomePage.jsp");
				             }
				            else
				            {        out.print("<h4> Enter the correct password  </h4>");
					             RequestDispatcher rd = request.getRequestDispatcher("deleteAccount.jsp");
					             rd.include(request, response);
				            }
			         }
		}
		//----------------------------------------------------------------------------------------------
		if(action.equals("searchEmployee"))
		{
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("user");
			String role=request.getParameter("role");
			int empid=Integer.parseInt(request.getParameter("empid"));
			if(user.getUserType().equals("CA"))
			{
				if(!role.equals("SM"))
				{        out.print("<h4> You are not authorised to view the details  </h4>");
					 RequestDispatcher rd = request.getRequestDispatcher("viewEmployee.jsp");
		             rd.include(request, response);
				}
			}
			User employee=new User();
			employee.setUserID(0);
			employee=userService.viewEmployee(empid,role);
			System.out.println(employee.getUserID());
			if(employee.getUserID()>0)
			{
				session.setAttribute("employee", employee);
				RequestDispatcher rd = request.getRequestDispatcher("EmployeeDetails.jsp");
	            rd.include(request, response);
			}
			else
			{
				out.print("<h4> Employee id and role does not match  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("viewEmployee.jsp");
	             rd.include(request, response);
				
			}
			
		}
		if(action.equals("storeSuggestion"))
		{
			
			String album=request.getParameter("Album_Name");
			String title=request.getParameter("Music_Title");
			boolean inserted = userService.storeSuggestion(album,title);
				 
			
			if (inserted)
			{       out.print("<h4> Suggestion saved successfully  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
				rd.include(request, response);
               
			} 
			else 
			{       out.print("<h4> Suggestion not saved  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("Suggestion.jsp");
				rd.include(request, response);
				
			}

		}
		  if(action.equals("viewStores"))
			{
		             HttpSession session=request.getSession();
		             String city=request.getParameter("city");
		             System.out.println(city);
		             ArrayList<Store> storeList=new ArrayList<Store>();
		             storeList=userService.getStores(city);
		             if(storeList.size()==0)
		                {out.print("<h4> No stores found!  </h4>");
		            	 RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
		 				rd.include(request, response);	
		                }
		               else
		               {
		            	 session.setAttribute("stores",storeList);
		            	 RequestDispatcher rd = request.getRequestDispatcher("StoresPage.jsp");
			 			 rd.forward(request, response);	
		               }
		   
			}
		
	}
}

		


