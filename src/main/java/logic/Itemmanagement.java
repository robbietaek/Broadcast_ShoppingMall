package logic;

import org.springframework.web.multipart.MultipartFile;

public class Itemmanagement {

	Item item;
	private String saleid;
	private String userid;
	private String buyerid;
	private int code;
	private String price;
	private MultipartFile picture;
	private String pictureUrl;
	private int quantity;
	private String delivery;
	private String payment;
	private String content;
	private String return1;
	private String itemid;
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public String getSaleid() {
		return saleid;
	}
	public void setSaleid(String saleid) {
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
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReturn1() {
		return return1;
	}
	public void setReturn1(String return1) {
		this.return1 = return1;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	@Override
	public String toString() {
		return "Itemmanagement [item=" + item + ", saleid=" + saleid + ", userid=" + userid + ", buyerid=" + buyerid
				+ ", code=" + code + ", price=" + price + ", picture=" + picture + ", pictureUrl=" + pictureUrl
				+ ", quantity=" + quantity + ", delivery=" + delivery + ", payment=" + payment + ", content=" + content
				+ ", return1=" + return1 + ", itemid=" + itemid + "]";
	}
	
}
