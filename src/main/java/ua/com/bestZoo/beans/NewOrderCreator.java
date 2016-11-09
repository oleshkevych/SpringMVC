package ua.com.bestZoo.beans;

import org.springframework.beans.factory.annotation.Autowired;
import ua.com.bestZoo.service.UserOrderService;

/**
 * Created by vov4ik on 11/9/2016.
 */
public class NewOrderCreator {

    @Autowired
    UserOrderService userOrderService;


}
