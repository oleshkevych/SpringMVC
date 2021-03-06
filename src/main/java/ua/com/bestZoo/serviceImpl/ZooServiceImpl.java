package ua.com.bestZoo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.bestZoo.entity.Animal;
import ua.com.bestZoo.entity.Zoo;
import ua.com.bestZoo.entity.ZooOrder;
import ua.com.bestZoo.repository.ZooRepository;
import ua.com.bestZoo.service.ZooService;

import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Service
public class ZooServiceImpl implements ZooService {

    @Autowired
    private ZooRepository zooRepository;


//    public ZooServiceImpl(ZooRepository zooRepository) {
//        this.zooRepository = zooRepository;
//    }

    public int findEmptyCages() {
        //TODO:
        Zoo z = getZooFromDB();
        return z.getQuantityCages() - z.getAnimals().size();
    }

    @Override
    public Zoo fetchZooUsers() {
        return zooRepository.fetchZooUsers(1);
    }

    @Override
    public Zoo fetchZooAnimals() {
        return zooRepository.fetchZooAnimals(1);
    }

    @Override
    public Zoo fetchZooOrders() {
        return zooRepository.fetchZooOrders(1);
    }

    @Override
    public List<Zoo> findAll() {
        return zooRepository.findAll();
    }


    public Zoo getZooFromDB(){
        return zooRepository.getOne(1);
    }

//    public Zoo fetchZooUsers() {
//        return zooRepository.fetchZooUsers(1);
//    }

    public void save(Zoo zoo){
        zooRepository.save(zoo);
    }
}
