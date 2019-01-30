package ustc.javaweb.service;

import java.util.List;

import ustc.javaweb.eo.User;

public interface UserManager {
	public abstract boolean exists(User u) throws Exception;
	public abstract void add(User u) throws Exception;
	public List<User> getUsers();
	public User loadByEmail(String email);
	public boolean checkUserPassword(User u);
}
