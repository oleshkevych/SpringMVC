package ua.com.bestZoo.beans;

import org.springframework.stereotype.Component;
import ua.com.bestZoo.entity.*;

import javax.persistence.PreRemove;
import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Component
public class ActiveUser {

    private Animal animal;

    private ZooOrder zooOrder;

    private UserOrder uo;

    private User user;

    private List<UserOrder> hunts;

    private List<UserOrder> feeds;

    private List<UserOrder> meetings;

    private UserRole userRole;

    private Role role;

    public ActiveUser() {
        role = Role.ROLE_USER;
        userRole = UserRole.NOTENOUGHSMART;
        user = new User();
    }

    public UserOrder getUo() {
        return uo;
    }

    public Animal getAnimal() {
        return animal;
    }

    public ZooOrder getZooOrder() {
        return zooOrder;
    }

    public void setZooOrder(ZooOrder zooOrder) {
        this.zooOrder = zooOrder;
    }

    public void setAnimal(Animal animal) {
        this.animal = animal;
    }

    public void setUo(UserOrder uo) {
        this.uo = uo;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<UserOrder> getHunts() {
        return hunts;
    }

    public void setHunts(List<UserOrder> hunts) {
        this.hunts = hunts;
    }

    public List<UserOrder> getFeeds() {
        return feeds;
    }

    public void setFeeds(List<UserOrder> feeds) {
        this.feeds = feeds;
    }

    public List<UserOrder> getMeetings() {
        return meetings;
    }

    public void setMeetings(List<UserOrder> meetings) {
        this.meetings = meetings;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }


    @Override
    public String toString() {
        return "ActiveUser{" +
                "user=" + user +
                ", hunts=" + hunts +
                ", feeds=" + feeds +
                ", meetings=" + meetings +
                '}';
    }

}
