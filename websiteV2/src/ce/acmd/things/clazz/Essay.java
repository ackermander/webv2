package ce.acmd.things.clazz;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Essay {
	
	private Integer eId;
	private String header;
	private String author;
	private String content;
	private Date date;
	
	private Set<Comment> comments = new HashSet<>();
	private Account eOwner;
	
	public Account geteOwner() {
		return eOwner;
	}
	public void seteOwner(Account eOwner) {
		this.eOwner = eOwner;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Integer geteId() {
		return eId;
	}
	public void seteId(Integer eId) {
		this.eId = eId;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
