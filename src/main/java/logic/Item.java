package logic;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int itemid;
	private String userid;
	private String itemname;
	@NotEmpty(message = "상품명을 입력하세요")

	@Min(value = 10, message = "10원 이상 가능합니다.")
	@Max(value = 1000000, message = "10만원 이하만 가능합니다.")
	private int price;

	@NotEmpty(message = "상품 설명을 입력하세요")
	@Size(min = 10, max = 2000, message = "10글자이상 2000글자 이하 가능")
	private String description;
	private String pictureUrl1;
	private String pictureUrl2;
	private String pictureUrl3;
	private String pictureUrl4;
	private String pictureUrl5;

	private MultipartFile picture1; // 업로드된 파일의 내용을 저장함. 변수이름과 똑같아야함
	private MultipartFile picture2; // 업로드된 파일의 내용을 저장함. 변수이름과 똑같아야함
	private MultipartFile picture3; // 업로드된 파일의 내용을 저장함. 변수이름과 똑같아야함
	private MultipartFile picture4; // 업로드된 파일의 내용을 저장함. 변수이름과 똑같아야함
	private MultipartFile picture5; // 업로드된 파일의 내용을 저장함. 변수이름과 똑같아야함

	private String vod;



	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl1() {
		return pictureUrl1;
	}

	public void setPictureUrl1(String pictureUrl1) {
		this.pictureUrl1 = pictureUrl1;
	}

	public String getPictureUrl2() {
		return pictureUrl2;
	}

	public void setPictureUrl2(String pictureUrl2) {
		this.pictureUrl2 = pictureUrl2;
	}

	public String getPictureUrl3() {
		return pictureUrl3;
	}

	public void setPictureUrl3(String pictureUrl3) {
		this.pictureUrl3 = pictureUrl3;
	}

	public String getPictureUrl4() {
		return pictureUrl4;
	}

	public void setPictureUrl4(String pictureUrl4) {
		this.pictureUrl4 = pictureUrl4;
	}

	public String getPictureUrl5() {
		return pictureUrl5;
	}

	public void setPictureUrl5(String pictureUrl5) {
		this.pictureUrl5 = pictureUrl5;
	}

	public MultipartFile getPicture1() {
		return picture1;
	}

	public void setPicture1(MultipartFile picture1) {
		this.picture1 = picture1;
	}

	public MultipartFile getPicture2() {
		return picture2;
	}

	public void setPicture2(MultipartFile picture2) {
		this.picture2 = picture2;
	}

	public MultipartFile getPicture3() {
		return picture3;
	}

	public void setPicture3(MultipartFile picture3) {
		this.picture3 = picture3;
	}

	public MultipartFile getPicture4() {
		return picture4;
	}

	public void setPicture4(MultipartFile picture4) {
		this.picture4 = picture4;
	}

	public MultipartFile getPicture5() {
		return picture5;
	}

	public void setPicture5(MultipartFile picture5) {
		this.picture5 = picture5;
	}

	public String getVod() {
		return vod;
	}

	public void setVod(String vod) {
		this.vod = vod;
	}

	@Override
	public String toString() {
		return "Item [itemid=" + itemid + ", userid=" + userid + ", itemname=" + itemname + ", price=" + price
				+ ", description=" + description + ", pictureUrl1=" + pictureUrl1 + ", pictureUrl2=" + pictureUrl2
				+ ", pictureUrl3=" + pictureUrl3 + ", pictureUrl4=" + pictureUrl4 + ", pictureUrl5=" + pictureUrl5
				+ ", picture1=" + picture1 + ", picture2=" + picture2 + ", picture3=" + picture3 + ", picture4="
				+ picture4 + ", picture5=" + picture5 + ", vod=" + vod + "]";
	}

}