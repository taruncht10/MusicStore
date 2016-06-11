package com.oms.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oms.DBUtill.ConnectionManager;
import com.oms.bean.Music;
import com.oms.bean.Suggestion;

public class MusicDAO {

	public int addMusic(Music music) 
	{
		Connection conn = null;
		conn = ConnectionManager.getConnection();
		PreparedStatement ps = null;
		
		boolean addedR = false;
		

		try {
			
			ps=conn.prepareStatement("insert into music values(musicid_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,music.getMrmid());
			
			ps.setString(2, music.getMusicTitle());
			ps.setString(3, music.getAlbumName());
			ps.setString(4, music.getArtist());
			ps.setString(5, music.getLanguage());
			
			
			ps.setString(6, music.getType());
			ps.setString(7, music.getGenre());

			ps.setInt(8, music.getOnlinePrice());
			ps.setInt(9, music.getDiscount());
			ps.setString(10, music.getAvailability());
			ps.setString(11, music.getListings());
			ps.setString(12, music.getAwards());
			ps.setString(13, music.getCoverImage());
			ps.setString(14, music.getSampleMusic());
			ps.setString(15, music.getMusicDirector());
			int added=ps.executeUpdate();
			System.out.println(added);
			if(added==1)
			{
				addedR=true;
			}
			else
				addedR=false;
			ps=conn.prepareStatement("select musicid_seq.currval from dual");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				music.setMusicID(rs.getInt(1));
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return music.getMusicID();
	}

	public Music readMusic(int musicID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = ConnectionManager.getConnection();
		
		
		Music music = new Music();

		try {
						
			ps=conn.prepareStatement("select  music_Id,MRM_id,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award from music where music_ID = ?");
			ps.setInt(1, musicID);
			rs=ps.executeQuery();
			
			if(rs.next()){
				music.setMusicID(rs.getInt(1));
				music.setMrmid(rs.getInt("MRM_Id"));				
				music.setMusicTitle(rs.getString("Title"));
				music.setAlbumName(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setMusicDirector(rs.getString("music_Director"));
				music.setLanguage(rs.getString("language"));
				music.setType(rs.getString("type"));
				music.setGenre(rs.getString("genre"));
				//music.setFormat(rs.getString("format"));
				music.setOnlinePrice(rs.getInt("online_Price"));
				music.setDiscount(rs.getInt("discount"));
				music.setAvailability(rs.getString("availability"));
				music.setListings(rs.getString("listing"));
				music.setAwards(rs.getString("award"));
				
			}
			
			

		}  catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				//rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return music;
	}

	public boolean deleteMusic(int musicID) {
		
		Connection conn = null;
		conn=ConnectionManager.getConnection();
		PreparedStatement ps = null;
		
	
		boolean musicDeleted = false;

		try {
					
			ps=conn.prepareStatement("delete from music where music_ID = ?");
			ps.setInt(1, musicID);
			
			int deleted = ps.executeUpdate();
			
			if(deleted>0)
			{
				musicDeleted = true;
			}
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return musicDeleted;
	}

	public boolean musicAvailability(int musicID) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn=ConnectionManager.getConnection();
		
		boolean musicAvailability = false;

		try {
			
			ps=conn.prepareStatement("select Title from music where music_ID = ?");
			ps.setInt(1, musicID);
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				
				musicAvailability = true;
			}	
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return musicAvailability;
	}

	public Music editMusic(int musicID) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn=ConnectionManager.getConnection();
		Music music = new Music();

		try {
				
			ps=conn.prepareStatement("select  music_Id,MRM_Id,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award from music where music_ID = ?");
			ps.setInt(1, musicID);
			rs=ps.executeQuery();
			
			if(rs.next()){
			
				
				music.setMrmid(rs.getInt("MRM_Id"));
				music.setMusicTitle(rs.getString("Title"));
				music.setAlbumName(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setMusicDirector(rs.getString("music_Director"));
				music.setLanguage(rs.getString("language"));
				music.setType(rs.getString("type"));
				music.setGenre(rs.getString("genre"));
				
				music.setOnlinePrice(rs.getInt("online_Price"));
				music.setDiscount(rs.getInt("discount"));
				music.setAvailability(rs.getString("availability"));
				music.setListings(rs.getString("listing"));
				music.setAwards(rs.getString("award"));
		
			}
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return music;

	}

	public boolean updateMusic(int musicID, Music music) {
		
		Connection conn = null;
		PreparedStatement ps = null;
	
		boolean musicUpdated = false;
		conn=ConnectionManager.getConnection();
		
		

		try {
						
			ps=conn.prepareStatement("update music set TITLE=?,ALBUM=?,ARTIST=?,MUSIC_DIRECTOR=?,LANGUAGE=?,TYPE=?,GENRE=?,ONLINE_PRICE=?, DISCOUNT=?,AVAILABILITY=?, LISTING=?,AWARD=? where music_ID=?");
			
			ps.setString(1, music.getMusicTitle());
			ps.setString(2, music.getAlbumName());
			ps.setString(3, music.getArtist());
			ps.setString(4, music.getMusicDirector());
			ps.setString(5, music.getLanguage());
			ps.setString(6, music.getType());
			ps.setString(7, music.getGenre());
			
			ps.setDouble(8, music.getOnlinePrice());
			ps.setDouble(9, music.getDiscount());
			ps.setString(10, music.getAvailability());
			ps.setString(11, music.getListings());
			ps.setString(12, music.getAwards());
			ps.setInt(13, musicID);
			int a = ps.executeUpdate();
			
			if(a>0){
				musicUpdated = true;
			}
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				//rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return musicUpdated;
	}

	public ArrayList<Music> numberOfMusic() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn=ConnectionManager.getConnection();

		ArrayList<Music> listOfMusic = new ArrayList<Music>();
		
		

		try {
						
			ps=conn.prepareStatement("select title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music ");
			rs=ps.executeQuery();
			
			while(rs.next()){
				System.out.println("inside condition");
				Music music = new Music();
				music.setMusicTitle(rs.getString("Title"));
				music.setAlbumName(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setMusicDirector(rs.getString("music_Director"));
				music.setLanguage(rs.getString("language"));
				music.setType(rs.getString("type"));
				music.setGenre(rs.getString("genre"));
				
				music.setOnlinePrice(rs.getInt("online_Price"));
				music.setDiscount(rs.getInt("discount"));
				music.setAvailability(rs.getString("availability"));
				music.setListings(rs.getString("listing"));
				music.setAwards(rs.getString("award"));
				music.setCoverImage(rs.getString("IMAGE_URL"));
				music.setSampleMusic(rs.getString(("MUSIC_URL")));
					
				listOfMusic.add(music);
				
			}
			
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return listOfMusic;
	}

	public ArrayList<Music> listOfFilteredMusic(String attribute,String value) {
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		conn=ConnectionManager.getConnection();
		
		ArrayList<Music> listOfFilteredMusic = new ArrayList<Music>();
		
		

		try {
			System.out.println("in dao");
				if(attribute.equals("title"))	{
					ps=conn.prepareStatement("select music_ID,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music where title=?");
					ps.setString(1,value);
				}
				else if (attribute.equals("albumname")){
					ps=conn.prepareStatement("select music_ID,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music where album=?");
					ps.setString(1, value);
				}
				else if(attribute.equals("artist")){
					ps=conn.prepareStatement("select music_ID,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music where artist=?");
					ps.setString(1, value);
				}
				else if(attribute.equals("language")){
					ps=conn.prepareStatement("select music_ID,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music where language=?");
					ps.setString(1, value);
				}
				else if(attribute.equals("genre"))
				{
					ps=conn.prepareStatement("select music_ID,title,album,artist,music_director,language,type,genre,online_price,discount,availability,listing,award,Image_URL,Music_URL from music where genre=?");
					ps.setString(1, value);
				}
				
			
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				System.out.println("inside condition");
				Music music = new Music();
				music.setMusicID(rs.getInt("music_ID"));
				music.setMusicTitle(rs.getString("Title"));
				music.setAlbumName(rs.getString("album"));
				music.setArtist(rs.getString("artist"));
				music.setMusicDirector(rs.getString("music_Director"));
				music.setLanguage(rs.getString("language"));
				music.setType(rs.getString("type"));
				music.setGenre(rs.getString("genre"));
				
				music.setOnlinePrice(rs.getInt("online_Price"));
				music.setDiscount(rs.getInt("discount"));
				music.setAvailability(rs.getString("availability"));
				music.setListings(rs.getString("listing"));
				music.setAwards(rs.getString("award"));
				music.setCoverImage(rs.getString("IMAGE_URL"));
				music.setSampleMusic(rs.getString(("MUSIC_URL")));
					
			
				listOfFilteredMusic.add(music);
				
			}
			
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				//rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		System.out.println("in dao : listOfFilteredMusic = " +  listOfFilteredMusic.size());
		return listOfFilteredMusic;
	}

	
	public ArrayList<Suggestion> ViewSuggestion()
	{
	   Connection con = null;
       ArrayList<Suggestion> sugList=new ArrayList<Suggestion>();
	   PreparedStatement Ps2 = null;
	   ResultSet rs = null;
	   con = ConnectionManager.getConnection();

	String query1 = "select  * from  Suggestion order by NumberOfSuggestion desc";
	try {
		Ps2 = con.prepareStatement(query1);
		rs = Ps2.executeQuery();
		while (rs.next())
		{
            Suggestion sug=new Suggestion();
			sug.setAlbum(rs.getString(1));
			sug.setTitle(rs.getString(2));
			sug.setNoOfSuggestions(rs.getInt(3));
	        sugList.add(sug);
		}
	} catch (SQLException e) {
		System.out.println("exception occurs");
		e.printStackTrace();
	}
	finally{
		ConnectionManager.closeConnection(con);
		ConnectionManager.closeResultSet(rs);
		ConnectionManager.closePreparedStatement(Ps2);
		
	}
	return sugList;
	}
   }
