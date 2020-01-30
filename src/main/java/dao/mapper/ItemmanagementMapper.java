package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Itemmanagement;

public interface ItemmanagementMapper {
	
	@Select("select ifnull(max(saleid),0) from itemmanagement")
	int getsalemaxid();

	@Insert("insert into itemmanagement "
			+ "(saleid,userid,buyerid,itemid,code,subject,itemname, quantity, price, "
			+ "delivery, deliverycost, deliverymessage, payment, date) values "
			+ "(#{saleid},#{userid},#{buyerid},#{itemid},#{code},#{subject},#{itemname},#{quantity}, #{price}, "
			+ "#{delivery}, #{deliverycost}, #{deliverymessage}, #{payment}, now())")
	void buying(Itemmanagement im);

}
