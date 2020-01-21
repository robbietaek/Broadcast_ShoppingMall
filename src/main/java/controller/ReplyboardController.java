package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
    @GetMapping("*")
    public ModelAndView getReply(Integer no, HttpServletRequest request, String searchtype, String searchcontent) {
       ModelAndView mav = new ModelAndView();
       int pageNum = 1;
       int limit = 10;
       try {
      	 pageNum = Integer.parseInt(request.getParameter("pageNum"));
       } catch(NumberFormatException e) {
       }
       if(searchtype != null && searchtype.trim().equals(""))
          searchtype = null;
       if(searchcontent != null && searchcontent.trim().equals(""))
          searchcontent = null;
       if(searchtype == null || searchcontent == null) {
          searchtype = null;
          searchcontent = null;
        }
       int replycount = service.replyCount(searchtype, searchcontent);
       List<Replyboard> replylist = service.replylist(pageNum,limit, searchtype, searchcontent);
       int maxpage = (int)((double)replycount/limit + 0.95);
       int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
       int endpage = startpage + 9;
       if(endpage > maxpage) endpage = maxpage;
       mav.addObject("no", no);
       mav.addObject("pageNum", pageNum);
       mav.addObject("maxpage", maxpage);
       mav.addObject("startpage", startpage);
       mav.addObject("endpage", endpage);       
       mav.addObject("replycount", replycount);
       return mav;       
    }
    
    @PostMapping("write")
    public ModelAndView reply(Replyboard replyboard, HttpServletRequest request, BindingResult bresult, Border border) {
  	  ModelAndView mav = new ModelAndView();
        String tema = (request.getParameter("tema"));
        try {
            service.replywrite(replyboard,request);
            mav.setViewName("redirect:detail.shop?tema="+tema+"&no="+border.getNo());
         }catch (Exception e) {
            e.printStackTrace();
            throw new BoardException
               ("게시물 등록에 실패했습니다.","detail.shop?tema="+tema+"&no="+border.getNo());
         }
            return mav;
      }
    
    
    
}
