package ustc.javaweb.po;

import java.util.List;

import ustc.javaweb.eo.User;

public interface UserMapper {
	public void save(User u);
	public int checkUserExistsWithEmail(String email);
	public List<User> getUsers();
	public User loadByEmail(String email);
}