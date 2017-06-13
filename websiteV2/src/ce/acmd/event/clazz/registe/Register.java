package ce.acmd.event.clazz.registe;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String conf;
	String pswd;
	String usnm;
	

	public String getConf() {
		return conf;
	}

	public void setConf(String conf) {
		this.conf = conf;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getUsnm() {
		return usnm;
	}

	public void setUsnm(String usnm) {
		this.usnm = usnm;
	}

	public String registe(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = (String) request.getAttribute("usnm");
		return SUCCESS;
		
	}
}
