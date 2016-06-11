package com.oms.bean;

public class Order
{   
	private  int userID=0;
	private int Payment;
	private int orderId;
	private int[] MusicId={0,0,0};
	private String title;
	private int[] quantity={0,0,0};
	private String orderDate;
	private String delivery_type;
	private String status;
	private String deliveryAddress;
	private long cardNumber;
	private String card_type;
	private String name_on_card;
	private String paymentStatus;
	private String LSP_Name;
	private String AWB_Number;
	private String musicLink;
	
	public String getMusicLink() {
		return musicLink;
	}
	public void setMusicLink(String musicLink) {
		this.musicLink = musicLink;
	}
	public String getLSP_Name() {
		return LSP_Name;
	}
	public void setLSP_Name(String lSPName) {
		LSP_Name = lSPName;
	}
	public String getAWB_Number() {
		return AWB_Number;
	}
	public void setAWB_Number(String aWBNumber) {
		AWB_Number = aWBNumber;
	}
	public int getMusicId(int i) 
        {
		return MusicId[i-1];
	}
	public void setMusicId(int i,int musicId) {
		MusicId[i-1] = musicId;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	public int getPayment() {
		return Payment;
	}
	public void setPayment(int d) {
		Payment = d;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getQuantity(int i) {
		return quantity[i-1];
	}
	public void setQuantity(int i,int quantity) {
		this.quantity[i-1] = quantity;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivery_type() {
		return delivery_type;
	}
	public void setDelivery_type(String deliveryType) {
		delivery_type = deliveryType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public long getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String cardType) {
		card_type = cardType;
	}
	public String getName_on_card() {
		return name_on_card;
	}
	public void setName_on_card(String nameOnCard) {
		name_on_card = nameOnCard;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	
}
