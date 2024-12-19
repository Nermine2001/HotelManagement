package models;

import java.sql.Date;

public class Booking {
	private int id;
	private String name;
	private String email;
	private Date checkin;
	private Date checkout;
	private int num_adults;
	private int num_children;
	private int hotelId;
	private int roomId;
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Booking(int id, String name, String email, Date checkin, Date checkout, int num_adults, int num_children, int hotelId, int roomId) {
		super();
		this.id = id;
		this.name=name;
		this.email=email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.num_adults = num_adults;
		this.num_children = num_children;
		this.hotelId = hotelId;
		this.roomId = roomId;
	}
	public Booking(String name, String email, Date checkin, Date checkout, int num_adults, int num_children, int hotelId, int roomId) {
		super();
		this.name=name;
		this.email=email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.num_adults = num_adults;
		this.num_children = num_children;
		this.hotelId = hotelId;
		this.roomId = roomId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public int getNum_adults() {
		return num_adults;
	}
	public void setNum_adults(int num_adults) {
		this.num_adults = num_adults;
	}
	public int getNum_children() {
		return num_children;
	}
	public void setNum_children(int num_children) {
		this.num_children = num_children;
	}
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	
	

}
