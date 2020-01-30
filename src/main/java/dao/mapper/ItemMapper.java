package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;
import logic.Shopbasket;
import logic.User;
import logic.sold;

public interface ItemMapper {

	@Select({"<script>",
	    "select itemid, userid, itemname, price, description, "
	    + "picture1 pictureUrl1, picture2 pictureUrl2, picture3 pictureUrl3, picture4 pictureUrl4, picture5 pictureUrl5, "
	    + "vod, subject, tema, date, delivery, deliverycost from item ",
	    " <if test='itemid != null'> where itemid = #{itemid}</if>",
	    " <if test='sessionid != null'> where userid = #{sessionid}</if>",
	    " <if test='searchtype != null'> where ${searchtype} like '%${searchcontent}%'</if>",
	    " <if test='itemid == null'> order by date desc limit #{startrow},#{limit}</if>",
	    "</script>"})
	List<Item> sellingselect(Map<String,Object> param);
	
	@Select({"<script>",
		"select count(*) from item ",
		"<if test = 'searchtype!=null'> where ${searchtype} like '%${searchcontent}%' </if>",
		"<if test = 'sessionid!=null'> where userid = #{sessionid} </if>",
		"</script>"})
	int sellingcount(Map<String, Object> param);	
	

	@Select("select ifnull(max(itemid),0) from item")
	int maxid();

	@Insert("insert into item (itemid, userid, itemname, price, description, "
			+ "picture1, picture2, picture3, picture4, picture5, "
			+ "vod, subject, tema, date, delivery, deliverycost) values "
			+ "(#{itemid}, #{userid},#{itemname}, #{price}, #{description}, "
			+ "#{pictureUrl1}, #{pictureUrl2}, #{pictureUrl3}, #{pictureUrl4}, #{pictureUrl5}, "
			+ "#{vod}, #{subject}, #{tema}, now(), #{delivery},#{deliverycost})")
	void insert(Item item);

	@Update("update item set itemname = #{itemname}, price = #{price}, description = #{description},"
			+ " vod = #{vod}, picture1 = #{pictureUrl1}, picture2 = #{pictureUrl2}, picture3 = #{pictureUrl3},"
			+ " picture4 = #{pictureUrl4}, picture5 = #{pictureUrl5}, subject = #{subject}, tema = #{tema} "
			+ "where itemid = #{itemid}")
	void update(Item item);

	@Delete("delete from item where itemid = #{itemid}")
	void delete(Map<String, Object> param);

	
	@Select({"<script>",
	    "select itemid, userid, itemname, price, description, "
	    + "picture1 pictureUrl1, picture2 pictureUrl2, picture3 pictureUrl3, picture4 pictureUrl4, picture5 pictureUrl5, "
	    + "vod, subject, tema, date, delivery, deliverycost from item ",
	    " <if test='tema != null and visitid != null'> where tema like '${tema}' and userid = #{visitid} </if>",
	    " <if test='searchtype != null'> and ${searchtype} like '%${searchcontent}%' </if>",
	    " order by date desc limit #{startrow},#{limit}",
	    "</script>"})
	List<Item> temaselect(Map<String, Object> param);

	@Select({"<script>",
		"select count(*) from item ",
		"<if test = 'tema!=null and visitid != null'> where tema like '${tema}' and userid = #{visitid} </if>",
		"<if test = 'searchtype!=null'> and ${searchtype} like '%${searchcontent}%' </if>",
		"</script>"})
	int temacount(Map<String, Object> param);

	
	@Insert("insert into shopbasket (userid,itemid, date) "
			+ "values (#{userid},#{itemid},now())")
	void jjiminsert(Shopbasket sb);

	@Select("select count(*) from shopbasket where userid = #{userid} and itemid = ${itemid}")
	int jjimcount(Map<String, Object> param);
	
	@Delete("delete from shopbasket where userid = #{userid} and itemid = ${itemid}")
	void jjimdelete(Shopbasket sb);

	@Select("select max(year(date)) from itemmanagement where userid=#{userid}")
	String maxyear(Map<String, Object> param);
	
	@Select("select min(year(date)) from itemmanagement where userid=#{userid}")
	String minyear(Map<String, Object> param);

	@Select("SELECT b.date,COUNT(a.date) AS cnt,ifnull(SUM(quantity),0) AS quantity" + 
	         " FROM (SELECT *  from itemmanagement WHERE YEAR(date)=#{year} and userid=#{userid} and code=1) a RIGHT OUTER join mon b ON MONTH(a.date) = b.date" + 
	         " GROUP BY b.date" + 
	         " ORDER BY b.date")
	List<sold> soldlist(Map<String, Object> param);

	@Select("SELECT b.date,COUNT(a.date) AS cnt, ifnull(SUM(quantity*price),0) AS price" + 
	         " FROM (SELECT *  from itemmanagement WHERE YEAR(date) =#{year} AND userid=#{userid} AND CODE = 1) a RIGHT OUTER join mon b ON MONTH(a.date) = b.date" + 
	         " GROUP BY b.date" + 
	         " ORDER BY b.date")
	   List<sold> takeList(Map<String, Object> param);

	@Select("select max(month(date)) from itemmanagement where userid=#{userid} and year(date)=#{year}")
	Integer maxmonth(Map<String, Object> param);
}
