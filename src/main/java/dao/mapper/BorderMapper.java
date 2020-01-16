package dao.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Select;

import logic.Border;

public interface BorderMapper {

	@Select({"<script>",
		"select count(*) from border",
		"<if test='code != null'> where tema = #{tema} </if>",
		"<if test='searchtype != null'> and ${searchtype} like ${searchcontent} </if>"+
		"</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
		" ${sql}" +
		" <if test='code != null'> where tema = #{tema} </if>",
		"<if test='searchtype != null'> and ${searchtype} like ${searchcontent} </if>",
		"</script>"
	})
	List<Border> select(Map<String, Object> param);

}
