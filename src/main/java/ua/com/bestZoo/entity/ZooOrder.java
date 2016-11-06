package ua.com.bestZoo.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Entity
public class ZooOrder {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    private int age;
    private int price;
    private LocalDateTime date;
    private boolean completed;
    @Enumerated
    private AnimalType animalType;
    @ManyToOne
    private Zoo zoo;

    public ZooOrder() {
    }

    public ZooOrder(String name, String description, int age, int price, LocalDateTime date, AnimalType animalType) {
        this.name = name;
        this.description = description;
        this.age = age;
        this.price = price;
        this.date = date;
        this.animalType = animalType;
        this.completed = false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public AnimalType getAnimalType() {
        return animalType;
    }

    public void setAnimalType(AnimalType animalType) {
        this.animalType = animalType;
    }

    @Override
    public String toString() {
        return "ZooOrder{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", age=" + age +
                ", price=" + price +
                ", date=" + date +
                ", animalType=" + animalType +
                '}';
    }
}
