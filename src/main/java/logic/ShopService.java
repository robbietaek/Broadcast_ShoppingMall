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
import dao.UserDao;

@Service	//@Component + service 기능
public class ShopService {
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BorderDao borderDao;
	
	public List<Item> getItemList(){
	      return itemDao.list();
	   }
	   
	   public Item getItem(String id){
	      return itemDao.selectOne(id);
	   }
	   
	   public void itemDelete(String id){
	      itemDao.delete(id);
	   }

	   public void itemCreate(Item item, HttpServletRequest request) {
	      if(item.getPicture1()!=null&&!item.getPicture1().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture1(),request,"item/img/");
	         item.setPictureUrl1(item.getPicture1().getOriginalFilename());
	      }
	      if(item.getPicture2()!=null&&!item.getPicture2().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture2(),request,"item/img/");
	         item.setPictureUrl2(item.getPicture2().getOriginalFilename());
	      }
	      if(item.getPicture3()!=null&&!item.getPicture3().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture3(),request,"item/img/");
	         item.setPictureUrl3(item.getPicture3().getOriginalFilename());
	      }
	      if(item.getPicture4()!=null&&!item.getPicture4().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture4(),request,"item/img/");
	         item.setPictureUrl4(item.getPicture4().getOriginalFilename());
	      }
	      if(item.getPicture5()!=null&&!item.getPicture5().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture5(),request,"item/img/");
	         item.setPictureUrl5(item.getPicture5().getOriginalFilename());
	      }
	      itemDao.insert(item);
	   }

	   public void itemUpdate(Item item, HttpServletRequest request) {
	      if(item.getPicture1()!=null&&!item.getPicture1().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture1(),request,"item/img/");
	         item.setPictureUrl1(item.getPicture1().getOriginalFilename());
	      }
	      if(item.getPicture2()!=null&&!item.getPicture2().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture2(),request,"item/img/");
	         item.setPictureUrl2(item.getPicture2().getOriginalFilename());
	      }
	      if(item.getPicture3()!=null&&!item.getPicture3().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture3(),request,"item/img/");
	         item.setPictureUrl3(item.getPicture3().getOriginalFilename());
	      }
	      if(item.getPicture4()!=null&&!item.getPicture4().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture4(),request,"item/img/");
	         item.setPictureUrl3(item.getPicture4().getOriginalFilename());
	      }
	      if(item.getPicture5()!=null&&!item.getPicture5().isEmpty()) {   //업로드된 이미지파일이 존재하면
	         //파일을 업로드 : 업로드된 파일의 내용을 파일에 저장
	         uploadFileCreate(item.getPicture5(),request,"item/img/");
	         item.setPictureUrl5(item.getPicture5().getOriginalFilename());
	      }
	      itemDao.update(item);
	   }

	   private void uploadFileCreate(MultipartFile picture, HttpServletRequest request, String path) {
	      //picture : 업로드된 파일의 내용
	      String orgFile = picture.getOriginalFilename();      //파일의 이름
	      String uploadPath= request.getServletContext().getRealPath("/")+path;
	      File fpath = new File(uploadPath);
	      if(!fpath.exists()) {   //해당 Path가 없으면 만들고
	         fpath.mkdirs();      //여러개의 디렉토리를 만드려면 mkdirs 를 써주고 하나만 만들때 mkdir을 쓴다.
	      }
	      try{
	         //파일로 생성
	         picture.transferTo(new File(uploadPath+orgFile));   //해당Path에 파일이름으로 업로드해라
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	   }


	public void insert(User user) {
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
//게시판 부분
	public int bordercount(String searchtype, String searchcontent, int tema) {
		return borderDao.count(searchtype, searchcontent, tema);
	}

	public List<Border> borderlist(Integer pageNum, int limit, String searchtype, String searchcontent, int tema) {
		Map<String,Object> map = new HashMap<String,Object>();
		return borderDao.list(pageNum,limit,searchtype,searchcontent, tema);
	}

	public void borderWrite(Border border, HttpServletRequest request) {
		//첨부파일이 존재하는 경우
		if(border.getFile() != null && !border.getFile().isEmpty()) {
		uploadFileCreate(border.getFile(), request, "border/file/");
		//업로드 파일의 이름 지정
		border.setFileurl(border.getFile().getOriginalFilename());
	}
		int max = borderDao.maxnum();
		border.setNo(++max);	
		borderDao.insert(border);		
	}
//게시판 부분 끝
	
}
