package com.oms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oms.bean.Music;
import com.oms.bean.Order;
import com.oms.bean.User;
import com.oms.service.OrderService;

public class OrderManagementController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    OrderService orderService=new OrderService();
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
{
   request.setAttribute("Error","No TailGating");
   RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
   rd.forward(request,response);
}
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	
		//---------------------------------------------------------------------
		if (action.equals("Download")) 
		{   System.out.println(request.getParameter("val"));
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			User user=(User)session.getAttribute("user");
			if(user!=null)
			{
			   ArrayList<Music> musicl = (ArrayList<Music>) session.getAttribute("listOfFilteredMusic");
	
			int i = 0;
			for (Music music : musicl) 
			{
				i = i + 1;
				if (i == value) 
				{
					Order order=new Order();
					order.setMusicId(1,music.getMusicID());
			        order.setDelivery_type("load");
			        order.setTitle(music.getMusicTitle());
			        order.setStatus("downloaded");
			        order.setUserID(user.getUserID());
			        order.setQuantity(1,1);
			        order.setDeliveryAddress(null);
			        int price=music.getOnlinePrice()-music.getDiscount();
			        System.out.println(music.getOnlinePrice());
			        System.out.println(music.getDiscount());
			        order.setPayment(price*order.getQuantity(1));
			        order.setMusicLink(music.getSampleMusic());
					session.setAttribute("order", order);
					session.setAttribute("Amount", music.getOnlinePrice());
					
				    RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp");
				    rd.forward(request, response);
			    }
			}
			}
			else
			{
                out.print("<h4> Login to proceed  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("Authentication.jsp");
			    rd.include(request, response);
			}
		}
		if (action.equals("HomeDelivery")) 
		{
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			User user=(User)session.getAttribute("user");
			if(user!=null)
			{
			    ArrayList<Music> musicl = (ArrayList<Music>) session.getAttribute("listOfFilteredMusic");
	    		int i = 0;
			   for (Music music : musicl) 
			   {
				  i = i + 1;
				  if (i == value) 
				  {
					session.setAttribute("musicDelivery", music);
				    RequestDispatcher rd = request.getRequestDispatcher("HomeDeliveryDetails.jsp");
				    rd.forward(request, response);
			      }
			   }
			}
			else
			{
			    out.print("<h4> Login to proceed  </h4>");	
                            RequestDispatcher rd = request.getRequestDispatcher("Authentication.jsp");
			    rd.include(request, response);
			}	
		}
		if (action.equals("HomeDeliveryDetails")) 
		{
			session = request.getSession();
			Music music =(Music) session.getAttribute("musicDelivery");
			User user=(User)session.getAttribute("user");
	        Order order=new Order();
	        order.setDelivery_type("Deliv");
	        order.setTitle("musicDelivery.getMusicTitle()");
	        order.setStatus("Pending");
	        order.setUserID(user.getUserID());
            order.setMusicId(1,music.getMusicID());
	        order.setQuantity(1,Integer.parseInt(request.getParameter("Quantity")));
	        int price=music.getOnlinePrice()-music.getDiscount();
	        order.setPayment(price*order.getQuantity(1));
	        order.setDeliveryAddress(request.getParameter("DeliveryAddress"));
			session.setAttribute("order", order);
					session.setAttribute("musicDownload", music);
				    RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp");
				    rd.forward(request, response);
			   
		}
		
		//--------------------------------------------------------------------------
		
		if (action.equals("Payment")) 
		{
			session = request.getSession();
	
			Order order=(Order)session.getAttribute("order");
			
	        order.setCard_type(request.getParameter("type"));
	        order.setCardNumber(Long.parseLong(request.getParameter("number")));
	        order.setName_on_card(request.getParameter("name"));
	        order.setPaymentStatus("Paid");
			order=orderService.placeOrder(order);
	        session.setAttribute("order", order);
			if(order.getOrderId()<1)
			{
				out.print("<h4> Payment failure </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
				rd.include(request, response);
			}
			else
			{
				if(order.getDelivery_type().equals("load"))
				{
					request.setAttribute("musicLink",order.getMusicLink());
					request.setAttribute("musicTitle", order.getTitle());
					request.setAttribute("downloaded","false");
				
					RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
					rd.forward(request, response);
				}
				else{
                                        out.print("<h4> Payment success. Your order id is"+order.getOrderId()+" </h4>");
					RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
					rd.include(request, response);
				}
			}
				
		}
		
		if(action.equals("viewHistory"))
				{
			             session=request.getSession();
			             User user=(User)session.getAttribute("user");
			             if(user.getUserName().equals(request.getParameter("username")))
			             {
			            	 ArrayList<Order> orderList=new ArrayList<Order>();
			                 orderList=orderService.getHistory(user);
			                 if(orderList.size()==0)
			                {  out.print("<h4> No orders found! </h4>");
			            	 RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
			 				rd.include(request, response);	
			                }
			               else
			               {
			            	 session.setAttribute("orderHistory",orderList);
			            	 RequestDispatcher rd = request.getRequestDispatcher("OrderHistoryPage.jsp");
				 			 rd.forward(request, response);	
			               }
			             }
			             else
			             {   out.print("<h4> Enter correct user name  </h4>");
			            	 RequestDispatcher rd = request.getRequestDispatcher("ConfirmUser.jsp");
				 			 rd.include(request, response);	
			             }
			            	 
				}

//-----------------------------------
                             if(action.equals("viewOrders"))
				{
			             session=request.getSession();
			             String status=request.getParameter("status");
                            String type="Deliv";
			             ArrayList<Order> orderList=new ArrayList<Order>();
			             orderList=orderService.getOrders(status,type);
			             if(orderList.size()==0)
			                {out.print("<h4> No orders found!  </h4>");
			            	 RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
			 				rd.include(request, response);	
			                }
			               else
			               {
			            	 session.setAttribute("orderHistory",orderList);
			            	 RequestDispatcher rd = request.getRequestDispatcher("OrdersPage.jsp");
				 			 rd.forward(request, response);	
			               }
			   
				}
//--------------------------------------------------------------------------------
		
		if(action.equals("Cancel"))
		{
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderHistory");
					
			int i = 0;
			for (Order order:orderList) 
			{
				i = i + 1;
				if (i == value) 
				{
					boolean status=orderService.cancelOrder(order);
					if(status==true)
					{    out.print("<h4> Order cancelled successfully  </h4>");
						RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
						rd.include(request, response);
					}
					else
					{      out.print("<h4> Order is not cancelled  </h4>");
						RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
						rd.include(request, response);
					}
				 break;		
				}
			}
			
		}
//-----------------------------------------------------------------------------------
               if(action.equals("ChangeStatus"))
		{
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderHistory");
					
			int i = 0;
			for (Order order:orderList) 
			{
				i = i + 1;
				if (i == value) 
				{
					session.setAttribute("orderChange",order);
					RequestDispatcher rd = request.getRequestDispatcher("GetStatus.jsp");
					rd.include(request, response);
					 break;		
				}
			}
			
		}

                if(action.equals("saveStatus"))
		{
			session = request.getSession();
			Order order= (Order) session.getAttribute("orderChange");
			order.setStatus(request.getParameter("status"));
                        boolean saved=orderService.saveStatus(order);
					if(saved==true)
					{     out.print("<h4> Status is updated  </h4>");
						RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
						rd.include(request, response);
					}
					else
					{   out.print("<h4> Status updation failure  </h4>");
						RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
						rd.include(request, response);
					}		
			
					}
			
			
		


		if(action.equals("AddToCart"))
		{
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			User user=(User)session.getAttribute("user");
			if(user!=null)
			{
			   ArrayList<Music> musicl = (ArrayList<Music>) session.getAttribute("listOfFilteredMusic");
			boolean added=false;		
			int i = 0;
			for (Music music : musicl) 
			{
				i = i + 1;
				if (i == value) 
				{
					if(user.getCartList().size()<3)
					{
						   user.getCartList().add(music);
						   added=true;
					}	   
				}
			}
			session.setAttribute("cartList", user.getCartList());
			if(added==true)
			{    out.print("<h4> Music is added to cart  </h4>");
		     	RequestDispatcher rd = request.getRequestDispatcher("CartList.jsp");
			     rd.include(request, response);
			}
			else
			{      out.print("<h4> Cart is full  </h4>");
		     	RequestDispatcher rd = request.getRequestDispatcher("CartList.jsp");
			     rd.include(request, response);
			}
			}
			else
			{       out.print("<h4> Login to proceed  </h4>");
 				RequestDispatcher rd = request.getRequestDispatcher("Authentication.jsp");
			     rd.include(request, response);
				
			}
				
		}
		
		if(action.equals("Remove"))
		{
			int value = Integer.parseInt(request.getParameter("val"));
			session = request.getSession();
			User user=(User)session.getAttribute("user");
			ArrayList<Music> musicl = (ArrayList<Music>) session.getAttribute("listOfFilteredMusic");
					
			int i = 0;
			for (Music music : musicl) 
			{
				i = i + 1;
				if (i == value) 
				{
					user.getCartList().remove(music);
				}
			}
			session.setAttribute("cartList", user.getCartList());
			if(user.getCartList().size()>0)
			{
				RequestDispatcher rd = request.getRequestDispatcher("CartList.jsp");
				rd.forward(request, response);
			}
			else
			{
			RequestDispatcher rd = request.getRequestDispatcher("viewFilteredMusicList.jsp");
			rd.forward(request, response);
			}
		}
		if(action.equals("PurchaseCart"))			
		{
			session = request.getSession();
			ArrayList<Music> musicl = (ArrayList<Music>) session.getAttribute("cartList");
			User user=(User)session.getAttribute("user");
			int i = 0;
			Order order=new Order();
			order.setDelivery_type("Deliv");
	        order.setStatus("Pending");
	        order.setUserID(user.getUserID());
	              
	        order.setDeliveryAddress(request.getParameter("DeliveryAddress"));
							    
			int sum_qty=0;	
			int price=0;
			for (Music music : musicl) 
			{
				i = i + 1;
				String name="Quantity"+i;
				int qty=Integer.parseInt(request.getParameter(name));
				sum_qty=sum_qty+qty;
				price=price+((music.getOnlinePrice()-music.getDiscount())*qty);
                                order.setQuantity(i,qty);
                                order.setMusicId(i,music.getMusicID());
			}
			order.setPayment(price);
			session.setAttribute("order", order);
			RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp");
		    rd.forward(request, response);
		}
		
		
	}


}
