package ce.acmd.event.clazz.registe;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import ce.acmd.hibernate.event.DBUtils;
import ce.acmd.things.clazz.Account;
import ce.acmd.things.clazz.simple.account.SimpleAccount;

public class UserValidator extends ActionSupport {
	/**
	 * 验证成功时就进行重定向到主界面,
	 * 验证失败时重定向到注册页面.
	 * @return
	 */
	
	public String validateUser(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String limit = (String) request.getAttribute("usnm");
		String hql = "FROM Account WHERE nikename=?";
		Account account = null;
		List<Account> accounts;
		accounts = (List<Account>) DBUtils.select(hql, limit);
		if (accounts.size()==0) {
			return DBUtils.NO_ACCOUNT_IN_DATABASE;
		}else{
			return DBUtils.AN_ACCOUNT_IN_DATABASE;
		}
	}
	
	public String addAccount(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = (String) request.getAttribute("usnm");
		String password = (String) request.getAttribute("pswd");
//		System.out.println(password);
//		System.out.println(password);
		Account account = new Account(username, Account.SECOND_LEVEL_AUTHORITY, new Date(new java.util.Date().getTime()), new Date(new java.util.Date().getTime()),
				password, null, null);
		DBUtils.insert(account);
		request.setAttribute("lev", 1);
//		HttpSession session = request.getSession();
//		SimpleAccount simpleAccount = new SimpleAccount();
//		simpleAccount.setNikename(username);
//		simpleAccount.setAuthorityLev(Account.SECOND_LEVEL_AUTHORITY);
//		session.setAttribute("loginAcc", simpleAccount);
//		session.setMaxInactiveInterval(10*60);
		return DBUtils.AN_ACCOUNT_INSERT_SUCCESS;
	}
}
