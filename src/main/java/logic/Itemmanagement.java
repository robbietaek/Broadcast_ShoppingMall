package logic;

import java.util.Date;

public class Itemmanagement {

	private int saleid;
	private String userid;
	private String buyerid;
	private int itemid;
	private int code;
	private String return1;
	private String subject;
	private String itemname;
	private int quantity;
	private String price;
	private String delivery;
	private String deliverycost;
	private String deliverymessage;
	private String payment;
	private Date date;
	public int getSaleid() {
		return saleid;
	}
	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getReturn1() {
		return return1;
	}
	public void setReturn1(String return1) {
		this.return1 = return1;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getDeliverycost() {
		return deliverycost;
	}
	public void setDeliverycost(String deliverycost) {
		this.deliverycost = deliverycost;
	}
	public String getDeliverymessage() {
		return deliverymessage;
	}
	public void setDeliverymessage(String deliverymessage) {
		this.deliverymessage = deliverymessage;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Itemmanagement [saleid=" + saleid + ", userid=" + userid + ", buyerid=" + buyerid + ", itemid=" + itemid
				+ ", code=" + code + ", return1=" + return1 + ", subject=" + subject + ", itemname=" + itemname
				+ ", quantity=" + quantity + ", price=" + price + ", delivery=" + delivery + ", deliverycost="
				+ deliverycost + ", deliverymessage=" + deliverymessage + ", payment=" + payment + ", date=" + date
				+ "]";
	}

	
}
