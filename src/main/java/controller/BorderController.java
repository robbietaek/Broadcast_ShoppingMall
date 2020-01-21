package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import logic.Border;
import logic.Replyboard;
import logic.ShopService;

@Controller
@RequestMapping("border")
public class BorderController {
   @Autowired
      private ShopService service;
      //view : /WEB-INF/view/border/list.jsp
      @RequestMapping("list")
      public ModelAndView list(HttpServletRequest request, Integer pageNum, String searchtype, String searchcontent) { 
         ModelAndView mav = new ModelAndView();
         String tema = (request.getParameter("tema"));
         if(searchtype != null && searchtype.trim().equals(""))
            searchtype = null;
         if(searchcontent != null && searchcontent.trim().equals(""))
            searchcontent = null;
         if(searchtype == null || searchcontent == null) {
            searchtype = null;
            searchcontent = null;
         }
         if(pageNum == null || pageNum.toString().equals("")) {
            pageNum = 1;
         }
         int limit = 10; //페이지당 게시물 건수
         int listcount = service.bordercount(searchtype, searchcontent,tema); //전체 등록된 게시물 건수
         List<Border> borderlist = service.borderlist(pageNum,limit, searchtype, searchcontent,tema);
         // 최대 페이지
         int maxpage = (int)((double)listcount/limit + 0.95);
         // 보여지는 첫번째 페이지
         int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
         // 보여지는 마지막 페이지
         int endpage = startpage + 9;
         if(endpage > maxpage) endpage = maxpage;
         //화면에 출력되는 게시물 번호.
         int borderno = listcount - (pageNum - 1) * limit;
         mav.addObject("tema", tema);
         mav.addObject("pageNum", pageNum);
         mav.addObject("maxpage", maxpage);
         mav.addObject("startpage", startpage);
         mav.addObject("endpage", endpage);
         mav.addObject("listcount", listcount);
         mav.addObject("borderno", borderno);
         mav.addObject("borderlist", borderlist);
         return mav;
      }
   
      @PostMapping("write")
      public ModelAndView write(@Valid Border border, BindingResult bresult, HttpServletRequest request) {
               ModelAndView mav = new ModelAndView();
               String tema = (request.getParameter("tema"));
//               if(bresult.hasErrors()) {
//                  mav.getModel().putAll(bresult.getModel());
//                  return mav;
//               }
            try {
               service.borderWrite(border,request);
               mav.setViewName("redirect:list.shop?tema="+tema);
            }catch (Exception e) {
               e.printStackTrace();
               throw new BoardException
                  ("게시물 등록에 실패했습니다.","write.shop?tema="+tema);
            }
               return mav;
         }
      @GetMapping("*")
      public ModelAndView getBoard(Integer no, HttpServletRequest request, String searchtype, String searchcontent) {
         ModelAndView mav = new ModelAndView();
         Border border = null;    
         if(no == null) {
            border = new Border();
         }else {
            border = service.getBorder(no, request);
         }
         mav.addObject("border", border);
         return mav;
      }
      @PostMapping("delete")
      public ModelAndView delete(Border border, BindingResult bresult, HttpServletRequest request) {
   	   ModelAndView mav = new ModelAndView();
   	   String tema = request.getParameter("tema");
   	   try {
   		   service.borderDelete(border);
   		   mav.setViewName("redirect:list.shop?tema="+tema);
   	   } catch (Exception e) {
   		   e.printStackTrace();
              throw new BoardException("게시글 삭제에 실패했습니다.","delete.shop?no="+border.getNo());
   	   }
   	   return mav;
      }
      @PostMapping("update")
      public ModelAndView update(@Valid Border border, BindingResult bresult, 
                  HttpServletRequest request) {
         ModelAndView mav = new ModelAndView();
         Border dbBorder = service.getBorder(border.getNo());
         String tema = request.getParameter("tema");
         if(bresult.hasErrors()) {
            mav.getModel().putAll(bresult.getModel());
            return mav;   
          }
         try {
            service.borderUpdate(border,request);
            mav.setViewName("redirect:list.shop?tema=" + tema);
               }catch(Exception e) {
               e.printStackTrace();
               throw new BoardException("게시글 수정에 실패했습니다.","update.shop?no="+border.getNo());
               }
            return mav;
       }
}