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

import com.oms.bean.Music;
import com.oms.bean.Suggestion;
import com.oms.bean.User;
import com.oms.service.MusicService;

public class MusicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MusicService musicService = new MusicService();
protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
{
   request.setAttribute("Error","No TailGating");
   RequestDispatcher rd= request.getRequestDispatcher("ErrorPage.jsp"); 
   rd.forward(request,response);
}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
                response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
	//---------------------------------------------------------------------------------
		if (action.equals("create")) {
			Music music = new Music();

			music.setMrmid(user.getUserID());
			music.setMusicTitle(request.getParameter("musicTitle").toLowerCase());
			music.setAlbumName(request.getParameter("albumName").toLowerCase());
			music.setArtist(request.getParameter("artist").toLowerCase());
			music.setMusicDirector(request.getParameter("musicDirector"));
			music.setLanguage(request.getParameter("language"));
			music.setType(request.getParameter("musicType"));
			music.setGenre(request.getParameter("genre"));

			
			music.setOnlinePrice(Integer.parseInt(request.getParameter("OnlinePrice")));
			music.setDiscount(Integer.parseInt(request.getParameter("DiscountPrice")));
			
			music.setAvailability(request.getParameter("availability"));
			music.setListings(request.getParameter("listings"));
			music.setAwards(request.getParameter("awards"));
			music.setCoverImage(request.getParameter("coverImageFile"));
			music.setSampleMusic(request.getParameter("sampleMusicFile"));

			int added = musicService.addMusic(music);
			if (added>0) 
			{out.print("<center><div><h4> Music registerd successfully. ID is" +added+"</h4></div></center>");
			     
                 RequestDispatcher rd=request.getRequestDispatcher("SecondHomePage.jsp");
                 rd.include(request, response);
                 
			} 
			else 
			{   out.print("<center><div><h4> Music registration failed  </h4></div></center>");
				RequestDispatcher rd=request.getRequestDispatcher("MusicRegistrationPage.jsp");
                rd.include(request,response);
			}
		}

		//---------------------------------------------------------------------------------------------
		if (action.equals("read")) {
			int musicID = Integer.parseInt(request.getParameter("musicToViewDetails"));
			Music music = new Music();
			boolean musicAvailability = false;
			musicAvailability = musicService.musicAvailability(musicID);
			if (musicAvailability == true)
			{
				music = musicService.readMusic(musicID);
			    if (music != null) 
			    {
                      session.setAttribute("music",music);
                      RequestDispatcher rd=request.getRequestDispatcher("viewSavedMusic.jsp");
                      rd.forward(request, response);
                } 
			    
			}
			else
			{   out.print("<h4> Sorry the music is not available  </h4>");
				 RequestDispatcher rd=request.getRequestDispatcher("ViewMusic.jsp");
                 rd.include(request, response);				
			}
		}

		//----------------------------------------------------------------------------------------------
		if (action.equals("delete")) {
			boolean musicDeleted = false;
			int musicID = Integer.parseInt(request.getParameter("musicToBeDeleted"));
			boolean musicAvailability = false;
			musicAvailability = musicService.musicAvailability(musicID);
			if (musicAvailability == true)
			{
				musicDeleted = musicService.deleteMusic(musicID);
				if (musicDeleted) 
			    {
out.print("<h4> Music is deleted successfully  </h4>");
				   RequestDispatcher rd=request.getRequestDispatcher("SecondHomePage.jsp");
                   rd.include(request, response);
			    }
			    else 
			    {   out.print("<h4> Music deletion failure  </h4>");
				   RequestDispatcher rd=request.getRequestDispatcher("deleteMusic.jsp");
                   rd.include(request, response);
			    }
			}
			 else 
			    {     out.print("<h4> Music is not available</h4>");
				   RequestDispatcher rd=request.getRequestDispatcher("deleteMusic.jsp");
                   rd.include(request, response);
			    }
				
		}

		//------------------------------------------------------------------------------------------------
		if (action.equals("edit")) 
		{
			boolean musicAvailability = false;
			int musicID = Integer.parseInt(request.getParameter("musicToEdit"));
			Music music = new Music();

			musicAvailability = musicService.musicAvailability(musicID);
			if (musicAvailability == true) {
				music = musicService.editMusic(musicID);
				request.setAttribute("musicTitle", music.getMusicTitle());
				request.setAttribute("albumName", music.getAlbumName());
				request.setAttribute("artist", music.getArtist());
				request.setAttribute("musicDirector", music.getMusicDirector());
				request.setAttribute("language", music.getLanguage());
				request.setAttribute("listings", music.getListings());
				request.setAttribute("awards", music.getAwards());
				request.setAttribute("music", music);
				request.setAttribute("musicID", musicID);
				RequestDispatcher rd = request.getRequestDispatcher("editMusicPage.jsp");
				rd.forward(request, response);

			} 
			else {out.print("<h4> Music is not available  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("editMusic.jsp");
				rd.include(request, response);
			}
		}
//------------------------------------------------------------------------------------------------------------
		if (action.equals("update")) {
			boolean musicUpdated = false;
			int musicID = Integer.parseInt(request.getParameter("musicID"));

			Music music = new Music();
			music.setMusicTitle(request.getParameter("musicTitle"));
			music.setAlbumName(request.getParameter("albumName"));
			music.setArtist(request.getParameter("artist"));
			music.setMusicDirector(request.getParameter("musicDirector"));
			music.setLanguage(request.getParameter("language"));
			music.setType(request.getParameter("musicType"));
			music.setGenre(request.getParameter("genre"));

			
			
			music.setOnlinePrice(Integer.parseInt(request.getParameter("OnlinePrice")));
			music.setDiscount(Integer.parseInt(request.getParameter("DiscountPrice")));
			
			music.setAvailability(request.getParameter("availability"));
			music.setListings(request.getParameter("listings"));
			music.setAwards(request.getParameter("awards"));

			MusicService musicService = new MusicService();
			musicUpdated = musicService.updateMusic(musicID, music);
			if(musicUpdated)
			{
                                out.print("<h4> Music is updated successfully  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("SecondHomePage.jsp");
				rd.include(request, response);
			}
			else
			{       out.print("<h4> Music updation failure  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("editMusicPage.jsp");
				rd.include(request, response);
			}
		}

//--------------------------------------------------------------------------------------------------------
		
		if (action.equals("filter")) {
			int radioValue = Integer.parseInt(request.getParameter("filter"));
			String passValue = request.getParameter("pass").toLowerCase();
			String passGen = request.getParameter("gen");
			String passLang = request.getParameter("lang");
			String value = null;
			String attribute =null;

			switch (radioValue) {
			case 1: {
				value = passValue;
				attribute = "title";
				break;
			}
			case 2: {
				attribute = "albumname";
				value = passValue;
				break;
			}

			case 3: {
				attribute = "artist";
				value = passValue;
				break;
			}

			case 4: {
				attribute = "language";
				value = passLang;
				break;
			}
	case 5: {
				attribute = "genre";
				value = passGen;
				break;

			}
			
			default :{
				value = null;
				break;
			}
			}
			
			ArrayList<Music> listOfFilteredMusic = new ArrayList<Music>();
			MusicService musicService = new MusicService();
			listOfFilteredMusic = musicService.listOfFilteredMusic(attribute,value);
			if(listOfFilteredMusic.size()>0)
			{
			    session=request.getSession();
			    session.setAttribute("listOfFilteredMusic", listOfFilteredMusic);
			    RequestDispatcher rd = request.getRequestDispatcher("viewFilteredMusicList.jsp");
			    rd.forward(request, response);
			}
			else
			{
                              out.print("<h4> No music found  </h4>");
				RequestDispatcher rd = request.getRequestDispatcher("filterMusic.jsp");
			    rd.include(request, response);
			}
			
		}
	//----------------------------------------------------------------------------------------------------------	
	if(action.equals("ViewSuggestions"))
	{
		ArrayList<Suggestion> sugList=new ArrayList<Suggestion>();
		sugList=musicService.ViewSuggestion();
		if(sugList.size()==0)
		{
                        out.print("<h4> No suggestions available  </h4>");
			RequestDispatcher rd = request.getRequestDispatcher("MRMMusicReg.jsp");
		    rd.include(request, response);
		}
		else
		{
			{
				session=request.getSession();
				session.setAttribute("sugList",sugList);
				RequestDispatcher rd = request.getRequestDispatcher("SuggestionsList.jsp");
			    rd.include(request, response);
			}
		}
			
	}
	
	}	
}
