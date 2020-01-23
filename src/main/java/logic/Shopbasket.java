package logic;

import java.util.Date;

public class Shopbasket {
	private String userid;
	private int itemid;
	private Date date;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Shopbasket [userid=" + userid + ", itemid=" + itemid + ", date=" + date + "]";
	}
	
}
