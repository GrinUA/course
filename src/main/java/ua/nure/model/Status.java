package ua.nure.model;

public enum Status {
	REGISTERED("Registered"),
	PAID("Paid"),
	CANCELED("Canceled");

	Status(String name) {
		this.name = name;
	}

	private final String name;

	public String getName() {
		return name;
	}
}
