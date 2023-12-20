package dev.domain;

public enum Gender {
    Male,
    Female;

    public static Gender fromString(String gender) {
        for (Gender value : Gender.values()) {
            if (value.name().equalsIgnoreCase(gender)) {
                return value;
            }
        }
        throw new IllegalArgumentException("No enum constant for gender: " + gender);
    }
}
