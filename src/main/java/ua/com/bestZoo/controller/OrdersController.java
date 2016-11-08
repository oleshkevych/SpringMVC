package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.com.bestZoo.beans.ActiveUser;
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.entity.UserRole;
import ua.com.bestZoo.service.UserService;

import java.security.Principal;

/**
 * Created by vov4ik on 11/6/2016.
 */
@Controller
public class OrdersController {

    @Autowired
    UserService userService;

    @Autowired
    ActiveUser activeUser;

    @RequestMapping(value={"/addOrder"}, method= RequestMethod.GET)
    public String addOrder(Principal principal, Model model) {

        try {
            User user = userService.fetchUser(Integer.parseInt(principal.getName()));

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        return "newOrderUser";
    }
    @RequestMapping(value={"/myOrders"}, method=RequestMethod.GET)
    public String myOrder(Principal principal, Model model) {

        System.out.println(activeUser.getUser().userName()+ " fvbuqwefvbqwevuiv");
        model.addAttribute("user11", activeUser.getUser().getPhoneNumber());
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        return "userOrders";
    }
}
