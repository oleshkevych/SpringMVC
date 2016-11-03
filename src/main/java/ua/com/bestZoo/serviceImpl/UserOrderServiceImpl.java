package ua.com.bestZoo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.bestZoo.entity.OrderType;
import ua.com.bestZoo.entity.UserOrder;
import ua.com.bestZoo.entity.Weapon;
import ua.com.bestZoo.repository.UserOrderRepository;
import ua.com.bestZoo.service.UserOrderService;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by vov4ik on 11/3/2016.
 */
@Service
public class UserOrderServiceImpl implements UserOrderService{

    @Autowired
    UserOrderRepository userOrderRepository;
    @Override
    public void save(UserOrder userOrder) {
        userOrderRepository.save(userOrder);
    }

    @Override
    public void delete(UserOrder userOrder) {
        userOrderRepository.delete(userOrder);
    }

    @Override
    public List<UserOrder> findAll() {
        return userOrderRepository.findAll();
    }

    @Override
    public List<UserOrder> findFeeds() {
        return findAll().stream().filter(userOrder -> userOrder.getOrderType() == OrderType.FEED).collect(Collectors.toList());
    }

    @Override
    public List<UserOrder> findMeetings() {
        return findAll().stream().filter(userOrder -> userOrder.getOrderType() == OrderType.MEETING).collect(Collectors.toList());

    }

    @Override
    public List<UserOrder> findHunts() {
        return findAll().stream().filter(userOrder -> userOrder.getOrderType() == OrderType.HUNT).collect(Collectors.toList());

    }

    @Override
    public List<UserOrder> findSuicides() {
        return findAll().stream().filter(userOrder -> userOrder.getOrderType() == OrderType.SUICIDE).collect(Collectors.toList());

    }

    @Override
    public UserOrder findClosest() {
        List<UserOrder> list = findUncompleted();
        UserOrder result = list.get(0);
        long currentTime = System.currentTimeMillis();
        ZonedDateTime z = result.getDate().atZone(ZoneId.of("Ukraine"));
        long oTime = z.toInstant().toEpochMilli();
        long i = oTime - currentTime;
        for(UserOrder u: list){
            ZonedDateTime zdt = u.getDate().atZone(ZoneId.of("Ukraine"));
            long orderTime = zdt.toInstant().toEpochMilli();
            if((orderTime - currentTime)<i){
                result = u;
                i = (orderTime - currentTime);
            }
        }
        return result;
    }

    @Override
    public List<UserOrder> findClosests(int days) {
        List<UserOrder> list = findUncompleted();
        List<UserOrder> result = new ArrayList<>();
        long currentTime = System.currentTimeMillis();
        long i = days*24*3600*1000;
        for(UserOrder u: list){
            ZonedDateTime zdt = u.getDate().atZone(ZoneId.of("Ukraine"));
            long orderTime = zdt.toInstant().toEpochMilli();
            if((orderTime - currentTime)<i){
                result.add(u);
            }
        }
        return result;
    }

    @Override
    public List<UserOrder> findOurWeaponUsed() {
        return findAll().stream().filter(userOrder -> userOrder.getWeapon() != Weapon.USERSWEAPON).collect(Collectors.toList());
    }

    @Override
    public List<UserOrder> findCompleted() {
        List<UserOrder> list = findAll();
        List<UserOrder> result = new ArrayList<>();
        long currentTime = System.currentTimeMillis();
        for(UserOrder u: list){
            ZonedDateTime zdt = u.getDate().atZone(ZoneId.of("Ukraine"));
            long orderTime = zdt.toInstant().toEpochMilli();
            if((orderTime<currentTime)){
                result.add(u);
            }
        }
        return result;
    }

    @Override
    public List<UserOrder> findUncompleted() {
        List<UserOrder> list = findAll();
        List<UserOrder> result = new ArrayList<>();
        long currentTime = System.currentTimeMillis();
        for(UserOrder u: list){
            ZonedDateTime zdt = u.getDate().atZone(ZoneId.of("Ukraine"));
            long orderTime = zdt.toInstant().toEpochMilli();
            if((orderTime>currentTime)){
                result.add(u);
            }
        }
        return result;
    }
}
