package ua.com.bestZoo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.bestZoo.entity.ZooOrder;
import ua.com.bestZoo.repository.ZooOrderRepository;
import ua.com.bestZoo.service.ZooOrderService;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by vov4ik on 11/3/2016.
 */
@Service
public class ZooOrderImpl implements ZooOrderService{

    @Autowired
    ZooOrderRepository zooOrderRepository;


    public void save(ZooOrder zooOrder) {

        zooOrderRepository.save(zooOrder);
    }

    @Override
    public void delete(int id) {
        ZooOrder zo = zooOrderRepository.findOne(id);
        zo.setThisOrderDeleted(true);
        save(zo);
    }

    @Override
    public void deleteZOOORDER(ZooOrder zooOrder) {
        zooOrderRepository.delete(zooOrder);
    }

    @Override
    public List<ZooOrder> findAll() {
        return zooOrderRepository.findAll().stream().filter(zooOrder -> !zooOrder.isThisOrderDeleted()).collect(Collectors.toList());
    }

    @Override
    public List<ZooOrder> findCompleted() {
        return findAll().stream().filter(ZooOrder::isCompleted).collect(Collectors.toList());
    }

    @Override
    public List<ZooOrder> findUncompleted() {
        return findAll().stream().filter(zooOrder -> !zooOrder.isCompleted()).collect(Collectors.toList());
    }

    @Override
    public ZooOrder findOne(int id) {
        return zooOrderRepository.findOne(id);
    }
}
