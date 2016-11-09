package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.com.bestZoo.entity.Animal;
import ua.com.bestZoo.entity.AnimalType;
import ua.com.bestZoo.repository.*;
import ua.com.bestZoo.service.*;

import javax.activation.MimetypesFileTypeMap;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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

    @RequestMapping(value={"/admin"}, method=RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("users", userService.findAll());
        model.addAttribute("usersHunters", userService.findAllHunters());
        model.addAttribute("usersFeeders", userService.findAllFeeders());
        model.addAttribute("usersSuicides", userService.findAllSuicides());
        model.addAttribute("usersMeetUsers", userService.findAllMeetUsers());
        model.addAttribute("zooOrders", zooOrderService.findAll());
        model.addAttribute("orderUsers", userOrderService.findAll());

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
                        name1 = (dir.listFiles().length) + name.substring(name.lastIndexOf("."), name.length());
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

                    System.out.println(name1);
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
            if(map.get("animalType").toLowerCase().equals(AnimalType.CHEEP.getTexts())) {
                at = AnimalType.CHEEP;
            }else if(map.get("animalType").toLowerCase().equals(AnimalType.AVERAGE.getTexts())) {
                at = AnimalType.AVERAGE;
            }else if(map.get("animalType").toLowerCase().equals(AnimalType.EXPANSIVE.getTexts())) {
                at = AnimalType.EXPANSIVE;
            }

            String forS = map.get("forSale").toLowerCase().replace(" ", "").replace("\n", "");



            Animal animal = new Animal(map.get("name"), map.get("description"), Integer.parseInt(map.get("age")),
                    Integer.parseInt(map.get("price")), at, (forS.equals("true")), "");
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "Resources");
            File f = dir.listFiles()[dir.listFiles().length-1];
            animal.setImagePath("image"+"\\"+f.getName());
            System.out.println(f.getName());
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



}
