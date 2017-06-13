package ce.acmd.event.clazz.filter.notefilter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ce.acmd.hibernate.event.DBUtils;
import ce.acmd.things.clazz.Comment;
import ce.acmd.things.clazz.Essay;
import ce.acmd.things.clazz.simple.account.SimpleAccount;

/**
 * Servlet Filter implementation class PersonalZoneFilter
 */
@WebFilter("/zone/zone.jsp")
public class PersonalZoneFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PersonalZoneFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		SimpleAccount sa = (SimpleAccount) session.getAttribute("loginAcc");
		/*** 查找用户的评论 ***/
		List<Comment> comments;
		if (sa != null) {
			comments = (List<Comment>) DBUtils.select("FROM Comment WHERE author=?", sa.getNikename());
			request.setAttribute("comments", comments);
		}
		/*** 查找用户的评论 ***/
		/*** 查找用户的文章 ***/
		if (sa != null && sa.getAuthorityLev() == 0){
			List<Essay> essays = (List<Essay>) DBUtils.select("FROM Essay WHERE author=?", sa.getNikename());
			request.setAttribute("essays", essays);
		}
		/*** 查找用户的文章 ***/
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
