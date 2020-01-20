package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {

	@Select({"<script>",
	    "select itemid, itemname, price, description, picture1 pictureUrl1, picture2 pictureUrl2, picture3 pictureUrl3, picture4 pictureUrl4, picture5 pictureUrl5, vod, subject, tema, date from item ",
	    " <if test='itemid != null'> where itemid = #{itemid}</if>",
	    " <if test='userid != null'> where userid = #{userid}</if>",
	    " <if test='searchtype != null'> where ${searchtype} like '%${searchcontent}%'</if>",
	    " <if test='itemid == null'> order by date desc limit #{startrow},#{limit}</if>",
	    "</script>"})
	List<Item> select(Map<String,Object> param);
	
	@Select({"<script>",
		"select count(*) from item ",
		"<if test = 'searchtype!=null'> where ${searchtype} like '%${searchcontent}%' </if>",
		"<if test = 'userid!=null'> where userid = #{userid} </if>",
		"</script>"})
	int count(Map<String, Object> param);	

	@Select("select ifnull(max(itemid),0) from item")
	int maxid();

	@Insert("insert into item (itemid, userid, itemname, price, description, picture1, picture2, picture3, picture4, picture5, vod, subject, tema, date) values (#{itemid}, #{userid},#{itemname}, #{price}, #{description}, #{pictureUrl1}, #{pictureUrl2}, #{pictureUrl3}, #{pictureUrl4}, #{pictureUrl5}, #{vod}, #{subject}, #{tema}, now())")
	void insert(Item item);

	@Update("update item set itemname = #{itemname}, price = #{price}, description = #{description},"
			+ " vod = #{vod}, picture1 = #{pictureUrl1}, picture2 = #{pictureUrl2}, picture3 = #{pictureUrl3},"
			+ " picture4 = #{pictureUrl4}, picture5 = #{pictureUrl5}, subject = #{subject}, tema = #{tema} "
			+ "where itemid = #{itemid}")
	void update(Item item);

	@Delete("delete from item where itemid = #{itemid}")
	void delete(Map<String, Object> param);


	
}
