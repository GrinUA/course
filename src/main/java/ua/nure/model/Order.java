package ua.nure.model;

import java.util.Date;


public class Order {

	private String id;
	private String userId;

	private  String userFullName;

	private String tourId;
	private  String tourName;
	private Status status;
	private Date orderDate;
	private Double bill;


	public String getTourName() {
		return tourName;
	}



	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTourId() {
		return tourId;
	}

	public void setTourId(String tourId) {
		this.tourId = tourId;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Double getBill() {
		return bill;
	}

	public void setBill(Double bill) {
		this.bill = bill;
	}

	@Override
	public String toString() {
		return "Order{" +
				"id='" + id + '\'' +
				", userId='" + userId + '\'' +
				", userFullName='" + userFullName + '\'' +
				", tourId='" + tourId + '\'' +
				", tourName='" + tourName + '\'' +
				", status=" + status +
				", orderDate=" + orderDate +
				", bill=" + bill +
				'}';
	}
}
