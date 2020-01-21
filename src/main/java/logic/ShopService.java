package logic;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.validator.internal.metadata.aggregated.rule.ParallelMethodsMustNotDefineParameterConstraints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BorderDao;
import dao.ItemDao;
import dao.ReplyboardDao;
import dao.UserDao;

@Service // @Component + service 기능
public class ShopService {
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BorderDao borderDao;
	@Autowired
	private ReplyboardDao replyboardDao;

	private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
		// picture : 업로드된 파일의 내용
		String orgFile = picture.getOriginalFilename(); // 파일의 이름
		String uploadPath = request.getServletContext().getRealPath("/") + path;
		File fpath = new File(uploadPath);
		if (!fpath.exists()) { // 해당 Path가 없으면 만들고
			fpath.mkdirs(); // 여러개의 디렉토리를 만드려면 mkdirs 를 써주고 하나만 만들때 mkdir을 쓴다.
		}
		try {
			// 파일로 생성
			picture.transferTo(new File(uploadPath + orgFile)); // 해당Path에 파일이름으로 업로드해라
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/////////////////////////////////////////////////// User
	/////////////////////////////////////////////////// //////////////////////////////////////////

	public void insert(User user, HttpServletRequest request) {
	      System.out.println(user.getPic().getOriginalFilename());
	      uploadFileCreate(user.getPic(),request,"user/pic/");
	      user.setProfile(user.getPic().getOriginalFilename());
	      userDao.insert(user);
	   }

	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}

	public List<User> userlist() {
		return userDao.list();
	}

	public List<User> userList(String[] idchks) {
		return userDao.list(idchks);
	}

	//////////////////////////////////////////// Item
	//////////////////////////////////////////// ////////////////////////////////////////////////////

	// 판매중 목록 카운트
	public int itemcount(String searchtype, String searchcontent, String sessionid) {
		return itemDao.sellingcount(searchtype, searchcontent, sessionid);
	}

	// 판매중 목록
	public List<Item> itemlist(Integer pageNum, int limit, String searchtype, String searchcontent, String sessionid) {
		return itemDao.sellinglist(pageNum, limit, searchtype, searchcontent, sessionid);
	}

	// 아이템 가져오기
	public Item getItem(String itemid) {
		return itemDao.selectOne(itemid);
	}

	// 아이템 삭제
	public void itemDelete(String id) {
		itemDao.delete(id);
	}

	// 첨부파일 생성
	public void itemCreate(Item item, HttpServletRequest request) {
		if (item.getPicture1() != null && !item.getPicture1().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture1(), request, "item/img/");
			item.setPictureUrl1(item.getPicture1().getOriginalFilename());
		}
		if (item.getPicture2() != null && !item.getPicture2().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture2(), request, "item/img/");
			item.setPictureUrl2(item.getPicture2().getOriginalFilename());
		}
		if (item.getPicture3() != null && !item.getPicture3().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture3(), request, "item/img/");
			item.setPictureUrl3(item.getPicture3().getOriginalFilename());
		}
		if (item.getPicture4() != null && !item.getPicture4().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture4(), request, "item/img/");
			item.setPictureUrl4(item.getPicture4().getOriginalFilename());
		}
		if (item.getPicture5() != null && !item.getPicture5().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture5(), request, "item/img/");
			item.setPictureUrl5(item.getPicture5().getOriginalFilename());
		}
		itemDao.insert(item);
	}

	// 첨부파일 업데이트
	public void itemUpdate(Item item, HttpServletRequest request) {
		if (item.getPicture1() != null && !item.getPicture1().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture1(), request, "item/img/");
			item.setPictureUrl1(item.getPicture1().getOriginalFilename());
		}
		if (item.getPicture2() != null && !item.getPicture2().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture2(), request, "item/img/");
			item.setPictureUrl2(item.getPicture2().getOriginalFilename());
		}
		if (item.getPicture3() != null && !item.getPicture3().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture3(), request, "item/img/");
			item.setPictureUrl3(item.getPicture3().getOriginalFilename());
		}
		if (item.getPicture4() != null && !item.getPicture4().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture4(), request, "item/img/");
			item.setPictureUrl3(item.getPicture4().getOriginalFilename());
		}
		if (item.getPicture5() != null && !item.getPicture5().isEmpty()) { // 업로드된 이미지파일이 존재하면
			// 파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture5(), request, "item/img/");
			item.setPictureUrl5(item.getPicture5().getOriginalFilename());
		}
		itemDao.update(item);
	}

	public int categorycount(String searchtype, String searchcontent, String tema) {
		return itemDao.temacount(searchtype, searchcontent, tema);
	}

	public List<Item> categorylist(Integer pageNum, int limit, String searchtype, String searchcontent, String tema) {
		return itemDao.temalist(pageNum, limit, searchtype, searchcontent, tema);
	}

	////////////////////////////////////////// Boarder
	////////////////////////////////////////// /////////////////////////////////////////////////

	// 게시판 부분
	public int bordercount(String searchtype, String searchcontent, String tema) {
		return borderDao.count(searchtype, searchcontent, tema);
	}

	public List<Border> borderlist(Integer pageNum, int limit, String searchtype, String searchcontent, String tema) {
		Map<String, Object> map = new HashMap<String, Object>();
		return borderDao.list(pageNum, limit, searchtype, searchcontent, tema);
	}

	public void borderWrite(Border border, HttpServletRequest request) {
		// 첨부파일이 존재하는 경우
		if (border.getFile() != null && !border.getFile().isEmpty()) {
			uploadFileCreate(border.getFile(), request, "border/file/");
			// 업로드 파일의 이름 지정
			border.setFileUrl(border.getFile().getOriginalFilename());
		}
		int max = borderDao.maxnum();
		border.setNo(++max);
		borderDao.insert(border);
	}

	public Border getBorder(Integer num, HttpServletRequest request) {
		if (request.getRequestURI().contains("detail.shop")) {
			borderDao.viewadd(num);
		}
		return borderDao.selectOne(num);
	}

	public void borderDelete(Border border) {
		borderDao.delete(border.getNo());
	}

	public Border getBorder(int no) {
		return borderDao.selectOne(no);
	}

	public void borderUpdate(Border border, HttpServletRequest request) {
		if (border.getFile() != null && !border.getFile().isEmpty()) {
			uploadFileCreate(border.getFile(), request, "border/file/");
			// 업로드 파일의 이름 지정
			border.setFileUrl(border.getFile().getOriginalFilename());
		}
		borderDao.update(border);
	}

	public int replyCount(String searchtype, String searchcontent) {
		return replyboardDao.count(searchtype, searchcontent);
	}

	public List<Replyboard> replylist(int pageNum, int limit, String searchtype, String searchcontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		return replyboardDao.list(pageNum, limit, searchtype, searchcontent);
	}

	public void replywrite(Replyboard replyboard, HttpServletRequest request) {
		int max = replyboardDao.maxnum();
		replyboard.setNum(++max);
		replyboardDao.insert(replyboard);
	}

}
