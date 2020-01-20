package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BorderMapper;
import dao.mapper.ReplyboardMapper;
import logic.Replyboard;

@Repository
public class ReplyboardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String, Object> param = new HashMap<>();
	
	public int count(String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype",searchtype);
		param.put("searchcontent", "'%" + searchcontent + "%'");
		return sqlSession.getMapper(ReplyboardMapper.class).count(param);
	}

	public List<Replyboard> list(int pageNum, int limit, String searchtype, String searchcontent) {
		param.clear();
		param.put("searchtype",searchtype);
		param.put("searchcontent", "'%" + searchcontent + "%'");
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		return sqlSession.getMapper(ReplyboardMapper.class).select(param);
	}
}