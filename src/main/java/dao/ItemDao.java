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
	
	public List<Item> list(User user) {
		param.clear();
		param.put("userid",user.getUserid());
		return sqlSession.getMapper(ItemMapper.class).select(param);
	}
	
	public void insert(Item item) {
		param.clear();
		//id : 등록된 id의 최대값
		int id = sqlSession.getMapper(ItemMapper.class).maxid();		//결과를 Integer로 전달
		item.setItemid(++id);
		sqlSession.getMapper(ItemMapper.class).insert(item);	//db에 등록
			
	}
	
	public Item selectOne(String id){
		param.clear();
		param.put("id", id);
		return sqlSession.getMapper(ItemMapper.class).select(param).get(0);
	}

	public void update(Item item) {
		sqlSession.getMapper(ItemMapper.class).update(item);
	}
	
	public void delete(String id) {
		param.clear();
		param.put("id", id);
		sqlSession.getMapper(ItemMapper.class).delete(param);
	}
	
}
