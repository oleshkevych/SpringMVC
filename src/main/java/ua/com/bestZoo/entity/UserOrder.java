package ua.com.bestZoo.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Entity
public class UserOrder {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;

    @Enumerated
    private OrderType orderType;
    private int price = 0;
    private LocalDateTime date;
    @Enumerated
    private Weapon weapon;
    private String animal;
    private int timeOfMeeting;
    private int distance;

    @ManyToOne(fetch=FetchType.EAGER)
    private User user;

    public UserOrder() {
    }

    public UserOrder(OrderType orderType, String date, Weapon weapon, Animal animal, int timeOfMeeting, User user, int distance, boolean isFree) {
        this.orderType = orderType;
        this.date = LocalDateTime.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        this.weapon = weapon;
        this.animal = animal.getName();
        this.timeOfMeeting = timeOfMeeting;
        this.user = user;
        this.distance = distance;

        if(orderType == OrderType.MEETING){
            price += 500;
            user.setMeetinger(true);
        }else if(orderType == OrderType.SUICIDE){
            price += 2000;
            user.setSuicide(true);
        }else if(orderType == OrderType.HUNT){
            price = animal.getPrice();
            price += 1000;
            if(animal.getAnimalType() == AnimalType.CHEEP){
                price += 100;
            }else if(animal.getAnimalType() == AnimalType.AVERAGE){
                price += 500;
            }else if(animal.getAnimalType() == AnimalType.EXPANSIVE){
                price += 1500;
            }
            user.setHunter(true);
        }else if(orderType == OrderType.FEED){
            price = animal.getPrice();
            price += 2000;
            if(animal.getAnimalType() == AnimalType.CHEEP){
                price += 100;
            }else if(animal.getAnimalType() == AnimalType.AVERAGE){
                price += 500;
            }else if(animal.getAnimalType() == AnimalType.EXPANSIVE){
                price += 1500;
            }
            user.setFeeder(true);
            user.setQuantityFeeds(user.getQuantityFeeds()+1);
        }

        if(weapon == Weapon.KNIF){
            price += 100;
            if(isFree){
                price -= 50;
            }else{
                price += 50;
            }
        }else if(weapon == Weapon.PISTOL){
            price += 150;
            if(!isFree){
                price += 100;
            }
        }else if(weapon == Weapon.M16){
            price += 250;
            if(!isFree){
                price += 200;
            }
        }else if(weapon == Weapon.BARRETT){
            price += 500;
            if(distance<50){
                price += 1000;
            }else if(distance<500){
                price += 500;
            }else if(distance>500){
                price += 2000;
            }
            if(isFree){
                price -= 100;
            }
        }else if(weapon == Weapon.BAZOOKA){
            price += 1500;
            if(distance<50){
                price += 1000;
            }else if(distance<500){
                price += 500;
            }else if(distance>500){
                price += 2000;
            }
            if(isFree){
                price -= 300;
            }
        }else if(weapon == Weapon.USERSWEAPON){
            price += 100;
        }

        if(timeOfMeeting<=60){
            price += 50;
        }else if(timeOfMeeting<=90){
            price += 100;
        }else if(timeOfMeeting<=120){
            price += 150;
        }else if(timeOfMeeting>120){
            price += 400;
        }

        price -= user.getBonuses();

        if(price<1000){
            user.setBonuses(50);
        }else if(price<1500){
            user.setBonuses(100);
        }else if(price<5000){
            user.setBonuses(200);
        }else if(price>5000){
            user.setBonuses(500);
        }
        if(user.getQuantityFeeds()>1){
            user.setBonuses(100);
        }else if(user.getQuantityFeeds()<2){
            user.setBonuses(400);
        }else if(user.getQuantityFeeds()<5){
            user.setBonuses(600);
        }else if(user.getQuantityFeeds()>5){
            user.setBonuses(800);
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public OrderType getOrderType() {
        return orderType;
    }

    public void setOrderType(OrderType orderType) {
        this.orderType = orderType;
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

    public Weapon getWeapon() {
        return weapon;
    }

    public void setWeapon(Weapon weapon) {
        this.weapon = weapon;
    }

    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }

    public int getTimeOfMeeting() {
        return timeOfMeeting;
    }

    public void setTimeOfMeeting(int timeOfMeeting) {
        this.timeOfMeeting = timeOfMeeting;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserOrder{" +
                "id=" + id +
                ", orderType=" + orderType +
                ", price=" + price +
                ", date=" + date +
                ", weapon=" + weapon +
                ", animal='" + animal + '\'' +
                ", timeOfMeeting=" + timeOfMeeting +
                ", distance=" + distance +
                ", user=" + user +
                '}';
    }
}
