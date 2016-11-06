package ua.com.bestZoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.bestZoo.entity.User;
import ua.com.bestZoo.service.UserService;

/**
 * Created by vov4ik on 11/6/2016.
 */
@Controller
public class RegistrationController {


    @Autowired
    UserService userService;

    @RequestMapping(value="/addUser", method= RequestMethod.POST)
	public String saveNewUser(Model model, @RequestParam String nameUser, @RequestParam String emailUser, @RequestParam String phoneUser, @RequestParam String p1, @RequestParam String p2){
        model.addAttribute("errorValN", nameUser);
        model.addAttribute("errorValE", emailUser);
        model.addAttribute("errorValP", phoneUser);
        model.addAttribute("errorValP1", p1);
        model.addAttribute("errorValP2", p2);
        if(!p1.equals(p2)){
            model.addAttribute("errorP", true);
            return "registration";
        }
        for(User u: userService.findAll()){
            if(u.userName().equals(nameUser)){
                model.addAttribute("errorU", true);
                return "registration";
            }
            if(u.getEmail().equals(emailUser)){
                model.addAttribute("errorE", true);
                return "registration";
            }
        }
        User user = new User(nameUser, phoneUser, p1, emailUser);
        userService.save(user);

		return "home";
	}
}
