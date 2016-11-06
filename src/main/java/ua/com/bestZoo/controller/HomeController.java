package ua.com.bestZoo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import ua.com.bestZoo.entity.ActiveUser;
import ua.com.bestZoo.entity.User;

import ua.com.bestZoo.entity.UserRole;
import ua.com.bestZoo.service.UserService;

@Controller
public class HomeController {

    private ActiveUser activeUser;
//	@Autowired
//	private CommodityService commodityService;
	
	@Autowired
	private UserService userService;
	
//	@RequestMapping(value="/", method=RequestMethod.GET)
//	public String commodity(Model model){
//		List<Commodity> commodities = commodityService.findAll();
//		model.addAttribute("commodities", commodities);
////		System.out.println(commodityService.findAll());
//		return "home";
//	}

//	@RequestMapping(value="/", method=RequestMethod.GET)
//	public String home() {
//		return "home";
//	}
	
//	@RequestMapping(value="/buy/{id}", method=RequestMethod.GET)
//	public String home(Principal principal, @PathVariable String id){
//		User user = userService.fetchUser(Integer.parseInt(principal.getName()));
//		Commodity commodity = commodityService.findOneUser(Integer.parseInt(id));
//		System.out.println(user.getUsername());
//		commodity.setUser(user);
//		commodityService.save(commodity);
////		user.getCommodities().add(commodity);
////		System.out.println(user.getCommodities().size()+"");
////		userService.save(user);
//		return "redirect:/";
//	}

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String h() {

        return "redirect:/h";
    }
	@RequestMapping(value={"/logout"}, method=RequestMethod.POST)
	public String logout(){
		return "redirect:/h";
	}
	@RequestMapping(value="/h", method=RequestMethod.GET)
	public String home(Principal principal, Model model) {

		try {
            String userLoginNumber = principal.getName();
            if(!userLoginNumber.equals("admin")) {
                User user = userService.fetchUser(Integer.parseInt(userLoginNumber));

                model.addAttribute("userRoleText", user.getUserRole().getTexts());
            }else{
                model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
            }
		}catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
		}
		return "home";
	}
    @RequestMapping(value="/homeP", method=RequestMethod.POST)
    public String homeAfterLogIn(Principal principal, Model model) {

//        try {
//            String userLoginNumber = principal.getName();
//            if(!userLoginNumber.equals("admin")) {
//                User user = userService.fetchUser(Integer.parseInt(userLoginNumber));
//
//                model.addAttribute("userRoleText", user.getUserRole().getTexts());
//            }else{
//                model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
//            }
//        }catch (NullPointerException e){
//            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
//        }
        return "redirect:/h";
    }

	@RequestMapping(value="/forSale", method=RequestMethod.GET)
	public String forSale(Principal principal, Model model) {

        try {
            User user = userService.fetchUser(Integer.parseInt(principal.getName()));

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
		return "forSale";
	}
	@RequestMapping(value="/textFormForAllQuestions", method=RequestMethod.GET)
	public String textFormForAllQuestions(Principal principal, Model model) {

        try {
            User user = userService.fetchUser(Integer.parseInt(principal.getName()));

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
		return "textFormForAllQuestions";
	}
	@RequestMapping(value={"/loginPage"}, method=RequestMethod.POST)
	public String loginPage(){
        activeUser = new ActiveUser(UserRole.NOTENOUGHSMART);
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

	@RequestMapping(value={"/addOrder"}, method=RequestMethod.POST)
	public String addOrder(Principal principal, Model model) {

        try {
            User user = userService.fetchUser(Integer.parseInt(principal.getName()));

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
		return "newOrderUser";
	}
	@RequestMapping(value={"/myOrders"}, method=RequestMethod.POST)
	public String myOrder(Principal principal, Model model) {

        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

            model.addAttribute("userRoleText", user.getUserRole().getTexts());
        }catch (NullPointerException e){
            model.addAttribute("userRoleText", UserRole.NOTENOUGHSMART.getTexts());
        }
		return "userOrders";
	}

    @RequestMapping(value={"/loginKiller"}, method=RequestMethod.GET)
    public String loginK() {

        activeUser = new ActiveUser(UserRole.HUNTER);
        return "loginH";
    }
    @RequestMapping(value={"/loggedIn"}, method=RequestMethod.POST)
    public String loggedIn(Principal principal) {
        if(activeUser.getUserRole() == UserRole.HUNTER){
            User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();//userService.findOneUser(Integer.parseInt(principal.getName()));
            user.setUserRole(UserRole.HUNTER);
            userService.save(user);
        }
        return "home";
    }
//    @RequestMapping(value={"/killerLoggedIn"}, method=RequestMethod.POST)
//    public String loggedInK(Principal principal) {
//        User user = userService.fetchUser(Integer.parseInt(principal.getName()));
//        user.setUserRole(UserRole.HUNTER);
//        return "home";
//    }
}
