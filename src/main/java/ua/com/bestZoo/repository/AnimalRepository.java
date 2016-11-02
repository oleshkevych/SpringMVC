package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.bestZoo.entity.Animal;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface AnimalRepository extends JpaRepository<Animal, Integer> {
}
