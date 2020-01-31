package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import dao.mapper.ItemmanagementMapper;
import logic.Item;
import logic.Itemmanagement;
import logic.Review;
import logic.Shopbasket;
import logic.User;
import logic.sold;

@Repository
public class ItemDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	private Map<String, Object> param = new HashMap<String, Object>();

	public void insert(Item item) {
		param.clear();
		// id : 등록된 id의 최대값
		int id = sqlSession.getMapper(ItemMapper.class).maxid(); // 결과를 Integer로 전달
		item.setItemid(++id);
		sqlSession.getMapper(ItemMapper.class).insert(item); // db에 등록

	}

	public Item selectOne(String itemid) {
		param.clear();
		param.put("itemid", itemid);
		return sqlSession.getMapper(ItemMapper.class).sellingselect(param).get(0);
	}

	public void update(Item item) {
		sqlSession.getMapper(ItemMapper.class).update(item);
	}

	public void delete(String itemid) {
		param.clear();
		param.put("itemid", itemid);
		sqlSession.getMapper(ItemMapper.class).delete(param);
	}

	// 내가 판매등록한 리스트 숫자
	public int sellingcount(String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid", sessionid);
		return sqlSession.getMapper(ItemMapper.class).sellingcount(param);
	}

	// 내가 판매등록한 리스트
	public List<Item> sellinglist(Integer pageNum, int limit, String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid",sessionid);
		return sqlSession.getMapper(ItemMapper.class).sellingselect(param);
	}
	
	//테마별 카운트
	public int temacount(String searchtype, String searchcontent, String tema, String visitid) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("tema", tema);
		param.put("visitid",visitid);
		return sqlSession.getMapper(ItemMapper.class).temacount(param);
	}
	
	//테마별 리스트
	public List<Item> temalist(Integer pageNum, int limit, String searchtype, String searchcontent, String tema, String visitid) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("tema",tema);
		param.put("visitid",visitid);
		return sqlSession.getMapper(ItemMapper.class).temaselect(param);
	}

	public void jjiminsert(Shopbasket sb) {
		sqlSession.getMapper(ItemMapper.class).jjiminsert(sb);
	}

	public int getjjimcount(String itemid, String userid) {
		param.clear();
		param.put("itemid", itemid);
		param.put("userid", userid);
		return sqlSession.getMapper(ItemMapper.class).jjimcount(param);
	}

	public void jjimdelete(Shopbasket sb) {
		sqlSession.getMapper(ItemMapper.class).jjimdelete(sb);		
	}
	
	public int getsalemaxid() {
		return sqlSession.getMapper(ItemmanagementMapper.class).getsalemaxid();
	}

	public void buying(Itemmanagement im) {
		sqlSession.getMapper(ItemmanagementMapper.class).buying(im);
	}

	public String maxyear(String userid) {
		param.clear();
	    param.put("userid", userid);
	    return sqlSession.getMapper(ItemMapper.class).maxyear(param);
	}

	public String minyear(String userid) {
		param.clear();
		param.put("userid", userid);
		return sqlSession.getMapper(ItemMapper.class).minyear(param);
	}

	public List<sold> soldList(String userid, String year) {
		param.clear();
		param.put("userid", userid);
		param.put("year", year);
		return sqlSession.getMapper(ItemMapper.class).soldlist(param);
	}

	public List<sold> takeList(String userid, int year) {
		param.clear();
		param.put("userid", userid);
		param.put("year", year);
		return sqlSession.getMapper(ItemMapper.class).takeList(param);
	}

	public Integer maxmonth(String userid, String year) {
		param.clear();
		param.put("userid", userid);
		param.put("year", year);
		return sqlSession.getMapper(ItemMapper.class).maxmonth(param);
	}
	
	public int getItemmanagementcount(String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid", sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getItemmanagementcount(param);
	}

	public List<Itemmanagement> getItemmangement(Integer pageNum, int limit, String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid",sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getItemmangement(param);
	}

	public int getTakebackcount(String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid", sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getTakebackcount(param);
	}

	public List<Itemmanagement> getTakeback(Integer pageNum, int limit, String searchtype, String searchcontent,
			String sessionid) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid",sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getTakeback(param);
	}

	public int getsellingcompletecount(String searchtype, String searchcontent, String sessionid) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid", sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getsellingcompletecount(param);
	}

	public List<Itemmanagement> getsellingcomplete(Integer pageNum, int limit, String searchtype, String searchcontent,
			String sessionid) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("sessionid",sessionid);
		return sqlSession.getMapper(ItemmanagementMapper.class).getsellingcomplete(param);
	}

	
	public void review(Review review) {
	      sqlSession.getMapper(ItemMapper.class).create(review);
	   }

	   public int reviewcount(String itemid) {
	      param.clear();
	      param.put("itemid", itemid);
	      return sqlSession.getMapper(ItemMapper.class).reviewcount(param);
	   }

	   public List<Review> reviewlist(Integer pageNum, int limit, String itemid) {
	      param.clear();
	      param.put("startrow", (pageNum - 1) * limit);
	      param.put("limit", limit);
	      param.put("itemid", itemid);
	      return sqlSession.getMapper(ItemMapper.class).reviewlist(param);
	   }

	   public int orderitem(String searchtype, String searchcontent, String buyerid) {
		      param.clear();
		      param.put("searchtype", searchtype);
		      param.put("searchcontent", searchcontent);
		      param.put("buyerid", buyerid);
		      return sqlSession.getMapper(ItemMapper.class).orderitem(param);
		   }

	   public List<Itemmanagement> orderlist(Integer pageNum, int limit, String searchtype, String searchcontent,
		         String buyerid) {
		      param.clear();
		      param.put("startrow", (pageNum - 1) * limit);
		      param.put("pageNum", pageNum);
		      param.put("limit", limit);
		      param.put("searchtype", searchtype);
		      param.put("searchcontent", searchcontent);
		      param.put("buyerid", buyerid);
		      return sqlSession.getMapper(ItemMapper.class).orderlist(param);
		   }
	
	


	




}
