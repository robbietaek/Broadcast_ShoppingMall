package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller
@RequestMapping("shop")
public class ShopController {

	
	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public ModelAndView all() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("index")
	public ModelAndView index(String userid) {
		ModelAndView mav = new ModelAndView();
		List<Item> itemlist = service.itemlist(userid);
		mav.addObject("itemlist",itemlist);
		return mav;
	}
}
