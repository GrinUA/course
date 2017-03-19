package ua.nure.model;


public enum Role {
    USER("user"),
    ADMIN("admin");

    private final String name;

    Role(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    /*USER,
    ADMIN*/
}
