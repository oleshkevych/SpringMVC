package ua.com.bestZoo.service;

import ua.com.bestZoo.entity.Animal;
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.entity.Zoo;
import ua.com.bestZoo.entity.ZooOrder;

import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface ZooService {

    int findEmptyCages();
    Zoo fetchZooUsers();
    Zoo fetchZooAnimals();
    Zoo fetchZooOrders();
    List<Zoo> findAll();
    Zoo getZooFromDB();
    void save(Zoo zoo);
}
