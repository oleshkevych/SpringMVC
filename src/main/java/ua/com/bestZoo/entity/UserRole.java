package ua.com.bestZoo.entity;

/**
 * Created by vov4ik on 11/2/2016.
 */
public enum UserRole {
    HUNTER("hunter"), NOTENOUGHSMART("random");
    private String texts;

    private UserRole(String texts) {
        this.texts = texts;
    }

    public String getTexts() {
        return this.texts;
    }
}
