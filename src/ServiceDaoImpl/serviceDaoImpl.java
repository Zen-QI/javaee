package ServiceDaoImpl;

import java.util.List;

import Dao.userDao;
import DaoImpl.Impl;
import Enitity.User;
import Enitity.ks;
import ServiceDao.serviceDao;


public class serviceDaoImpl implements serviceDao{
	userDao ud=new Impl();
	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return ud.insert(user);
	}
	@Override
	public User findOne(String name, String pass) {
		// TODO Auto-generated method stub
		return ud.findOne(name, pass);
	}
	
	public List<ks> findAll() {
		// TODO Auto-generated method stub
		return ud.findAll();
	}
	@Override
	public void add(ks ks1) {
		// TODO Auto-generated method stub
		ud.add(ks1);
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		ud.delete(id);
	}
	@Override
	public void edit(int id,String tm, String ky,String type,String nd) {
		ud.edit(id,tm,ky,type,nd);
	}
	@Override
	public List<User> find() {
		// TODO Auto-generated method stub
		return ud.find();
	}
	@Override
	public void uadd(User user) {
		// TODO Auto-generated method stub
		ud.uadd(user);
	}
	@Override
	public void udelete(int id) {
		// TODO Auto-generated method stub
		ud.udelete(id);
	}
	@Override
	public void uedit(int id, String username, String password, String tel, String email) {
		// TODO Auto-generated method stub
		ud.uedit(id, username, password, tel, email);
	}
	
	
	

}
