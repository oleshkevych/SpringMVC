package ua.com.bestZoo.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Entity
public class Zoo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private int quantityCages;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="zoo")
    private List<User> users;

    @OneToMany(fetch=FetchType.EAGER, mappedBy="zoo")
    private List<ZooOrder> zooOrders;

    @OneToMany(fetch=FetchType.EAGER, mappedBy="zoo")
    private List<Animal> animals;


    public Zoo() {
    }

    public Zoo(int quantityCages) {
        this.quantityCages = quantityCages;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantityCages() {
        return quantityCages;
    }

    public void setQuantityCages(int quantityCages) {
        this.quantityCages = quantityCages;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<ZooOrder> getZooOrders() {
        return zooOrders;
    }

    public void setZooOrders(List<ZooOrder> zooOrders) {
        this.zooOrders = zooOrders;
    }

    public List<Animal> getAnimals() {
        return animals;
    }

    public void setAnimals(List<Animal> animals) {
        this.animals = animals;
    }

    @Override
    public String toString() {
        return "Zoo{" +
                "id=" + id +
                ", quantityCages=" + quantityCages +
                ", users=" + users +
                ", zooOrders=" + zooOrders +
                ", animals=" + animals +
                '}';
    }
}
