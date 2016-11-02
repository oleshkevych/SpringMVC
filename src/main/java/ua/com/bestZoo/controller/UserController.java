package ua.com.bestZoo.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ua.com.bestZoo.entity.User;

import ua.com.bestZoo.service.UserService;

 
@Controller
public class UserController {
	@Autowired
	private UserService userService;


	@RequestMapping(value="/newUser", method=RequestMethod.GET)
	public String user(){
		return "user";
	}
	
	@RequestMapping(value="/newUserAdd", method=RequestMethod.POST)
	public String saveCommodity(@RequestParam String nameUser, @RequestParam String emailUser, @RequestParam String phoneUser, @RequestParam String passwordUser){
			User user = new User(nameUser, phoneUser, passwordUser, emailUser);
			userService.save(user);

		return "redirect:/";
	}
	
	@RequestMapping(value="/selectGet", method=RequestMethod.POST)
	public String select(@RequestParam String formSelect){
			System.out.println(formSelect);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/loginpage", method=RequestMethod.GET)
	public String loginpage(){
		return "loginpage";
	}
	//need to change
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public String home(Principal principal){
		
		return "redirect:/";
	}
	
	@RequestMapping(value={"/logout"}, method=RequestMethod.POST)
	public String logout(){
		
		return "redirect:/";
	}
	//need to change
	@RequestMapping(value={"/add"}, method=RequestMethod.POST)
	public String getUserName(Principal principal){
		User user = userService.findOneUser(Integer.parseInt(principal.getName()));
		return "redirect:/";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String profile(Principal principal, Model model){
		model.addAttribute("user", userService.fetchUser(Integer.parseInt(principal.getName())));
		
		return "profile";
	}
	@RequestMapping(value={"/saveImage"}, method=RequestMethod.POST)
	public String saveImage(@RequestParam("image") MultipartFile file, Principal principal){
		
		User user = userService.fetchUser(Integer.parseInt(principal.getName()));
		
		String path = "D://Oleshkevych//Advanced//SpringProperlyMVC//Image" + user.getUsername()+"//"+file.getOriginalFilename();
		File f = new File(path);
		System.out.println(user.getCommodities().get(10));
		f.mkdirs();
		try{
			file.transferTo(f);
		}catch(IllegalStateException|IOException e){
			System.out.println("pipec");
		}
		
		
		return "redirect:/profile";
	}
	
	
}
