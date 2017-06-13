package ce.acmd.event.clazz.filter.notefilter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * Servlet Filter implementation class NoteFilter
 */
@WebFilter({"/Note/note.jsp","/zone/zone.jsp"})
public class NoteFilter implements Filter {

    /**
     * Default constructor. 
     */
    public NoteFilter() {
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
		String logout = request.getParameter("logout");
		SimpleAccount loginAcc = (SimpleAccount) session.getAttribute("loginAcc");
		if(logout != null){
			session.removeAttribute("loginAcc");
		}
		
		String hql = "FROM Essay";
		List<Essay> essays = (List<Essay>) DBUtils.select(hql);
		request.setAttribute("essays", essays);
		request.setAttribute("eLenth", essays.size());
		Map<String, Integer> lengthMap = new HashMap<>();
		for(Essay essay : essays){
			lengthMap.put(essay.getHeader(), essay.getComments().size());
		}
		request.setAttribute("length", lengthMap);
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
