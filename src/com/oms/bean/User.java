package com.oms.bean;


import java.util.ArrayList;



public class User {
	
	private int userID=0;
	private String userName;
	private int pwd;
	private String password;
	private String secretQuestion;
	private String secretAnswer;
	private int answer; 
	private String userType;
	private String firstName;
	private String lastName;
	private String gender;
	private String DOB;
	private String email;
	private long mobileNumber;
	private String mailingAddress;
	private String weeklyNewsletter;
	private String offersToMobile;
	ArrayList<Music> cartList = new ArrayList<Music>();
	
    
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public int getPwd() {
		return pwd;
	}
	public void setPwd(int pwd) {
		this.pwd = pwd;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSecretQuestion() {
		return secretQuestion;
	}
	public void setSecretQuestion(String secretQuestion) {
		this.secretQuestion = secretQuestion;
	}
	public String getSecretAnswer() {
		return secretAnswer;
	}
	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}public String getDOB() {
		return DOB;
	}
	public void setDOB(String DOB) {
		this.DOB = DOB;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getWeeklyNewsletter() {
		return weeklyNewsletter;
	}
	public void setWeeklyNewsletter(String weeklyNewsletter) {
		this.weeklyNewsletter = weeklyNewsletter;
	}
	public String getOffersToMobile() {
		return offersToMobile;
	}
	public void setOffersToMobile(String offersToMobile) {
		this.offersToMobile = offersToMobile;
	}
	public ArrayList<Music> getCartList() {
		return cartList;
	}
	public void setCartList(ArrayList<Music> cartList) {
		this.cartList = cartList;
	}
	
	public String getMailingAddress() {
		return mailingAddress;
	}
	public void setMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}

	public int hashCodePwd() {
		final int prime = 31;
		int result = 1;
		result = prime * result + password.charAt(0)+password.substring(1, password.length()).hashCode();
		return result;
	}
	
	public int hashCodeAns() {
		final int prime = 31;
		int result = 1;
		result = prime * result + secretAnswer.charAt(0)+secretAnswer.substring(1, secretAnswer.length()).hashCode();
		return result;
	}
	
	


		
		
		  
}
	  
  


