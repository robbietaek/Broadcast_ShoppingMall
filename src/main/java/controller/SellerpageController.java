package controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller
@RequestMapping("sellerpage")
public class SellerpageController {
	   @Autowired
	   private ShopService service;
	   
	   @GetMapping("*")
	   public ModelAndView itemSelect() {
	      ModelAndView mav = new ModelAndView();
	      return mav;   
	   }
	   
	   @RequestMapping("create")
	   public ModelAndView create() {
	      ModelAndView mav = new ModelAndView("sellerpage/");
	      mav.addObject(new Item());
	      return mav;
	   }
	   
	   @RequestMapping("register")
	   public ModelAndView register(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		   ModelAndView mav = new ModelAndView("item/add");
		   if(bresult.hasErrors()) {
			   mav.getModel().putAll(bresult.getModel());
			   return mav;
		   }
		   service.itemCreate(item,request);
		   mav.setViewName("redirect:/sellerpage/selled.shop");
		   return mav;
	   }
}
