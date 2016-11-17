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
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.entity.UserRole;
import ua.com.bestZoo.service.UserOrderService;
import ua.com.bestZoo.service.UserService;

import java.io.File;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by vov4ik on 11/11/2016.
 */
@Controller
public class ProfileController {


    @Autowired
    ActiveUser activeUser;

    @Autowired
    UserService userService;

    @Autowired
    UserOrderService userOrderService;

    @RequestMapping(value={"/myOrders"}, method= RequestMethod.GET)
    public String myOrder(Model model) {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            activeUser.setUser(userService.fetchUser(user.getId()));
            activeUser.setUserRole(user.getUserRole());
            model.addAttribute("userRoleText", user.getUserRole().getTexts());
            model.addAttribute("activeUser", activeUser.getUser());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        return "userOrders";
    }
    @RequestMapping(value={"/uploadImage"}, method= RequestMethod.POST)
    public @ResponseBody
    String profileImageHandler() {
        try {
            System.out.println("!Start"+File.separator);
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "Resources");
            System.out.println("!dir"+dir.getName());
            File f = dir.listFiles()[dir.listFiles().length-1];
            System.out.println("!fileList"+ Arrays.toString(dir.listFiles()));
            System.out.println("!fileList start name:"+ f.getName());

            for(File file: dir.listFiles()){
                System.out.println("!fileList next: "+ file.getName());
                if(!file.getName().equals("0default.jpg")){
                    if(Integer.parseInt(file.getName().substring(0, file.getName().lastIndexOf(".")))>Integer.parseInt(f.getName().substring(0, f.getName().lastIndexOf(".")))){
                        System.out.println("!fileList latest: "+ file.getName());
                        f = file;
                    }
                }

            }
            System.out.println("!file finish"+ f.getName());
            if(!activeUser.getUser().getPathImage().equals("image"+File.separator+"0default.jpg")){
                File fOld = new File(dir.getPath()+File.separator+activeUser.getUser().getPathImage().substring(6));
                System.out.println("if delete");
                fOld.delete();
            }
            System.out.println("!"+activeUser.getUser().getPathImage());
            activeUser.getUser().setPathImage("image"+File.separator+f.getName());
            System.out.println("!"+activeUser.getUser().getPathImage());

            userService.save(activeUser.getUser());
            return activeUser.getUser().getPathImage();

        } catch (Exception e) {
            return "You failed to save  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/uploadName"}, method= RequestMethod.POST)
    public @ResponseBody
    String profileNameHandler(@RequestBody String string) {
        try {
            activeUser.getUser().setUserName(string);
            userService.save(activeUser.getUser());
            return "You have the new name";

        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/uploadPhone"}, method= RequestMethod.POST)
    public @ResponseBody
    String profilePhoneHandler(@RequestBody String string) {
        try {
            activeUser.getUser().setPhoneNumber(string);
            userService.save(activeUser.getUser());
            return "You have the new phone";

        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/uploadPassword"}, method= RequestMethod.POST)
    public @ResponseBody
    String profilePasswordHandler(@RequestBody String string) {
        try {
            activeUser.getUser().setPassword(string);
            userService.saveFull(activeUser.getUser());
            return "You have the new password";

        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/uploadEmail"}, method= RequestMethod.POST)
    public @ResponseBody
    String profileEmailHandler(@RequestBody String string) {
        try {
            activeUser.getUser().setEmail(string);
            userService.save(activeUser.getUser());
            return "You have the new email";

        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/uploadOrder"}, method= RequestMethod.POST)
    public @ResponseBody
    String profileUploadOrder(@RequestBody String string) {
        try {
            userOrderService.delete(Integer.parseInt(string));
            return "order";

        } catch (Exception e) {
            return "You failed to upload  => " + e.getMessage();
        }
    }
    @RequestMapping(value={"/deleteU"}, method= RequestMethod.POST)
    public @ResponseBody String delete() {

        userService.delete(activeUser.getUser().getId());
        activeUser = new ActiveUser();

        return "redirect:/myOrders";
    }
}
