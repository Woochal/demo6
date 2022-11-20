package com.example.demo6.bean;

import java.util.Date;

public class hotelVO {
	private int Id;
	private String Name;
	private String Phone;
	private String RoomNum;
	private String Guests;
	private String CheckIn;
	private String CheckOut;
	private String Payment;
	private String photo;


	public int getId() {
		return Id;
	}
	public void setId(int Id) {
		this.Id = Id;
	}

	public String getName() { return Name; }

	public void setName(String Name) { this.Name = Name; }
	public String getPhone() { return Phone; }
	public void setPhone(String Phone) { this.Phone = Phone;	}
	public String getRoomNum() {
		return RoomNum;
	}
	public void setRoomNum(String RoomNum) {
		this.RoomNum = RoomNum;
	}
	public String getGuests() {
		return Guests;
	}
	public void setGuests(String Guests) {
		this.Guests = Guests;
	}
	public String getCheckIn() { return CheckIn; }
	public void setCheckIn(String CheckIn) {
		this.CheckIn =CheckIn;
	}
	public String getCheckOut() {
		return CheckOut;
	}
	public void setCheckOut(String CheckOut) {
		this.CheckOut =CheckOut;
	}
	public String getPayment() {
		return Payment;
	}
	public void setPayment(String Payment) {
		this.Payment =Payment;
	}

	public String getPhoto() { return photo; }
	public void setPhoto(String photo) { this.photo = photo; }

}
