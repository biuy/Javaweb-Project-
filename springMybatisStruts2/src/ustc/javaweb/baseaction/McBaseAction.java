package ustc.javaweb.baseaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class McBaseAction extends ActionSupport {

	protected static String MC_SUCCESS = "MC_SUCCESS";
	protected static String MC_ERROR = "MC_ERROR";
	protected HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
	protected HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
	protected HttpSession session = request.getSession();
	protected String path = request.getContextPath();
}
