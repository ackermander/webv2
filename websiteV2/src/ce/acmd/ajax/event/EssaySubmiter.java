package ce.acmd.ajax.event;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ce.acmd.hibernate.event.DBUtils;
import ce.acmd.things.clazz.Account;
import ce.acmd.things.clazz.Essay;
import ce.acmd.things.clazz.simple.account.SimpleAccount;

public class EssaySubmiter extends ActionSupport {
	public String essaySub(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		SimpleAccount sa = (SimpleAccount) session.getAttribute("loginAcc");
		if(sa == null){
			return "user_not_found";
		}
		Account author;
		List<Account> accounts = (List<Account>) DBUtils.select("FROM Account WHERE nikename=?", sa.getNikename());
		author = accounts.get(0);
		String content = request.getParameter("essay_content");
		String mask = request.getParameter("essay_title");
		System.out.println(content);
		System.out.println(mask);
		Essay beSub = new Essay();
		beSub.setAuthor(sa.getNikename());
		beSub.seteOwner(author);
		beSub.setContent(content);
		beSub.setHeader(mask);
		beSub.setComments(null);
		beSub.setDate(new Date(new java.util.Date().getTime()));
		DBUtils.insert(beSub);
		return "essay_up_success";
	}
}
