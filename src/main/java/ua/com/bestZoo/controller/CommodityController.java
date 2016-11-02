package ua.com.bestZoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.com.bestZoo.entity.Commodity;
import ua.com.bestZoo.service.CommodityService;

@Controller
public class CommodityController {
	
	@Autowired
	private CommodityService commodityService;

	@RequestMapping(value="/commodity", method=RequestMethod.GET)
	public String commodity(Model model){
		List<Commodity> commodities = commodityService.findAll();
		model.addAttribute("commodity", new Commodity());
		model.addAttribute("commodities", commodities);
		System.out.println(commodityService.findByName("56"));
		return "commodity";
	}
	
	@RequestMapping(value="/newCommodity", method=RequestMethod.POST)
//	public String saveCommodity(@RequestParam String nameCommodity, @RequestParam String priceCommodity){
//			Commodity commodity = new Commodity(nameCommodity, Double.parseDouble(priceCommodity));
//			commodityService.save(commodity);
//		
	public String saveCommodity(@ModelAttribute Commodity commodity){
		commodityService.save(commodity);
	
		return "redirect:/commodity";
	}
	
	@RequestMapping(value="/del/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable String id){
		commodityService.delete(Integer.parseInt(id));
		return "redirect:/commodity";
	}
}
