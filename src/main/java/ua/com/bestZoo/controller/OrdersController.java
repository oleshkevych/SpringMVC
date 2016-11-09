package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ua.com.bestZoo.beans.ActiveUser;
import ua.com.bestZoo.entity.*;
import ua.com.bestZoo.service.AnimalService;
import ua.com.bestZoo.service.UserOrderService;
import ua.com.bestZoo.service.UserService;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by vov4ik on 11/6/2016.
 */
@Controller
public class OrdersController {

    private UserOrder uo;

    @Autowired
    AnimalService animalService;

    @Autowired
    ActiveUser activeUser;

    @Autowired
    UserOrderService userOrderService;

    @RequestMapping(value={"/addOrder"}, method= RequestMethod.GET)
    public String addOrder(Model model) {

        try {

            model.addAttribute("userRoleText", activeUser.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        model.addAttribute("animals", animalService.findAlive());
        return "newOrderUser";
    }
    @RequestMapping(value={"/myOrders"}, method=RequestMethod.GET)
    public String myOrder(Model model) {

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
    @RequestMapping(value={"/newOrder"}, method= RequestMethod.POST)
    public @ResponseBody
    String newOrder(@RequestBody Map<String, String> map) {
        try {
//            date : dateS,
                 //   anim : animalS,
//                    time : timeS,
//                    weapon : weaponS,
//                    orderType: orderTypeS,
//                    distance : distanceS,
//                    isFree : isFreeS
            int timeS = Integer.parseInt(map.get("time").toLowerCase().replace(" ", "").replace("\n", ""));
            String weaponS = map.get("weapon").toUpperCase().replace(" ", "").replace("\n", "");
            String orderTypeS = map.get("orderType").toUpperCase().replace(" ", "").replace("\n", "");
            int distance = Integer.parseInt(map.get("distance").toLowerCase().replace(" ", "").replace("\n", ""));
            boolean isFreeS = map.get("isFree").toLowerCase().replace(" ", "").replace("\n", "").equals("true");

            Animal animal = animalService.findById(Integer.parseInt(map.get("anim")));


            OrderType ot = OrderType.MEETING;
            switch (orderTypeS) {
                case "MEETING":
                    ot = OrderType.MEETING;
                    break;
                case "HUNTING":
                    ot = OrderType.HUNTING;
                    break;
                case "FEED":
                    ot = OrderType.FEED;
                    break;
                case "SUICIDE":
                    ot = OrderType.SUICIDE;
                    break;
            }

            Weapon w = Weapon.USERSWEAPON;
            switch (weaponS) {
                case "YOU WEAPON":
                    w = Weapon.USERSWEAPON;
                    break;
                case "KNIF":
                    w = Weapon.KNIF;
                    break;
                case "PISTOL":
                    w = Weapon.PISTOL;
                    break;
                case "M16":
                    w = Weapon.M16;
                    break;
                case "BARRETT":
                    w = Weapon.BARRETT;
                    break;
                case "BAZOOKA":
                    w = Weapon.BAZOOKA;
                    break;
            }
            List<Animal> aList = new ArrayList<>();
            aList.add(animal);
            System.out.println(timeS+" "+w+" "+ot+" "+distance);
            uo = new UserOrder(ot, map.get("date"), w, aList, timeS, activeUser.getUser(), distance, isFreeS);
            return uo.getPrice()+"";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }

    @RequestMapping(value={"/newOrderConfirm"}, method= RequestMethod.POST)
    public @ResponseBody
    String addNewOrder() {
        try {

            userOrderService.save(uo);

            return "OK";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
}
