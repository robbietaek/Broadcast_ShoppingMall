package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;

@Controller
@RequestMapping("buyerpage")
public class BuyerpageController {
	   @Autowired
	   private ShopService service;
	   
	   @GetMapping("*")
	   public ModelAndView itemSelect() {
	      ModelAndView mav = new ModelAndView();
	      return mav;   
	   }
}
