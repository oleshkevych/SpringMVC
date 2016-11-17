package ua.com.bestZoo.entity;

/**
 * Created by vov4ik on 11/2/2016.
 */
public enum AnimalType {
    CHEEP("cheep"), AVERAGE("average"), EXPANSIVE("expansive");
    private String texts;

    private AnimalType(String texts) {
        this.texts = texts;
    }

    public String getTexts() {
        return this.texts;
    }
}
