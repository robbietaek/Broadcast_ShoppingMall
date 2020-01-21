package logic;


import javax.validation.constraints.Size;


import org.springframework.web.multipart.MultipartFile;

public class User {
   @Size(min = 3, max = 40, message = "아이디는 3자 이상 40자 이하로 입력하세요.")
   private String userid;
   @Size(min = 3, max = 10, message = "비밀번호는 3자 이상 10자 이하로 입력하세요.")
   private String pass;
   private String name;
   private String tel;
   private String age;
   private String address;
   private MultipartFile pic;
   private String profile;
   private String email;
   private String nickname;
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public String getPass() {
      return pass;
   }
   public void setPass(String pass) {
      this.pass = pass;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public String getAge() {
      return age;
   }
   public void setAge(String age) {
      this.age = age;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getProfile() {
      return profile;
   }
   public void setProfile(String profile) {
      this.profile = profile;
   }
   
   @Override
   public String toString() {
      return "User [userid=" + userid + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", age=" + age
            + ", address=" + address + ", profile=" + profile
            + ", email=" + email + ", nickname=" + nickname + "]";
   }
   
   public MultipartFile getPic() {
      return pic;
   }
   public void setPic(MultipartFile pic) {
      this.pic = pic;
   }
   
}