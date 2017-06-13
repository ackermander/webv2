package ce.acmd.ajax.event;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import ce.acmd.hibernate.event.DBUtils;
import ce.acmd.things.clazz.Account;

public class CheckName extends ActionSupport{
	String hql = "FROM Account WHERE nikename=?";
	/**
	 * 
	 * @param name 表示 limit
	 * @return true 表示在数据库中有重名, false表示数据库中没有重名.
	 */
	public String check() {
		Account checkAcc;
		String name = (String) ServletActionContext.getRequest().getParameter("username");
		List<Account> accs = (List<Account>) DBUtils.select(hql, name);
		if(accs.size() > 0)
			return "check_hav";
		else
			return "check_no";
	}
}
