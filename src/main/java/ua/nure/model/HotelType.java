package ua.nure.model;

public enum HotelType {
	CHAIN("Chain"),
	DESIGN("Design"),
	SKI("Ski"),
	SPA("Spa"),
	BOUTIQUE("Boutique"),
	GOLF("Golf");

	private final String name;

	HotelType(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
