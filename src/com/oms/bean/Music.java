package com.oms.bean;

import java.util.ArrayList;

public class Music {
    private int mrmid;
	public int getMrmid() {
		return mrmid;
	}

	public void setMrmid(int mrmid) {
		this.mrmid = mrmid;
	}
    private int music_id = 0;
	private String musicTitle;
	private String albumName;
	private String artist;
	private String musicDirector;
	private String language;
	private String type;
	private String genre;
	//private String format;
	private ArrayList<Integer> listOfStore;
	
	private int OnlinePrice=0;
	private int Discount=0;

	private String availability;
	private String onlineAvailability;
	private String instockAvailability;
	private String listings=null;
	private String awards=null;
	private String coverImage=null;
	private String sampleMusic=null;
	
	
	
	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public String getSampleMusic() {
		return sampleMusic;
	}

	public void setSampleMusic(String sampleMusic) {
		this.sampleMusic = sampleMusic;
	}

	public int getMusicID() {
		return music_id;
	}

	public void setMusicID(int musicId) {
		music_id = musicId;
	}
	
	
	public String getMusicTitle() {
		return musicTitle;
	}

	public void setMusicTitle(String musicTitle) {
		this.musicTitle = musicTitle;
	}

	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public String getMusicDirector() {
		return musicDirector;
	}

	public void setMusicDirector(String musicDirector) {
		this.musicDirector = musicDirector;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	/*public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}*/

	public ArrayList<Integer> getListOfStore() {
		return listOfStore;
	}

	
	public int getOnlinePrice() {
		return OnlinePrice;
	}

	public void setOnlinePrice(int OnlinePrice) {
		this.OnlinePrice = OnlinePrice;
	}

	
	public int getDiscount() {
		return Discount;
	}

	public void setDiscount(int cdDiscount) {
		this.Discount = cdDiscount;
	}


	public void setListOfStore(ArrayList<Integer> listOfStore) {
		this.listOfStore = listOfStore;
	}

	public String getListings() {
		return listings;
	}

	public String isOnlineAvailability() {
		return onlineAvailability;
	}

	public void setOnlineAvailability(String onlineAvailability) {
		this.onlineAvailability = onlineAvailability;
	}

	public String isInstockAvailability() {
		return instockAvailability;
	}

	public void setInstockAvailability(String instockAvailability) {
		this.instockAvailability = instockAvailability;
	}

	public void setListings(String listings) {
		this.listings = listings;
	}

	public String getAwards() {
		return awards;
	}

	public void setAwards(String awards) {
		this.awards = awards;
	}
	
	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	
	
}
