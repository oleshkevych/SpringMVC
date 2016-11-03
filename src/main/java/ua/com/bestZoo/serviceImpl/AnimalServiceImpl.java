package ua.com.bestZoo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.bestZoo.entity.Animal;
import ua.com.bestZoo.entity.AnimalType;
import ua.com.bestZoo.repository.AnimalRepository;
import ua.com.bestZoo.service.AnimalService;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by vov4ik on 11/2/2016.
 */
@Service
public class AnimalServiceImpl implements AnimalService {

    @Autowired
    AnimalRepository animalRepository;

    public void save(Animal animal) {
        animalRepository.save(animal);
    }

    public void delete(Animal animal) {
        animalRepository.delete(animal);
    }

    public List<Animal> findAll() {
        return animalRepository.findAll();
    }

    public List<Animal> findByType(final AnimalType animalType) {
        return findAll().stream().filter(a -> a.getAnimalType() == animalType).collect(Collectors.toList());
    }

    public List<Animal> findAlive() {
        return findAll().stream().filter(Animal::isAlive).collect(Collectors.toList());
    }

    public List<Animal> findKilled() {
        return findAll().stream().filter(Animal::isKilled).collect(Collectors.toList());
    }

    public Animal getOldest(String name){
        int age = 0;
        Animal result = new Animal();
        for(Animal a: findAll()){
            if (a.getName().equals(name)&&a.getAge()>age){
                result = a;
                age = a.getAge();
            }
        }
        return result;
    }
}
