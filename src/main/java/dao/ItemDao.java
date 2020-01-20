package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;
import logic.User;

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
		return sqlSession.getMapper(ItemMapper.class).select(param).get(0);
	}

	public void update(Item item) {
		sqlSession.getMapper(ItemMapper.class).update(item);
	}

	public void delete(String itemid) {
		param.clear();
		param.put("itemid", itemid);
		sqlSession.getMapper(ItemMapper.class).delete(param);
	}

	// 판매등록된 리스트 숫자
	public int count(String searchtype, String searchcontent, User user) {
		param.clear();
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		param.put("user", user);
		return sqlSession.getMapper(ItemMapper.class).count(param);
	}

	// 판매등록된 리스트
	public List<Item> list(Integer pageNum, int limit, String searchtype, String searchcontent, User user) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("searchtype", searchtype);
		param.put("searchcontent", searchcontent);
		return sqlSession.getMapper(ItemMapper.class).select(param);
	}

}
