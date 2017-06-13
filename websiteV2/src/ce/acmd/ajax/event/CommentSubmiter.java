package ce.acmd.ajax.event;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ce.acmd.hibernate.event.DBUtils;
import ce.acmd.things.clazz.Account;
import ce.acmd.things.clazz.Comment;
import ce.acmd.things.clazz.Essay;
import ce.acmd.things.clazz.simple.account.SimpleAccount;

public class CommentSubmiter extends ActionSupport {
	public String submit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String comment = request.getParameter("comment");
		if (comment == null||comment.equals("")) {
			return "comment_failed";
		}
		String header = request.getParameter("header");
		Comment beSub = new Comment();
		SimpleAccount sa = (SimpleAccount) session.getAttribute("loginAcc");
		Account commenter;
		List<Account> accounts = (List<Account>) DBUtils.select("FROM Account WHERE nikename=?", sa.getNikename());
		commenter = accounts.get(0);
		beSub.setAuthor(sa.getNikename());
		beSub.setCommentContent(comment);
		beSub.setCommenter(commenter);
		beSub.setDate(new Date(new java.util.Date().getTime()));
		Essay targetEssay = null;
		List<Essay> essays = (List<Essay>) DBUtils.select("FROM Essay WHERE header=?", header); 
		targetEssay = essays.get(0);
		beSub.setTargetEssay(targetEssay);
		DBUtils.insert(beSub);
		return "comment_success";
	}
}
