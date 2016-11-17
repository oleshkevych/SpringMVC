package ua.com.bestZoo.service;

import ua.com.bestZoo.entity.UserOrder;

import java.util.List;

/**
 * Created by vov4ik on 11/3/2016.
 */
public interface UserOrderService {

    void save(UserOrder userOrder);
    void delete(int id);
    void deleteUSERORDER(UserOrder userOrder);

    List<UserOrder> findAllUO();
    List<UserOrder> findAll();
    List<UserOrder> findFeeds();
    List<UserOrder> findMeetings();
    List<UserOrder> findHunts();
    List<UserOrder> findSuicides();
    UserOrder findClosest();
    List<UserOrder> findClosests(int days);
    List<UserOrder> findOurWeaponUsed();
    List<UserOrder> findCompleted();
    List<UserOrder> findUncompleted();
//    UserOrder findfetchUserOrders(int id);



}
