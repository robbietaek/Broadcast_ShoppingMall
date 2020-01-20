package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Replyboard;

public interface ReplyboardMapper {

	@Select("select count(*) from replyboard where no=#{no}")
	int count(Map<String, Object> param);

	@Select({"<script>",
	      "select * from replyboard" +
	      "<if test='searchtype != null'> where ${searchtype} like ${searchcontent} </if>"
	      + "order by grp desc"
	      + "</script>"
	   })
	List<Replyboard> select(Map<String, Object> param);

}
