package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;
import logic.User;

@Controller // @Component+Controller 기능
@RequestMapping("item") // shop/xxx.shop
public class ItemController {
	@Autowired
	private ShopService service;

	@RequestMapping("selling")
	public ModelAndView list(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
		// itemList : item테이블의 모든 레코드와 모든 컬럼을 정보를 저장
		User user = (User) session.getAttribute("loginUser");

		ModelAndView mav = new ModelAndView();

		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if (searchtype != null && searchtype.trim().equals("")) { // 입력내용 띄어쓰기?
			searchtype = null;
		}
		if (searchcontent != null && searchcontent.trim().equals("")) {
			searchcontent = null;
		}
		if (searchtype == null || searchcontent == null) { // 두개다 있어야지 검색되게
			searchtype = null;
			searchcontent = null;
		}

		int limit = 10; // 페이지당 보여지는 게시물 건수
		int listcount = service.itemcount(searchtype, searchcontent, user); // 전체 등록된 게시물 건수
		List<Item> itemList = service.itemlist(pageNum, limit, searchtype, searchcontent, user); // 건수만큼 보드 객체를 가져와
		int maxpage = (int) ((double) listcount / limit + 0.95); // 마지막페이지, 최대페이지
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 보여지는 첫번째 페이지
		int endpage = startpage + 9; // 보여지는 마지막 페이지
		if (endpage > maxpage) { // end 페이지가 max 페이지를 넘지 못하도록
			endpage = maxpage;
		}
		int itemno = listcount - (pageNum - 1) * limit; // 화면에 출력되는 게시물 번호 (가짜번호)
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("itemList", itemList);
		mav.addObject("itemno", itemno);
		return mav;

	}

	@RequestMapping("register")
	public ModelAndView register(@Valid Item item, BindingResult bresult, HttpServletRequest request) { // valid를 빼면 공백을
																										// 해도됨
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) { // 에러가 있을 시
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		service.itemCreate(item, request); // 아이템에 있는걸 모두 DB에 넣는다.
		mav.setViewName("redirect:/item/selling.shop");
		return mav;
	}

	@GetMapping("sellingeditForm")
	public ModelAndView sellingeditForm(String itemid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getItem(itemid));
		return mav;
	}

	@RequestMapping("sellingedit")
	public ModelAndView sellingedit(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		System.out.println(item);
		service.itemUpdate(item, request);
		mav.setViewName("redirect:/item/selling.shop");
		return mav;
	}

	@GetMapping("sellingdelete")
	public ModelAndView delete(String itemid) {
		ModelAndView mav = new ModelAndView();
		service.itemDelete(itemid);
		mav.setViewName("redirect:/item/selling.shop");
		return mav;
	}

	// @RequestMapping("detail")
	// @RequestMapping("*") //그 외의 모든 요청정보를 해줄 때 사용. 이럴 때는 URL에 아무것도 사용하면 안됨. 클릭한 곳
	// 그대로 설정해줌 GetMapping 과 동일함
	@GetMapping("*")
	public ModelAndView itemSelect() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());
		return mav;
	}

}