package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.bestZoo.entity.Animal;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface AnimalRepository extends JpaRepository<Animal, Integer> {

    @Query(value = "select a from Animal a left join fetch a.userOrders o where a.id =:id")
    Animal findfetchAnimal(@Param("id") int id);
}
