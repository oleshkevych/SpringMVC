package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
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
import ua.com.bestZoo.service.ZooOrderService;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by vov4ik on 11/6/2016.
 */
@Controller
public class OrdersController {

    @Autowired
    AnimalService animalService;

    @Autowired
    ActiveUser activeUser;

    @Autowired
    UserOrderService userOrderService;

    @Autowired
    ZooOrderService zooOrderService;

    @Autowired
    UserService userService;

    @RequestMapping(value={"/addOrder"}, method= RequestMethod.GET)
    public String addOrder(Model model) {
        System.out.println("!myOrders"+activeUser.getUser().userName());
        activeUser.setUo(new UserOrder());
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
            activeUser.setUser(user);
            activeUser.setUserRole(user.getUserRole());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        model.addAttribute("animals", animalService.findAlive());
        return "newOrderUser";
    }

    @RequestMapping(value={"/newOrder"}, method= RequestMethod.POST)
    public @ResponseBody
    String newOrder(@RequestBody Map<String, String> map) {
        try {
            String weaponS = map.get("weapon").toUpperCase().replace(" ", "").replace("\n", "");
            String t = map.get("time").toLowerCase().replace(" ", "").replace("\n", "");
            String orderTypeS = map.get("orderType").toUpperCase().replace(" ", "").replace("\n", "");
            String distanceS = (map.get("distance").toLowerCase().replace(" ", "").replace("\n", ""));
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
            int distance = 0;
            switch (distanceS) {
                case "lessthen50m":
                    distance = 50;
                    break;
                case "lessthen500m":
                    distance = 500;
                    break;
                case "morethen50m":
                    distance = 501;
                    break;
            }

            int time = 0;
            switch (t) {
                case "1hour":
                    time = 60;
                    break;
                case "1.5hours":
                    time = 90;
                    break;
                case "2hours":
                    time = 120;
                    break;
                case "morethen2hours":
                    time = 121;
                    break;
            }


            Weapon w = Weapon.USERSWEAPON;
            switch (weaponS) {
                case "YOUWEAPON":
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
            String[] a = map.get("date").split(" ");
            if(a[1].length()<5){
                String[] a1 = a[1].split(":");
                if(a1[0].length()<2){
                    a1[0] = 0+a1[0];
                }
                if(a1[1].length()<2){
                    a1[1] = 0+a1[1];
                }
                a[1] = a1[0]+":"+a1[1];
            }
            String dateT = a[0]+" "+a[1]+" "+a[2];
            List<Animal> aList = new ArrayList<>();
            aList.add(animal);
            System.out.println(ot+" "+dateT+" "+ time+" "+w+" "+ot+" "+distance);
            activeUser.setUo(new UserOrder(ot, dateT, w, aList, time, activeUser.getUser(), distance, isFreeS));
            return activeUser.getUo().getPrice()+"";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }

    @RequestMapping(value={"/newOrderConfirm"}, method= RequestMethod.POST)
    public @ResponseBody
    String addNewOrder() {
        try {

            userOrderService.save(activeUser.getUo());
            activeUser.setUser(activeUser.getUo().getUser());
            if(activeUser.getUo().getOrderType() == OrderType.HUNTING) {
                UserOrder uo = activeUser.getUo();
                ZooOrder zo = new ZooOrder(uo.getAnimals(), uo.getAnimalSet().get(0).getDescription(), uo.getAnimalSet().get(0).getAge(),
                        uo.getAnimalSet().get(0).getPrice(), uo.getDate(), uo.getAnimalSet().get(0).getAnimalType());

                zooOrderService.save(zo);

            }else if(activeUser.getUo().getOrderType() == OrderType.SUICIDE) {
                activeUser.getUser().setSuicide(true);
                activeUser.getUser().setPassword("`123wsqd&d`12dqwsx*axs123121**-+");
                userService.saveFull(activeUser.getUser());
                return "redirect";
            }
            userService.save(activeUser.getUser());

            return "OK";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }

    @RequestMapping(value={"/validatingDate"}, method= RequestMethod.POST)
    public @ResponseBody
    String validatingDate(@RequestBody Map<String, String> map) {
        try {
            String[] a = map.get("date").split(" ");
            if(a[1].length()<5){
                String[] a1 = a[1].split(":");
                if(a1[0].length()<2){
                    a1[0] = 0+a1[0];
                }
                if(a1[1].length()<2){
                    a1[1] = 0+a1[1];
                }
                a[1] = a1[0]+":"+a1[1];
            }
            String dateT = a[0]+" "+a[1]+" "+a[2];
            Animal animal = animalService.findfetchAnimal(Integer.parseInt(map.get("id")));
            ZonedDateTime zdt1 = LocalDateTime.parse(dateT, DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a")).atZone(ZoneId.of("Europe/Kiev"));
            String t = map.get("time").toLowerCase().replace(" ", "").replace("\n", "");
            int timeOM = 0;
            switch (t) {
                case "1hour":
                    timeOM = 60;
                    break;
                case "1.5hours":
                    timeOM = 90;
                    break;
                case "2hours":
                    timeOM = 120;
                    break;
                case "morethen2hours":
                    timeOM = 121;
                    break;
            }
            Long timeNewStart = zdt1.toInstant().toEpochMilli();
            Long timeNewFinish;
            if (timeOM < 121) {
                timeNewFinish = timeNewStart + timeOM * 60000;
            } else {
                timeNewFinish = timeNewStart + 4 * 60000;
            }
            String message = "";
            String messageDeath = "";
            String bMessage = "not";
            for (UserOrder uo : animal.getUserOrders()) {
                message += " from " + uo.getDate().toString() + " for " + uo.getTimeOfMeeting() + " minutes";
                ZonedDateTime zdt = uo.getDate().atZone(ZoneId.of("Europe/Kiev"));
                Long timeStart = (zdt.toInstant().toEpochMilli());
                Long timeFinish;
                if (uo.getTimeOfMeeting() < 121) {
                    timeFinish = timeStart + uo.getTimeOfMeeting() * 60000;
                } else {
                    timeFinish = timeStart + 4 * 60000;
                }
                if((uo.getOrderType()==OrderType.HUNTING && (timeStart<timeNewFinish))){
                    messageDeath = " Sorry this animal will unavailable after " + uo.getDate().toString();
                    bMessage = "yes";
                }
                if ((timeStart < timeNewStart && timeFinish > timeNewStart) ||
                        (timeStart < timeNewFinish && timeFinish > timeNewFinish) ||
                        (timeStart > timeNewStart && timeFinish < timeNewFinish)){
                    bMessage = "yes";
                }

            }

            return bMessage + "!!!" + message + messageDeath;
        }catch(Exception e){
            System.out.println(e);

            return e.getMessage();
        }
    }
}
