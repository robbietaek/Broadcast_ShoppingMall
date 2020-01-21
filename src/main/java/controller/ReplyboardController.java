package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Border;
import logic.Replyboard;
import logic.ShopService;

@Controller
@RequestMapping("replyboard")
public class ReplyboardController {
	@Autowired
	private ShopService service;
	    
    @RequestMapping(value="replyboardwrite", method=RequestMethod.POST)
    public ModelAndView reply(Replyboard replyboard, HttpServletRequest request, BindingResult bresult, Border border) {
  	  ModelAndView mav = new ModelAndView();
  	  System.out.println("**********");
        try {
            service.replywrite(replyboard,request);
            mav.setViewName("redirect:detail.shop?no="+border.getNo());
         }catch (Exception e) {
            e.printStackTrace();
            throw new BoardException
               ("게시물 등록에 실패했습니다.","detail.shop?no="+border.getNo());
         }
            return mav;
      }
    
    
    
}
