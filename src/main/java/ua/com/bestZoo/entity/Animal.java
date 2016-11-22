package ua.com.bestZoo.entity;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Entity
public class Animal {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String name;
    @Type(type="text")
    private String description;
    private int age;
    private int price;
    private boolean isAlive;
    private String imagePath;
    private boolean forSale;

    @Enumerated
    private AnimalType animalType;

    @ManyToOne
    private Zoo zoo;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "animal_userorder",
            joinColumns = @JoinColumn(name = "animal_id"),
            inverseJoinColumns = @JoinColumn(name = "userorder_id"))
    private List<UserOrder> userOrders = new ArrayList<>();

    public Animal() {
    }

    public Animal(String name, String description, int age, int price, AnimalType animalType, boolean forSale, String imagePath) {
        this.name = name;
        this.description = description;
        this.age = age;
        this.price = price;
        this.animalType = animalType;
        this.forSale = forSale;
        this.imagePath = imagePath;
        isAlive = true;
    }

    public List<UserOrder> getUserOrders() {
        return userOrders;
    }

    public void setUserOrders(List<UserOrder> userOrders) {
        this.userOrders = userOrders;
    }

    public Zoo getZoo() {
        return zoo;
    }

    public void setZoo(Zoo zoo) {
        this.zoo = zoo;
    }

    public boolean isIsAlive() {
        return isAlive;
    }

    public boolean isKilled() {
        return !isAlive;
    }

    public void setIsAlive(boolean alive) {
        this.isAlive = alive;
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
