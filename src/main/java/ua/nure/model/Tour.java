package ua.nure.model;


public class Tour{

	private String id;
	private String name;
	private String country;
	private String place;
	private TourType tourType;
	private Integer peopleCount;
	private HotelType hotelType;
	private Integer stars;
	private Integer price;
	private Boolean hot;
	private String img;
	private Boolean actived;


	@Override
	public String toString() {
		return "Tour{" +
				"name='" + name + '\'' +
				", country='" + country + '\'' +
				", place='" + place + '\'' +
				", tourType=" + tourType +
				", peopleCount=" + peopleCount +
				", hotelType=" + hotelType +
				", stars=" + stars +
				", price=" + price +
				", hot=" + hot +
				", img='" + img + '\'' +
				", actived=" + actived +
				'}';
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public TourType getTourType() {
		return tourType;
	}

	public void setTourType(TourType tourType) {
		this.tourType = tourType;
	}

	public Integer getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(Integer peopleCount) {
		this.peopleCount = peopleCount;
	}

	public HotelType getHotelType() {
		return hotelType;
	}

	public void setHotelType(HotelType hotelType) {
		this.hotelType = hotelType;
	}

	public Integer getStars() {
		return stars;
	}

	public void setStars(Integer stars) {
		this.stars = stars;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Boolean getHot() {
		return hot;
	}

	public void setHot(Boolean hot) {
		this.hot = hot;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Boolean getActived() {
		return actived;
	}

	public void setActived(Boolean actived) {
		this.actived = actived;
	}
}
