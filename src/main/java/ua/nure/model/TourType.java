package ua.nure.model;

public enum TourType {
	REST("Rest"),
	EXCURSION("Excursion"),
	SHOPPING("Shopping");

	TourType(String name) {
		this.name = name;
	}

	private final String name;

	public String getName() {
		return name;
	}
}
