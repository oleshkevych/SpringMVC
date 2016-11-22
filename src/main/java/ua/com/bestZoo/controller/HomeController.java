package ua.com.bestZoo.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.bind.annotation.ResponseBody;
import ua.com.bestZoo.beans.ActiveUser;
import ua.com.bestZoo.entity.Role;
import ua.com.bestZoo.entity.User;

import ua.com.bestZoo.entity.UserRole;
import ua.com.bestZoo.service.AnimalService;
import ua.com.bestZoo.service.UserService;

@Controller
public class HomeController {

    @Autowired
    private ActiveUser activeUser;
//	@Autowired
//	private CommodityService commodityService;
	
	@Autowired
	private UserService userService;

    @Autowired
    private AnimalService animalService;


    @RequestMapping(value="/", method=RequestMethod.GET)
    public String h() {

        return "redirect:/h";
    }
    @RequestMapping(value={"/logout"}, method=RequestMethod.POST)
    public String logout(){
        return "redirect:/h";
    }
	@RequestMapping(value={"/logoutS"}, method=RequestMethod.POST)
	public @ResponseBody String logoutS(){
        System.out.println( "11"+activeUser.getRole());
        if(activeUser.getRole() != Role.ROLE_ADMIN) {
            userService.save(activeUser.getUser());
        }
        activeUser = new ActiveUser();
		return "saved";
	}
	@RequestMapping(value="/h", method=RequestMethod.GET)
	public String home(Model model) {
		try {
            try {
                User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

                model.addAttribute("userRoleText", user.getUserRole().getTexts());
                activeUser.setUser(user);
                activeUser.setUserRole(user.getUserRole());
            }catch (ClassCastException cce){
                model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
            }
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
		}
		return "home";
	}
    @RequestMapping(value="/homeP", method=RequestMethod.POST)
    public String homeAfterLogIn() {
        return "redirect:/h";
    }

	@RequestMapping(value="/forSale", method=RequestMethod.GET)
	public String forSale(Model model) {
        try {
            model.addAttribute("userRoleText", activeUser.getUserRole().getTexts());

        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
        model.addAttribute("animals", animalService.findAlive());
		return "forSale";
	}
	@RequestMapping(value="/textFormForAllQuestions", method=RequestMethod.GET)
	public String textFormForAllQuestions(Principal principal, Model model) {

        try {
//            User user = userService.fetchUser(Integer.parseInt(principal.getName()));
//
//            model.addAttribute("userRoleText", user.getUserRole().getTexts());
            model.addAttribute("userRoleText", activeUser.getUserRole().getTexts());

        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
		return "textFormForAllQuestions";
	}
	@RequestMapping(value={"/loginPage", "/login"}, method=RequestMethod.POST)
    public String loginPage(){
        activeUser = new ActiveUser();
        activeUser.setUserRole(UserRole.NOTENOUGHSMART);
        return "login";
    }
    @RequestMapping(value={"/login"}, method=RequestMethod.GET)
    public String loginR(){
        activeUser = new ActiveUser();
        activeUser.setUserRole(UserRole.NOTENOUGHSMART);
        return "login";
    }


	@RequestMapping(value={"/registration"}, method=RequestMethod.POST)
	public String registration(Model model){
        model.addAttribute("errorP", false);
        model.addAttribute("errorU", false);
        model.addAttribute("errorE", false);
        model.addAttribute("errorValN", "");
        model.addAttribute("errorValE", "");
        model.addAttribute("errorValP", "");
        model.addAttribute("errorValP1", "");
        model.addAttribute("errorValP2", "");
		return "registration";
	}


    @RequestMapping(value={"/loginKiller"}, method=RequestMethod.GET)
    public String loginK() {

        activeUser.setUserRole(UserRole.HUNTER);
        return "loginH";
    }
    @RequestMapping(value={"/loggedIn", "/loginprocesing"}, method=RequestMethod.POST)
    public String loggedIn() {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            System.out.println("1: "+user.getUserRole());

            if ((user.getUserRole() != UserRole.HUNTER) && (activeUser.getUserRole() == UserRole.HUNTER)) {
                user.setUserRole(UserRole.HUNTER);
            }
            activeUser.setUser(user);
            activeUser.setUserRole(user.getUserRole());
            System.out.println("2: "+user.getUserRole());
            activeUser.setRole(Role.ROLE_USER);
            System.out.println("!myOrders"+activeUser.getUser().userName());
        }catch (ClassCastException e){
            activeUser.setRole(Role.ROLE_ADMIN);
        }
        System.out.println(activeUser.getUserRole());
        return "redirect:/h";
    }
    @RequestMapping(value="/loginprocesing", method=RequestMethod.GET)
    public String loginprocesing() {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            System.out.println("1: "+user.getUserRole());

            if ((user.getUserRole() != UserRole.HUNTER) && (activeUser.getUserRole() == UserRole.HUNTER)) {
                user.setUserRole(UserRole.HUNTER);
            }
            activeUser.setUser(user);
            activeUser.setUserRole(user.getUserRole());
            System.out.println("2: "+user.getUserRole());
            activeUser.setRole(Role.ROLE_USER);
            System.out.println("!myOrders"+activeUser.getUser().userName());
        }catch (ClassCastException e){
            activeUser.setRole(Role.ROLE_ADMIN);
        }
        System.out.println(activeUser.getUserRole());
        return "redirect:/h";
    }
}
