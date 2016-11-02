package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.entity.Zoo;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface ZooRepository extends JpaRepository<Zoo, Integer> {

    @Query(value="select distinct z from Zoo z left join fetch z.users c where z.id =:id")
    public Zoo fetchZooUsers(@Param("id") int id);
}
