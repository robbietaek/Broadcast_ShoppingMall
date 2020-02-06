package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.BoardException;
import exception.LoginException;
import logic.Item;
import logic.Itemmanagement;
import logic.Review;
import logic.ShopService;
import logic.Shopbasket;
import logic.User;
import logic.sold;

@Controller // @Component+Controller 기능
@RequestMapping("item") // shop/xxx.shop
public class ItemController {
	@Autowired
	private ShopService service;

	@GetMapping("*")
	public ModelAndView itemSelect() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());
		return mav;
	}

	@GetMapping("sell") // 화면뿌려주기
	public ModelAndView sellForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());
		return mav;
	}

	@PostMapping("sell") // 유효성검증 및 데이터 전달
	public ModelAndView sell(@Valid Item item, BindingResult bresult, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = (User) session.getAttribute("loginUser");
		if (bresult.hasErrors()) { // 에러가 있을 시
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		service.itemCreate(item, request); // 아이템에 있는걸 모두 DB에 넣는다.
		mav.setViewName("redirect:/item/selling.shop");
		return mav;
	}

	@RequestMapping("selling")
	public ModelAndView list(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
		// itemList : item테이블의 모든 레코드와 모든 컬럼을 정보를 저장
		User user = (User) session.getAttribute("loginUser");
		String sessionid = user.getUserid();
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
		int listcount = service.itemcount(searchtype, searchcontent, sessionid); // 전체 등록된 게시물 건수
		List<Item> itemList = service.itemlist(pageNum, limit, searchtype, searchcontent, sessionid); // 건수만큼 보드 객체를 가져와
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

	@GetMapping("sellingedit")
	public ModelAndView sellingeditForm(String itemid) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(itemid);
		mav.addObject("item", item);
		return mav;
	}

	@PostMapping("sellingedit")
	public ModelAndView sellingedit(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
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

	@RequestMapping("category")
	public ModelAndView category(Integer pageNum, String searchtype, String searchcontent, HttpServletRequest request) {
		// itemList : item테이블의 모든 레코드와 모든 컬럼을 정보를 저장

		ModelAndView mav = new ModelAndView();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date day = new Date();
		String now = format.format(day);
		String tema = (request.getParameter("tema"));
		String visitid = (request.getParameter("userid"));
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

		int limit = 12; // 페이지당 보여지는 게시물 건수
		int listcount = service.categorycount(searchtype, searchcontent, tema, visitid); // 전체 등록된 게시물 건수
		List<Item> itemList = service.categorylist(pageNum, limit, searchtype, searchcontent, tema, visitid); // 건수만큼 보드
																												// 객체를
																												// 가져와
		int maxpage = (int) ((double) listcount / limit + 0.95); // 마지막페이지, 최대페이지
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 보여지는 첫번째 페이지
		int endpage = startpage + 9; // 보여지는 마지막 페이지
		if (endpage > maxpage) { // end 페이지가 max 페이지를 넘지 못하도록
			endpage = maxpage;
		}
		int itemno = listcount - (pageNum - 1) * limit; // 화면에 출력되는 게시물 번호 (가짜번호)
		mav.addObject("now", now);
		mav.addObject("tema", tema);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("itemList", itemList);
		mav.addObject("itemno", itemno);
		return mav;

	}

	@RequestMapping("sellingdetail")
	public ModelAndView sellingdetailForm(Integer pageNum, Integer num, String itemid, HttpSession session,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(itemid);

		if (session.getAttribute("loginUser") != null) {
			User loginuser = (User) session.getAttribute("loginUser");
			int jjimcount = service.getjjimcount(itemid, loginuser.getUserid());
			mav.addObject("jjimcount", jjimcount);
		}
		mav.addObject("item", item);
		mav.addObject("shopbasket", new Shopbasket());
		mav.addObject(new Itemmanagement());
		// 리뷰//
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		mav.addObject("ratingOptions", ratingOptions);
		mav.addObject("review", new Review());
		// 리뷰 읽어오기//
		Review review = null;
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10; // 페이지당 보여지는 게시물 건수
		int listcount = service.reviewcount(itemid); // 전체 등록된 게시물 건수
		List<Review> reviewlist = service.reviewlist(pageNum, limit, itemid); // 건수만큼 보드 객체를 가져와
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
		mav.addObject("reviewlist", reviewlist);

		return mav;
	}

	@PostMapping("sellingdetail")
	public ModelAndView sellingdetail(@Valid Itemmanagement im, BindingResult bresult, String itemid,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		int quantity = im.getQuantity();
		mav.addObject("itemid", itemid);
		mav.addObject("quantity", quantity);
		mav.setViewName("redirect:buying.shop");
		return mav;
	}

	@GetMapping("buying")
	public ModelAndView buyingForm(String itemid, String quantity, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(itemid);
		
		User user = (User) session.getAttribute("loginUser");
		mav.addObject("item", item);
		mav.addObject("user", user);
		mav.addObject("quantity", quantity);
		mav.addObject(new Itemmanagement());
		return mav;
	}

	@PostMapping("buying")
	public ModelAndView buying(Itemmanagement im, String paytype) {
		ModelAndView mav = new ModelAndView();
		int itemid = im.getItemid();
		System.out.println(paytype);
		System.out.println(im.getPayment());
		Item item = service.getItem(itemid + "");
		if (paytype.equals("1")) {
			im.setPayment("1,계좌이체,"+im.getPayment());
		}else {
			im.setPayment("2,신용/체크카트"+im.getPayment());
		}
		im.setUserid(item.getUserid());
		im.setCode(1);
		im.setSubject(item.getSubject());
		im.setItemname(item.getItemname());
		im.setTema(item.getTema());
		service.buying(im);
		mav.setViewName("redirect:/item/buyingcomplete.shop?itemid=" + item.getItemid());
		return mav;
	}

	@RequestMapping(value = "jjiminsert", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String jjiminsert(String userid, int itemid, String tema, HttpSession session) {
		Shopbasket sb = new Shopbasket();
		User user = (User) session.getAttribute("loginUser");
		sb.setUserid(user.getUserid());
		sb.setItemid(itemid);
		service.jjiminsert(sb);
		return "<script> location.href = 'sellingdetail.shop?userid=" + userid + "&tema=" + tema + "&itemid=" + itemid
				+ "'\n </script>";
	}

	@RequestMapping(value = "jjimdelete", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String jjimdelete(String userid, int itemid, String tema, HttpSession session) {
		Shopbasket sb = new Shopbasket();
		User user = (User) session.getAttribute("loginUser");
		sb.setUserid(user.getUserid());
		sb.setItemid(itemid);
		service.jjimdelete(sb);
		return "<script> location.href = 'sellingdetail.shop?userid=" + userid + "&tema=" + tema + "&itemid=" + itemid
				+ "'\n </script>";
	}

	@RequestMapping("buyingcomplete")
	public ModelAndView buyingcomplete(String itemid) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(itemid);
		mav.addObject("item", item);
		return mav;
	}

	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/") + "item/imgfile/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		// upload : 업로드된 이미지 정보 저장, 이미지 파일
		if (!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename()); // 업로드될 파일을 저장할 File 객체
			try {
				upload.transferTo(file); // 업로드 파일 생성
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = "/project/item/imgfile/" + upload.getOriginalFilename(); // FullPath로 지정
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckedit";
	}

	@RequestMapping(value = "state")
	public ModelAndView state(String userid, String year) {
		ModelAndView mav = new ModelAndView();
		if (year.equals("")) {
			mav.setViewName("redirect:ENull.shop");
			return mav;
		}

		String maxyear = service.getmaxYear(userid);
		String minyear = service.getminYear(userid);
		int year1 = Integer.parseInt(year) - 1;
		int year2 = Integer.parseInt(year);
		List<sold> soldList = service.getsold(userid, year);
		List<sold> takeList1 = service.gettake(userid, year1);
		List<sold> takeList2 = service.gettake(userid, year2);
		int maxmonth = service.getmaxMonth(userid, year);
		String[] month = { "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" };

		// 이번년도
		mav.addObject("year1", year);
		mav.addObject("maxmonth", maxmonth);
		mav.addObject("maxyear", maxyear);
		mav.addObject("year", maxyear);
		mav.addObject("minyear", minyear);
		mav.addObject("month", month);
		mav.addObject("soldlist", soldList);
		mav.addObject("takeList1", takeList1);
		mav.addObject("takeList2", takeList2);
		return mav;

	}

	@RequestMapping(value = "state1")
	@ResponseBody
	public ModelAndView state1(String userid, String year) {
		System.out.println("state1입니다.");
		String[] month = { "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" };
		ModelAndView mav = new ModelAndView();
		String maxyear = service.getmaxYear(userid);
		String minyear = service.getminYear(userid);
		List<sold> soldList = service.getsold(userid, year);
		int maxmonth = service.getmaxMonth(userid, year);

		mav.addObject("maxmonth", maxmonth);
		mav.addObject("maxyear", maxyear);
		mav.addObject("minyear", minyear);
		mav.addObject("month", month);
		mav.addObject("soldlist", soldList);
		mav.setViewName("redirect:/item/state.shop?userid=" + userid + "&year=" + year);
		return mav;
	}

	@RequestMapping("delivery")
	public ModelAndView deliverylist(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String sessionid = user.getUserid();
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
		int listcount = service.getItemmanagementcount(searchtype, searchcontent, sessionid); // 전체 등록된 게시물 건수
		List<Itemmanagement> itemList = service.getItemmangement(pageNum, limit, searchtype, searchcontent, sessionid); // 건수만큼
																														// 보드
																														// 객체를
																														// 가져와
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

	@RequestMapping("takeback")
	public ModelAndView takebacklist(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String sessionid = user.getUserid();
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
		int listcount = service.getTakebackcount(searchtype, searchcontent, sessionid); // 전체 등록된 게시물 건수
		List<Itemmanagement> itemList = service.getTakeback(pageNum, limit, searchtype, searchcontent, sessionid); // 건수만큼
																													// 보드
																													// 객체를
																													// 가져와
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

	@RequestMapping("sellingcomplete")
	public ModelAndView sellingcompletelist(Integer pageNum, String searchtype, String searchcontent,
			HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String sessionid = user.getUserid();
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
		int listcount = service.getsellingcompletecount(searchtype, searchcontent, sessionid); // 전체 등록된 게시물 건수
		List<Itemmanagement> itemList = service.getsellingcomplete(pageNum, limit, searchtype, searchcontent,
				sessionid); // 건수만큼 보드 객체를 가져와
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

///////////////////////////////////	//리뷰///////////////////////////////////
	@PostMapping("review")
	public ModelAndView review(Review review, HttpServletRequest request, Item item) {
		ModelAndView mav = new ModelAndView();
		String visitid = (request.getParameter("userid"));
		System.out.println(review);
		try {
            service.review(review,request);
            mav.setViewName("redirect:sellingdetail.shop?userid="+visitid+"&tema="+item.getTema()+"&itemid="+item.getItemid());
         }catch (Exception e) {
            e.printStackTrace();
            throw new BoardException
               ("게시물 등록에 실패했습니다.","sellingdetail.shop?userid="+visitid+"&tema="+item.getTema()+"&itemid="+item.getItemid());
         }
            return mav;
      }
///////////////////////////////////////////////////////////
	@RequestMapping(value="customer-order")
	  public ModelAndView customer_order(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
	     ModelAndView mav = new ModelAndView();
	     User user = (User)session.getAttribute("loginUser");
	     String buyerid = user.getUserid();
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
	     int listcount = service.getorderitem(searchtype, searchcontent ,buyerid);
	     List<Itemmanagement> orderList = service.orderlist(pageNum, limit, searchtype, searchcontent, buyerid);
	     int itemno = listcount - (pageNum - 1) * limit; // 화면에 출력되는 게시물 번호 (가짜번호)
	     int maxpage = (int) ((double) listcount / limit + 0.95); // 마지막페이지, 최대페이지
	     int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 보여지는 첫번째 페이지
	     int endpage = startpage + 9; // 보여지는 마지막 페이지
	     if (endpage > maxpage) { // end 페이지가 max 페이지를 넘지 못하도록
	         endpage = maxpage;
	      }
	   
	        mav.addObject("pageNum", pageNum);
	      mav.addObject("maxpage", maxpage);
	      mav.addObject("startpage", startpage);
	      mav.addObject("endpage", endpage);
	      mav.addObject("listcount", listcount);
	      mav.addObject("orderList", orderList);
	      mav.addObject("itemno", itemno);
	      return mav;
	  

	  }
	  
	  //////////////////////////// 주문 내역 자세히 //////////////////////////////////////////////
	  @RequestMapping(value="orderdetail")
	  public ModelAndView orderdetail(String userid, String buyerid, String itemid, String saleid) {
	     ModelAndView mav = new ModelAndView();
	    
	     //판매자 정보
	     User saleUser = service.getsaleUser(userid);
	   
	     //내 정보
	     User myUser = service.getUser(buyerid);
	    
	     //주소 설정 
	     String address[] = myUser.getAddress().split(",");
	     String address1 = address[0]+address[1]+address[2];
	    
	     //주문된 아이템
	     Item item = service.getItem(itemid);
	     
	     //주문된 아이템 정보
	     Itemmanagement imt = service.getItemmangement(itemid, saleid);
	     System.out.println(imt);
	     String payment[] = imt.getPayment().split(",");
	     
	     if(payment[0].equals("1")) {
	        mav.addObject("code", payment[0]);
	        mav.addObject("payment1", payment[1]);
	        mav.addObject("payment2", payment[2]);
	        mav.addObject("payment3", payment[3]);
	       
	     }else {
	        System.out.println(payment[0]);
	        System.out.println(payment[1]);
	        mav.addObject("code", payment[0]);
	        mav.addObject("payment1", payment[1]);
	        mav.addObject("payment2", payment[2]);
	     }
	     mav.addObject("address1",address1);
	     mav.addObject("imt", imt);
	     mav.addObject("item", item);
	     mav.addObject("myUser", myUser);
	     mav.addObject("saleUser", saleUser);
	     return mav;
	  }
	  @RequestMapping(value="ordercancle")
	  public ModelAndView orderCancle(String buyerid, String saleid) {
	     ModelAndView mav = new ModelAndView();
	     System.out.println(buyerid+","+saleid);
	     service.getordercancle(buyerid, saleid);
	     System.out.println("111111");
	     mav.setViewName("redirect:/item/customer-order.shop?userid="+buyerid);
	     return mav;
	  }
	  @RequestMapping(value="return2")
	  public ModelAndView return1(String saleid, String text) {
	     ModelAndView mav = new ModelAndView();
	     service.getreturnUpdate(saleid, text);
	     mav.setViewName("redirect:/item/return3.shop");
	     return mav;
	  }
	  
	  
	  
	  
	  ////////////////////////// 결제 내역 /////////////////////////
	  @RequestMapping(value="payment")
	  public ModelAndView payment(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
	     ModelAndView mav = new ModelAndView();
	     User user = (User)session.getAttribute("loginUser");
	     String userid = user.getUserid();
	    
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
	     
	     int limit = 10;
	     int paymentcount = service.getpaymentcnt(searchtype, searchcontent, userid);
	     List<Itemmanagement> paymentlist = service.paymentlist(pageNum, limit, searchtype, searchcontent, userid);
	     int itemno = paymentcount - (pageNum - 1) * limit; // 화면에 출력되는 게시물 번호 (가짜번호)
	     int maxpage = (int) ((double) paymentcount / limit + 0.95); // 마지막페이지, 최대페이지
	     int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 보여지는 첫번째 페이지
	     int endpage = startpage + 9; // 보여지는 마지막 페이지
	     if (endpage > maxpage) { // end 페이지가 max 페이지를 넘지 못하도록
	         endpage = maxpage;
	      }
	     mav.addObject("pageNum", pageNum);
	     mav.addObject("maxpage", maxpage);
	     mav.addObject("startpage", startpage);
	     mav.addObject("endpage", endpage);
	     mav.addObject("paymentcount", paymentcount);
	     mav.addObject("paymentlist", paymentlist);
	     mav.addObject("itemno", itemno);
	     return mav;
	  }
	  
	  @RequestMapping(value="customer-wishlist")
	  public ModelAndView item(Integer pageNum, String searchtype, String searchcontent, HttpSession session) {
	     ModelAndView mav = new ModelAndView();
	     User user = (User)session.getAttribute("loginUser");
	     String userid = user.getUserid();
	    
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
	     
	     int limit = 8;
	     int dipscnt = service.getitemcnt(searchtype, searchcontent, userid);
	     List<Shopbasket> dipslist = service.dipslist(pageNum, limit, searchtype, searchcontent, userid);
	     
	     for(Shopbasket s : dipslist) {
	       s.setItem(service.getItem(Integer.toString(s.getItemid())));
	     }
	     
	     for(Shopbasket s : dipslist) {
	        System.out.println(s);
	     }
	     int itemno = dipscnt - (pageNum - 1) * limit; // 화면에 출력되는 게시물 번호 (가짜번호)
	     int maxpage = (int) ((double) dipscnt / limit + 0.95); // 마지막페이지, 최대페이지
	     int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 보여지는 첫번째 페이지
	     int endpage = startpage + 9; // 보여지는 마지막 페이지
	     if (endpage > maxpage) { // end 페이지가 max 페이지를 넘지 못하도록
	         endpage = maxpage;
	      }
	     mav.addObject("pageNum", pageNum);
	     mav.addObject("maxpage", maxpage);
	     mav.addObject("startpage", startpage);
	     mav.addObject("endpage", endpage);
	     mav.addObject("dipscnt", dipscnt);
	     mav.addObject("dipslist", dipslist);
	     mav.addObject("itemno", itemno);
	     return mav;
	  }
}