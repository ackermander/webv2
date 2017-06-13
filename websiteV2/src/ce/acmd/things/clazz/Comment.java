package ce.acmd.things.clazz;

import java.sql.Date;

public class Comment {
	
	private Integer cId;
	private String author;
	private Date date;
	private String commentContent;
	
	private Essay targetEssay;
	private Account commenter;
	
	public Account getCommenter() {
		return commenter;
	}
	public void setCommenter(Account commenter) {
		this.commenter = commenter;
	}
	@Override
	public String toString() {
		return "Comment [cId=" + cId + ", author=" + author + ", date=" + date + ", commentContent=" + commentContent
				+ ", targetEssay=" + targetEssay + ", commenter=" + commenter + "]";
	}
	public Essay getTargetEssay() {
		return targetEssay;
	}
	public void setTargetEssay(Essay targetEssay) {
		this.targetEssay = targetEssay;
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	
}
