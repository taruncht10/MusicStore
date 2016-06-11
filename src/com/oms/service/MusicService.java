package com.oms.service;

import java.util.ArrayList;

import com.oms.DAO.MusicDAO;
import com.oms.bean.Music;
import com.oms.bean.Suggestion;

public class MusicService {

	MusicDAO musicDAO = new MusicDAO();
	public int addMusic(Music music) 
	{
		int added = 0;
		
		added = musicDAO.addMusic(music);
		
		return added;
	}

	public Music readMusic(int musicID) {
		
		Music music = new Music();
		music = musicDAO.readMusic(musicID);
				return music;
	}

	public boolean deleteMusic(int musicID) 
	{
		boolean musicDeleted = false;
		musicDeleted = musicDAO.deleteMusic(musicID);
		return musicDeleted;
	}

	public Music editMusic(int musicID) {
		Music music = new Music();
		music = musicDAO.editMusic(musicID);
		return music;
	
	}

	public boolean musicAvailability(int musicID) {
		
		boolean musicAvailability = false;
		
		musicAvailability = musicDAO.musicAvailability(musicID);
		
		return musicAvailability;
	}

	public boolean updateMusic(int musicID, Music music) {
		// TODO Auto-generated method stub
		boolean musicUpdated = false;
		
		musicUpdated = musicDAO.updateMusic(musicID,music);
		
		return musicUpdated;
	}
	
	public ArrayList<Music> numberOfMusic() {
		// TODO Auto-generated method stub
		MusicDAO musicDAO = new MusicDAO();
		ArrayList<Music> listOfMusic = new ArrayList<Music>();
		listOfMusic = musicDAO.numberOfMusic();
		//System.out.println("numberOfMusic in service = " + numberOfMusic);
		return listOfMusic;
		
	}

	public ArrayList<Music> listOfFilteredMusic(String attribute,String value) {
		// TODO Auto-generated method stub
		MusicDAO musicDAO = new MusicDAO();
		ArrayList<Music> listOfFilteredMusic = new ArrayList<Music>();
		listOfFilteredMusic = musicDAO.listOfFilteredMusic(attribute,value);
		System.out.println("No. in service = " + listOfFilteredMusic.size());
 		return listOfFilteredMusic;
	}

	
	
	public ArrayList<Suggestion> ViewSuggestion()
	{
		return musicDAO.ViewSuggestion();
	}

}
