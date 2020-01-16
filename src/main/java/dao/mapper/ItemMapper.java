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
			"select * from item ",
			"<if test = 'itemid!=null'> where itemid = #{itemid}</if>",
			"</script>"})
	List<Item> select(Map<String,Object> param);

	@Select("select ifnull(max(itemid),0) from item")
	int maxid();

	@Insert("insert into item (itemid, itemname, price, description, pictureUrl1, pictureUrl2, pictureUrl3, pictureUrl4, pictureUrl5, vod) values (#{itemid}, #{itemname}, #{price}, #{description}, #{pictureUrl1}, #{pictureUrl2}, #{pictureUrl3}, #{pictureUrl4}, #{pictureUrl5}, #{vod})")
	void insert(Item item);

	@Update("update item set itemname = #{itemname}, price = #{price}, description = #{description}, vod = #{vod}, pictureUrl1 = #{pictureUrl1}, pictureUrl2 = #{pictureUrl2}, pictureUrl3 = #{pictureUrl3}, pictureUrl4 = #{pictureUrl4}, pictureUrl5 = #{pictureUrl5} where itemid = #{itemid}")
	void update(Item item);

	@Delete("delete from item where itemid = #{itemid}")
	void delete(Map<String, Object> param);	
	
}
