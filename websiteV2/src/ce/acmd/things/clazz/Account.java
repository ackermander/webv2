package ce.acmd.things.clazz;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Account {
	
	public static final int FIRST_LEVEL_AUTHORITY = 0;
	public static final int SECOND_LEVEL_AUTHORITY = 1;
	public static final int THIRD_LEVEL_AUTHORITY = 2;
	
	private Integer accountId;
	private String nikename;
	private Integer authorityLev;
	private Date regDate;
	private Date lastLive;
	private String password;
	
	private Set<Comment> comments = new HashSet<>();
	private Set<Essay> essays = new HashSet<>();

	
	public Set<Essay> getEssays() {
		return essays;
	}

	public void setEssays(Set<Essay> essays) {
		this.essays = essays;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public String getNikename() {
		return nikename;
	}

	public void setNikename(String nikename) {
		this.nikename = nikename;
	}

	public Integer getAuthorityLev() {
		return authorityLev;
	}

	public void setAuthorityLev(Integer authorityLev) {
		this.authorityLev = authorityLev;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getLastLive() {
		return lastLive;
	}

	public void setLastLive(Date lastLive) {
		this.lastLive = lastLive;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(String nikename, Integer authorityLev, Date regDate, Date lastLive,
			String password, Set<Comment> comments, Set<Essay> essays) {
		super();
		this.nikename = nikename;
		this.authorityLev = authorityLev;
		this.regDate = regDate;
		this.lastLive = lastLive;
		this.password = password;
		this.comments = comments;
		this.essays = essays;
	}
	

}
