package ustc.javaweb.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ModelDriven;

import ustc.javaweb.action.FileUploadAction;
import ustc.javaweb.baseaction.McBaseAction;
import ustc.javaweb.service.UserManager;
import ustc.javaweb.vo.UserRegisterInfo;
import ustc.javaweb.eo.User;

public class UserAction extends McBaseAction implements ModelDriven<UserRegisterInfo> {
	private UserRegisterInfo info = new UserRegisterInfo();

	@Autowired
	private UserManager userManager;
	
	private List<User> users;
	
	private User user;	
	@Override
	public String execute() throws Exception {
		System.out.println(info.getEmail());
		User u = new User();
		u.setEmail(info.getEmail());
		u.setName(info.getName());
		u.setPassword(info.getPassword());
		if(userManager.exists(u)) {
			return "fail";
		}
		userManager.add(u);
		user = u;
		session.setAttribute("email", info.getEmail()); 
		session.setAttribute("name", info.getName());
		return "index";
	}

	public String signin() throws Exception {
		User u = new User();
		u.setEmail(info.getEmail());
		u.setPassword(info.getPassword());
		if(userManager.exists(u)) {
			
			if(userManager.checkUserPassword(u)) {
				this.user = this.userManager.loadByEmail(u.getEmail()); 
				session.setAttribute("email", user.getEmail()); 
				session.setAttribute("name", user.getName());
				return "index";
			}
		}
		return "fail";
	}
	
	public String index() {	
		return "index";
	}
	
	public String signout() {
		session.invalidate();
		return "index";
	}
	
	public UserRegisterInfo getInfo() {
		return info;
	}

	public void setInfo(UserRegisterInfo info) {
		this.info = info;
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public UserRegisterInfo getModel() {
		return info;
	}
	
}
