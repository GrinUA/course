package ua.nure.model;

public enum Status {
	REGISTERED("registered"),
	PAID("paid"),
	CANCELED("canceled");

	Status(String name) {
		this.name = name;
	}

	private final String name;

	public String getName() {
		return name;
	}
}
