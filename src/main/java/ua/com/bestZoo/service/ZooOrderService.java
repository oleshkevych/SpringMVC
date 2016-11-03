package ua.com.bestZoo.service;

import ua.com.bestZoo.entity.ZooOrder;

import java.util.List;

/**
 * Created by vov4ik on 11/3/2016.
 */
public interface ZooOrderService {

    void save(ZooOrder zooOrder);
    void delete(ZooOrder zooOrder);
    List<ZooOrder> findAll();
    List<ZooOrder> findCompleted();
    List<ZooOrder> findUncompleted();

}
