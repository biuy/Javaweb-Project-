package ustc.javaweb.service.impl;

import java.util.List;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ustc.javaweb.eo.User;
import ustc.javaweb.po.UserMapper;
import ustc.javaweb.service.UserManager;

@Service("userManager")
public class UserManagerImpl implements UserManager {
	@Autowired
	private UserMapper userMapper;
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	public boolean exists(User u) throws Exception {
		System.out.println(u.getEmail());
		return userMapper.checkUserExistsWithEmail(u.getEmail()) >= 1;
		
	}
	public void add(User u) throws Exception {
		userMapper.save(u);
	}
	public List<User> getUsers() {
		return this.userMapper.getUsers();
	}
	public User loadByEmail(String email) {
		return this.userMapper.loadByEmail(email);
	}
	public boolean checkUserPassword(User u) {
		String email = u.getEmail();
		return this.loadByEmail(email).getPassword().equals(u.getPassword());
	}
}
