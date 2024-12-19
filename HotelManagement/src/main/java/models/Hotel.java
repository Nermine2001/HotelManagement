package models;

import java.io.Serializable;

public class Hotel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String city;
	private int stars;
	private String description;
	private String Image;
	//not exist in th db tabel
	private String roomtype;
	private int price;
	
	//constructor using fields
	public Hotel(int id, String name, String city, int stars, String description, String image) {
		super();
		this.id = id;
		this.name = name;
		this.city = city;
		this.stars = stars;
		this.description = description;
		Image = image;
	}

	public Hotel(String name, String city, int stars, String description, String image) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.city = city;
		this.stars = stars;
		this.description = description;
		Image = image;
	}

	public Hotel(int id) {
		// TODO Auto-generated constructor stub
		this.id = id;
	}

	public Hotel(int id, String name, String city, int stars, String description, String image, String roomtype, int price) {
		// TODO Auto-generated constructor stub
		this.id = id;
	    this.name = name;
	    this.city = city;
	    this.stars = stars;
	    this.description = description;
	    this.Image = image;
	    this.roomtype = roomtype;
	    this.price = price;
	}

	//getters & setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}
	
	
	
	
	

}
