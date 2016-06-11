package com.oms.bean;

public class Suggestion 
{
   private String title;
   private String album;
   public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getAlbum() {
	return album;
}
public void setAlbum(String album) {
	this.album = album;
}
public int getNoOfSuggestions() {
	return noOfSuggestions;
}
public void setNoOfSuggestions(int noOfSuggestions) {
	this.noOfSuggestions = noOfSuggestions;
}
private int noOfSuggestions=0;
}
