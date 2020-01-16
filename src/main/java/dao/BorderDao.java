package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BorderMapper;
import logic.Border;

@Repository
public class BorderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Map<String, Object> param = new HashMap<>();
	private String bordercolumn = "select no, tema, nickname, subject, content, file,"
			                    + "date, view from border";
	
	public int count(String searchtype, String searchcontent, int tema) {
	param.clear();
	param.put("searchtype",searchtype);
	param.put("tema", tema);
	param.put("searchcontent", "'%" + searchcontent + "%'");
	return sqlSession.getMapper(BorderMapper.class).count(param);
	}

	public List<Border> list(Integer pageNum, int limit, String searchtype, String searchcontent,int tema) {
		String sql = bordercolumn;
		param.clear();
		param.put("sql", sql);
		param.put("searchtype",searchtype);
		param.put("searchcontent", "'%" + searchcontent + "%'");
		param.put("startrow", (pageNum - 1) * limit);
		param.put("tema",tema);
		param.put("limit", limit);
		return sqlSession.getMapper(BorderMapper.class).select(param);
	}
}
