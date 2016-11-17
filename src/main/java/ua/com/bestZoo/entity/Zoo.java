package ua.com.bestZoo.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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
    @Fetch(value = FetchMode.SUBSELECT)
    private Set<User> users;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="zoo")
    @Fetch(value = FetchMode.SUBSELECT)
    private Set<ZooOrder> zooOrders;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="zoo")
    @Fetch(value = FetchMode.SUBSELECT)
    private Set<Animal> animals;


    public Zoo() {
    }

    public Zoo(int quantityCages) {
        this.quantityCages = quantityCages;
        animals = new LinkedHashSet<>();
        users = new LinkedHashSet<>();
        zooOrders = new LinkedHashSet<>();
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

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Set<ZooOrder> getZooOrders() {
        return zooOrders;
    }

    public void setZooOrders(Set<ZooOrder> zooOrders) {
        this.zooOrders = zooOrders;
    }

    public Set<Animal> getAnimals() {
        return animals;
    }

    public void setAnimals(Set<Animal> animals) {
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
