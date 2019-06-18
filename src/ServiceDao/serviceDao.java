package ServiceDao;

import java.util.List;

import Enitity.User;
import Enitity.ks;

public interface serviceDao {
	public int insert(User user);
	public User findOne(String name,String pass);
	public List<ks> findAll();
	public List<User> find();
	public void add(ks ks1);
	public void uadd(User user);
	public void delete(int id);
	public void udelete(int id);
	public void edit(int id, String tm, String ky,String type,String nd);
	public void uedit(int id, String username, String password,String tel,String email);
	
}
