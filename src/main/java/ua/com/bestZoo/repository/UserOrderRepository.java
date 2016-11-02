package ua.com.bestZoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.com.bestZoo.entity.UserOrder;

/**
 * Created by vov4ik on 11/2/2016.
 */
public interface UserOrderRepository extends JpaRepository<UserOrder, Integer> {

}
