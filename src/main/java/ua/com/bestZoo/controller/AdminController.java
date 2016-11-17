package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.com.bestZoo.beans.ActiveUser;
import ua.com.bestZoo.entity.*;
import ua.com.bestZoo.repository.*;
import ua.com.bestZoo.service.*;

import javax.activation.MimetypesFileTypeMap;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by vov4ik on 11/7/2016.
 */
@Controller
public class AdminController {

    @Autowired
    AnimalService animalService;

    @Autowired
    UserService userService;

    @Autowired
    UserOrderService userOrderService;

    @Autowired
    ZooService zooService;

    @Autowired
    ZooOrderService zooOrderService;

    @Autowired
    ActiveUser activeUser;

    @RequestMapping(value={"/admin"}, method=RequestMethod.GET)
    public String admin(Model model) {
        List<UserOrder> listUO = new ArrayList<>();
        List<ZooOrder> listZO = new ArrayList<>();
        model.addAttribute("users", userService.findAll());
        model.addAttribute("usersHunters", userService.findAllHunters());
        model.addAttribute("usersFeeders", userService.findAllFeeders());
        model.addAttribute("usersSuicides", userService.findAllSuicides());
        model.addAttribute("usersMeetUsers", userService.findAllMeetUsers());
        try {
            listZO = zooOrderService.findAll();
            model.addAttribute("zooOrders", listZO);
        }catch(Exception e){
            System.out.println("zooOrders "+e);
        }
        try{
            listUO = userOrderService.findAllUO();
        model.addAttribute("orderUsers", listUO);
        }catch(Exception e){
            System.out.println("orderUsers "+e);
        }
        try{
            int aq = animalService.findAlive().size();
            int zooC = zooService.fetchZooOrders().getQuantityCages();
            model.addAttribute("cages", (zooC - aq));
        }catch(Exception e){
            model.addAttribute("cages", (100));
            System.out.println("cages3 "+e);
        }try {
            model.addAttribute("animals", animalService.findAlive());
        }catch(Exception e){
            System.out.println("animals"+e);
        }

        int money = 0;
        for(ZooOrder z : listZO){
            if(z.isNewOrder()){
//                z.setNewOrder(false);
//                zooOrderService.save(z);
            }
            if(!z.isCompleted()) {
                money -= z.getPrice();
            }
        }
        for(UserOrder u : listUO){
            if(u.isNewOrder()){
//                u.setNewOrder(false);
//                userOrderService.save(u);
            }
            money += u.getPrice();
        }
        model.addAttribute("bank", money);
//        listZO.stream().filter(ZooOrder::isNewOrder).forEach(z -> {
//            z.setNewOrder(false);
//            zooOrderService.save(z);
//        });
//        listUO.stream().filter(UserOrder::isNewOrder).forEach(u -> {
//            u.setNewOrder(false);
//            userOrderService.save(u);
//        });
        return "admin";
    }

    @RequestMapping(value={"/uploadFile"}, method= RequestMethod.POST)
        public @ResponseBody
        String uploadFileHandler(@RequestParam("file") MultipartFile file, @RequestParam("name") String name) {
        String mimetype= new MimetypesFileTypeMap().getContentType(name);

        String type = mimetype.split("/")[0];
        if(type.equals("image")) {
            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();

                    // Creating the directory to store file
                    String rootPath = System.getProperty("catalina.home");
                    File dir = new File(rootPath + File.separator + "Resources");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    String name1 = "";
                    if(dir.listFiles() != null) {
                        int lastNumber = 0;
                        System.out.println("!fileList"+ Arrays.toString(dir.listFiles()));

                        for(File file1: dir.listFiles()){
                            System.out.println("!uploadFile next: "+ file1.getName());
//                            System.out.println("!deleteFile next: "+ file1.getName().split(Character.getName(56))[0]);
//                            System.out.println("!deleteFile next: "+ file1.getName().split(".")[0]);
                            System.out.println("!deleteFile next: "+ file1.getName().substring(0, file1.getName().length()-4));
                            System.out.println("!deleteFile next: "+ file1.getName().substring(0, file1.getName().lastIndexOf(".")));


                            if(!file1.getName().equals("0default.jpg")){
                                if(Integer.parseInt(file1.getName().substring(0, file1.getName().lastIndexOf(".")))>lastNumber){
                                    System.out.println("!uploadFile latest: "+ file1.getName());
                                    lastNumber = Integer.parseInt(file1.getName().substring(0, file1.getName().lastIndexOf(".")));
                                }
                            }

                        }
                        name1 = (lastNumber+1) + name.substring(name.lastIndexOf("."), name.length());
                        System.out.println("!uploadFile finish: "+ name1);
                    }else{
                        name1 = "1" + name.substring(name.lastIndexOf("."), name.length());
                    }
                    // Create the file on server

                    File serverFile = new File(dir.getAbsolutePath()
                            + File.separator + name1);
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(serverFile));
                    stream.write(bytes);
                    stream.close();

                    return name;
                } catch (Exception e) {
                    return "You failed to upload  => " + e.getMessage();
                }
            } else return "You failed to upload because the file was empty.";
        }
        return "This file is not the picture!";
    }

    @RequestMapping(value={"/deleteFile"}, method= RequestMethod.POST)
    public @ResponseBody
    String deleteFileHandler() {
        try {
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "Resources");
            File f = dir.listFiles()[dir.listFiles().length-1];
            for(File file: dir.listFiles()){
                System.out.println("!deleteFile next: "+ file.getName());

                if(!file.getName().equals("0default.jpg")){
                    if(Integer.parseInt(file.getName().substring(0, file.getName().lastIndexOf(".")))>Integer.parseInt(f.getName().substring(0, f.getName().lastIndexOf(".")))){
                        System.out.println("!deleteFile latest: "+ file.getName());
                        f = file;
                    }
                }

            }
            if(f.delete()) {

                return "deleted";
            }else {
                return "errorrrr";
            }
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/addAnimal"}, method= RequestMethod.POST)
    public @ResponseBody
    String addAnimal(@RequestBody Map<String, String> map) {
        try {
            AnimalType at = AnimalType.EXPANSIVE;
            if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.CHEEP.getTexts())) {
                at = AnimalType.CHEEP;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.AVERAGE.getTexts())) {
                at = AnimalType.AVERAGE;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.EXPANSIVE.getTexts())) {
                at = AnimalType.EXPANSIVE;
            }

            String forS = map.get("forSale").toLowerCase().replace(" ", "").replace("\n", "");



            Animal animal = new Animal(map.get("name"), map.get("description"), Integer.parseInt(map.get("age")),
                    Integer.parseInt(map.get("price")), at, (forS.equals("true")), "");
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "Resources");
            File f = dir.listFiles()[dir.listFiles().length-1];
            for(File file: dir.listFiles()){
                System.out.println("!addAnimal next: "+ file.getName());
                if(!file.getName().equals("0default.jpg")){
                    if(Integer.parseInt(file.getName().substring(0, file.getName().lastIndexOf(".")))>Integer.parseInt(f.getName().substring(0, f.getName().lastIndexOf(".")))){
                        System.out.println("!deleteFile latest: "+ file.getName());
                        f = file;
                    }
                }

            }
            animal.setImagePath("image"+File.separator+f.getName());
            System.out.println("!addAnimal finish"+f.getName());
            animalService.save(animal);
            return "Animal was added!."+animal.getImagePath();
//            return "New Animal was added!";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }

    @RequestMapping(value = "/image")
    @ResponseBody
    public byte[] getImage(@PathVariable(value = "animal") Animal animal) throws IOException {
        File serverFile = new File(animal.getImagePath());

        return Files.readAllBytes(serverFile.toPath());
    }

//    @RequestMapping(value={"/changeAnimal"}, method=RequestMethod.POST)
//    public String changeOrders(@RequestBody String id, Model model) {
//        model.addAttribute("animal", animalService.findById(Integer.parseInt(id)));
//        return "changeOrders";
//    }
    @RequestMapping(value={"/deleteAnimal"}, method=RequestMethod.POST)
    @ResponseBody
    public String deleteAnimal(@RequestBody String id) {
        animalService.delete(Integer.parseInt(id));
        return "admin";
    }

    @RequestMapping(value={"/addAnimalToChange"}, method=RequestMethod.POST)
    @ResponseBody
    public String addAnimalToChange(@RequestBody String id) {
        System.out.println("animal "+id);
        activeUser.setAnimal(animalService.findById(Integer.parseInt(id)));
        activeUser.setZooOrder(null);
        return "changeOrders";
    }

    @RequestMapping(value={"/addZooOrderToChange"}, method=RequestMethod.POST)
    @ResponseBody
    public String addZooOrderToChange(@RequestBody String id) {
        System.out.println("z order "+id);
        activeUser.setZooOrder(zooOrderService.findOne(Integer.parseInt(id)));
        activeUser.setAnimal(null);
        return "changeOrders";
    }

    @RequestMapping(value={"/changeAnimal"}, method=RequestMethod.GET)
    public String changeAnimal(Model model) {

        if(activeUser.getZooOrder() == null) {
            model.addAttribute("animalToChange", true);
            model.addAttribute("zooOrderToChange", false);
            model.addAttribute("animalSelected", activeUser.getAnimal());
            activeUser.setAnimal(null);
        }else if(activeUser.getAnimal() == null){
            model.addAttribute("animalToChange", false);
            model.addAttribute("zooOrderToChange", true);
            model.addAttribute("zooOrderSelected", activeUser.getZooOrder());
            activeUser.setZooOrder(null);
        }
        return "changeOrders";
    }

    @RequestMapping(value={"/changeTheAnimal"}, method= RequestMethod.POST)
    @ResponseBody
    public String changeTheAnimal(@RequestBody Map<String, String> map) {
        Animal animal = animalService.findById(Integer.parseInt(map.get("id")));
        try {
            AnimalType at = AnimalType.EXPANSIVE;
            if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.CHEEP.getTexts())) {
                at = AnimalType.CHEEP;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.AVERAGE.getTexts())) {
                at = AnimalType.AVERAGE;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.EXPANSIVE.getTexts())) {
                at = AnimalType.EXPANSIVE;
            }
            System.out.println(map.get("animalType"));
            System.out.println(at);


            String forS = map.get("forSale").toLowerCase().replace(" ", "").replace("\n", "");
            String isAlive = map.get("isAlive").toLowerCase().replace(" ", "").replace("\n", "");

            animal.setName(map.get("name"));
            animal.setAge(Integer.parseInt(map.get("age")));
            animal.setDescription(map.get("description"));
            animal.setAnimalType(at);
            animal.setForSale(forS.equals("true"));
            animal.setIsAlive(isAlive.equals("true"));
            animal.setPrice(Integer.parseInt(map.get("price")));

            System.out.println(map.get("photo"));
            System.out.println(map.get("photo").equals("true"));


            if(map.get("photo").equals("true")) {
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "Resources");
                File f = dir.listFiles()[dir.listFiles().length-1];
                for(File file: dir.listFiles()){
                    System.out.println("!addAnimal next: "+ file.getName());
                    if(!file.getName().equals("0default.jpg")){
                        if(Integer.parseInt(file.getName().substring(0, file.getName().lastIndexOf(".")))>Integer.parseInt(f.getName().substring(0, f.getName().lastIndexOf(".")))){
                            System.out.println("!deleteFile latest: "+ file.getName());
                            f = file;
                        }
                    }

                }
                animal.setImagePath("image"+File.separator+f.getName());
                animal.setImagePath("image" + "\\" + f.getName());
                System.out.println(f.getName());
            }
            animalService.save(animal);
            return "Animal was added!."+animal.getImagePath();
//            return "New Animal was added!";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/changeTheZooOrder"}, method= RequestMethod.POST)
    @ResponseBody
    public String changeTheZooOrder(@RequestBody Map<String, String> map) {
        ZooOrder zo = zooOrderService.findOne(Integer.parseInt(map.get("id")));
        try {
            AnimalType at = AnimalType.EXPANSIVE;
            if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.CHEEP.getTexts())) {
                at = AnimalType.CHEEP;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.AVERAGE.getTexts())) {
                at = AnimalType.AVERAGE;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.EXPANSIVE.getTexts())) {
                at = AnimalType.EXPANSIVE;
            }
            if(!map.get("date").equals("false")) {
                String[] a = map.get("date").split(" ");
                if (a[1].length() < 5) {
                    String[] a1 = a[1].split(":");
                    if (a1[0].length() < 2) {
                        a1[0] = 0 + a1[0];
                    }
                    if (a1[1].length() < 2) {
                        a1[1] = 0 + a1[1];
                    }
                    a[1] = a1[0] + ":" + a1[1];
                }
                String dateT = a[0]+" "+a[1]+" "+a[2];
                LocalDateTime ldt = LocalDateTime.parse(dateT, DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a"));
                zo.setDate(ldt);
            }

            zo.setName(map.get("name"));
            zo.setAge(Integer.parseInt(map.get("age")));
            zo.setDescription(map.get("description"));
            zo.setAnimalType(at);
            zo.setPrice(Integer.parseInt(map.get("price")));

            zooOrderService.save(zo);
            return "Zoo order was changed!";
//            return "New Animal was added!";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/addZooOrder"}, method= RequestMethod.POST)
    public @ResponseBody
    String addZooOrder(@RequestBody Map<String, String> map) {
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
            LocalDateTime ldt = LocalDateTime.parse(dateT, DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a"));
            AnimalType at = AnimalType.EXPANSIVE;
            if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.CHEEP.getTexts())) {
                at = AnimalType.CHEEP;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.AVERAGE.getTexts())) {
                at = AnimalType.AVERAGE;
            }else if(map.get("animalType").toLowerCase().replace(" ", "").replace("\n", "").equals(AnimalType.EXPANSIVE.getTexts())) {
                at = AnimalType.EXPANSIVE;
            }
            ZooOrder zo = new ZooOrder(map.get("name"), map.get("description"), Integer.parseInt(map.get("age")), Integer.parseInt(map.get("price")), ldt, at);
            zooOrderService.save(zo);
            return "Ok";
        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }

    @RequestMapping(value={"/deleteZooOrder"}, method=RequestMethod.POST)
    @ResponseBody
    public String deleteZooOrder(@RequestBody String id) {
        zooOrderService.delete(Integer.parseInt(id));
        return "admin";
    }
    @RequestMapping(value={"/completeZooOrder"}, method=RequestMethod.POST)
    @ResponseBody
    public String completeZooOrder(@RequestBody String id) {
        ZooOrder zo = zooOrderService.findOne(Integer.parseInt(id));
        zo.setCompleted(!zo.isCompleted());
        zooOrderService.save(zo);
        return "admin";
    }
    @RequestMapping(value={"/deleteUserByAdmin"}, method= RequestMethod.POST)
    public @ResponseBody String delete(@RequestBody String id) {

        userService.delete(Integer.parseInt(id));

        return "admin";
    }
    @RequestMapping(value={"/changeNewZO"}, method= RequestMethod.POST)
    public @ResponseBody String changeNewZO() {

        List<ZooOrder> listZO = zooOrderService.findUncompleted();
        listZO.stream().filter(ZooOrder::isNewOrder).forEach(z -> {
            z.setNewOrder(false);
            zooOrderService.save(z);
        });
        return "changed";
    }

    @RequestMapping(value={"/changeNewUO"}, method= RequestMethod.POST)
    public @ResponseBody String changeNewUO() {

        List<UserOrder> listUO = userOrderService.findAllUO();
        listUO.stream().filter(UserOrder::isNewOrder).forEach(u -> {
            u.setNewOrder(false);
            userOrderService.save(u);
        });

        return "changed";
    }
    @RequestMapping(value={"/changeUserPassword"}, method= RequestMethod.POST)
    public @ResponseBody
    String changeUserPassword(@RequestBody Map<String, String> map) {
        try {
            User user = userService.findOneUser(Integer.parseInt(map.get("id")));
            user.setPassword(map.get("newP"));
            userService.saveFull(user);
            return "Password was changed!";
        }catch(Exception e){
            return e.getMessage();
        }
    }
}
