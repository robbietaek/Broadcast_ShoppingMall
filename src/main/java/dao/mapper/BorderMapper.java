package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Border;

public interface BorderMapper {

	@Select({"<script>",
		"select count(*) from border",
		"<if test='tema != null'> where tema = #{tema} </if>",
		"<if test='searchtype != null'> and ${searchtype} like ${searchcontent} </if>"+
		"</script>"})
	int count(Map<String, Object> param);

	@Select({"<script>",
		" ${sql}" +
		" <if test='tema != null'> where tema = #{tema} </if>",
		"<if test='searchtype != null'> and ${searchtype} like ${searchcontent} </if>",
		"</script>"
	})
	List<Border> select(Map<String, Object> param);

	@Select("select ifnull(max(no),0) from border")
	int maxnum();

	@Insert("insert into border(no, tema, nickname, subject, content, file, date, view)" +
	         " values(#{no},#{tema},#{nickname},#{subject},#{content},#{fileUrl},now(),0)")
	void insert(Border border);

	@Update("update border set view=view+1 where no=#{no}")
	void updateviewadd(Map<String, Object> param);

	@Select("${sql} where no=#{no}")
	Border selectOne(Map<String, Object> param);

}
