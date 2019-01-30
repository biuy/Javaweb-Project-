package ustc.javaweb.service;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class LoginFilter extends HttpServlet implements Filter {
	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	String passUrl = "";

	@Override
	public void doFilter(ServletRequest Request, ServletResponse Response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) Request;  
        HttpServletResponse response = (HttpServletResponse) Response;  
        String[] strArray = passUrl.split(";");
        for (String str : strArray) {
            if (str.equals(""))
                continue;
            if (request.getRequestURL().indexOf(str) >= 0) {
                chain.doFilter(Request, Response);
                return;
            }
        }              
        
        HttpSession session = request.getSession();  
        String url = request.getServletPath();  
        String contextPath = request.getContextPath();  
  
        if (url.equals("")) {  
            url += "/";  
        }  
        // 未登录时，若访问后台资源,将过滤到login页面  
        if ((url.startsWith("/") && !url.startsWith("/signin"))) {  
            String user = (String) session.getAttribute("email");  
            if (user == null) {  
                response.sendRedirect(contextPath + "/signin.jsp");  
                return;  
            } else {  
                // 登陆之后，验证session是否过期，session过期，转至登陆页面  
                if (!ServletActionContext.getRequest()  
                        .isRequestedSessionIdValid()) {  
                    response.sendRedirect(contextPath + "/signin.jsp");  
                    return;  
                }  
            }  
        }  
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		passUrl = fConfig.getInitParameter("passUrl");
	}

}
