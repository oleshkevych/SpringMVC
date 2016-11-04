package ua.com.bestZoo.entity;

import javax.persistence.*;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Entity
public class Animal {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    private int age;
    private int price;
    private boolean alive;
    private String imagePath;
    private boolean forSale;



    @Enumerated
    private AnimalType animalType;

    @ManyToOne(fetch = FetchType.EAGER)
    private Zoo zoo;

    public Animal() {
    }

    public Animal(String name, String description, int age, int price, AnimalType animalType, boolean forSale) {
        this.name = name;
        this.description = description;
        this.age = age;
        this.price = price;
        this.animalType = animalType;
        this.forSale = forSale;
    }

    public boolean isAlive() {
        return alive;
    }

    public boolean isKilled() {
        return !alive;
    }

    public void setAlive(boolean alive) {
        this.alive = alive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isForSale() {
        return forSale;
    }

    public void setForSale(boolean forSale) {
        this.forSale = forSale;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public AnimalType getAnimalType() {
        return animalType;
    }

    public void setAnimalType(AnimalType animalType) {
        this.animalType = animalType;
    }
}
