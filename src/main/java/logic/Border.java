package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Border {
	private int no;
	private String tema;
	
	@NotEmpty(message = "글쓴이를 입력하세요.")
	private String nickname;
	
	@NotEmpty(message = "제목을 입력하세요.")
	private String subject;
		
	@NotEmpty(message = "내용을 입력하세요.")
	private String content;

	private String file;
	private MultipartFile fileurl;
	private Date date;
	private int view;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTema() {
		return tema;
	}
	public void setTema(String tema) {
		this.tema = tema;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public MultipartFile getFileurl() {
		return fileurl;
	}
	public void setFileurl(MultipartFile fileurl) {
		this.fileurl = fileurl;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	@Override
	public String toString() {
		return "Border [no=" + no + ", tema=" + tema + ", nickname=" + nickname + ", subject=" + subject + ", content="
				+ content + ", file=" + file + ", fileurl=" + fileurl + ", date=" + date + ", view=" + view + "]";
	}
	
}
