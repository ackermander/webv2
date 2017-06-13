package ce.acmd.event.clazz.login;

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
import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class Login extends ActionSupport{
	
	public static final String LOGIN_VALIDATE_SUCCESS = "login_validate_success";
	public static final String LOGIN_VALIDATE_ERROR = "login_validate_error";
			
	
	private String usnm;
	private String pswd;
	
	public String getUsnm() {
		return usnm;
	}

	public void setUsnm(String usnm) {
		this.usnm = usnm;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	
	public String loginValidate(){
		Account validatedAcc;
		String hql = "FROM Account WHERE nikename=? and password=?";
		String[] limits = new String[]{usnm, pswd};
		List<Account> result = (List<Account>) DBUtils.select(hql, limits[0], limits[1]);
		if (result.size() == 1) {
			HttpServletRequest request = ServletActionContext.getRequest();
			validatedAcc = result.get(0);
			request.setAttribute("lev", validatedAcc.getAuthorityLev());
			return LOGIN_VALIDATE_SUCCESS;
			
		}else{
			return LOGIN_VALIDATE_ERROR;
		}
	}
	
	public String login(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = (String) request.getAttribute("usnm");
		Integer lev = (Integer) request.getAttribute("lev");
		HttpSession session = request.getSession();
		SimpleAccount simpleAccount = new SimpleAccount();
		simpleAccount.setNikename(username);
		simpleAccount.setAuthorityLev(lev);
		session.setAttribute("loginAcc", simpleAccount);
		session.setMaxInactiveInterval(10*60);
		Map session1 = ActionContext.getContext().getSession();
		SimpleAccount account = (SimpleAccount) session1.get("loginAcc");
		return "login_success";
		
	}
}
