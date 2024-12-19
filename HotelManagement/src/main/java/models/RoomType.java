package models;

public class RoomType {
	
	private int id;
	private String label;
	private int capacity;
	private int price;
	private int hotelId;
	
	//constructor using fields
	public RoomType(int id, String label, int capacity, int price, int hotelId) {
		super();
		this.id = id;
		this.label = label;
		this.capacity = capacity;
		this.price = price;
		this.hotelId = hotelId;
	}

	
	public RoomType(String label, int capacity, int price, int hotelId) {
		// TODO Auto-generated constructor stub
		this.label = label;
		this.capacity = capacity;
		this.price = price;
		this.hotelId = hotelId;
	}


	public RoomType(int id) {
		// TODO Auto-generated constructor stub
		this.id = id;
	}


	public RoomType(int int1, String string, int int2, int int3) {
		// TODO Auto-generated constructor stub
	}


	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	//getters & setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	

}
