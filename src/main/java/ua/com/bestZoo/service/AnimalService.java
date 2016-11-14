package ua.com.bestZoo.service;

import org.springframework.stereotype.Service;
import ua.com.bestZoo.entity.Animal;
import ua.com.bestZoo.entity.AnimalType;

import java.util.List;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface AnimalService {
    void save(Animal animal);
    void delete(int id);
    List<Animal> findAll();
    List<Animal> findByType(AnimalType animalType);
    List<Animal> findAlive();
    List<Animal> findKilled();
    List<Animal> findForSale();
    Animal getOldest(String name);
    Animal findById(int id);
    Animal findfetchAnimal(int id);


}
