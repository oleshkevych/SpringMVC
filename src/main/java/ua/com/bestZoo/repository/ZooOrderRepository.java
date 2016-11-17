package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.bestZoo.entity.ZooOrder;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface ZooOrderRepository extends JpaRepository<ZooOrder, Integer> {
}
