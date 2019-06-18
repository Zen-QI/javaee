package DaoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.userDao;
import Enitity.User;
import Enitity.ks;
import Util.JDBCUtil;

public class Impl implements userDao{
	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		int i=0;
		if(getUser(user.getUsername()).equals("")) {
			
		
		
		String sql="insert into t_user (username,password,tel,email) value (?,?,?,?)";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps=null;
		try {
		    ps = cn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getEmail());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
		}
		
		return i;
	}
	
	public String getUser(String name) {
		String sql="select * from t_user where username='"+name+"'";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String username="";
		try {
			ps = cn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				username= rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,rs);
		return username;
		
	}

	@Override
	public User findOne(String name, String pass) {
		// TODO Auto-generated method stub
		String sql="select * from t_user where username=? and password=?";
		Connection cn=JDBCUtil.open();
		
		PreparedStatement ps=null;
		ResultSet re=null;
		User user=null;
		try {
		    ps = cn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, pass);
			re = ps.executeQuery();
			while(re.next()) {
				String username = re.getString(1);
				String password = re.getString(2);
				user=new User(username,password);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
		return user;
	}

	
	@Override
	public void delete(int id) {
		String sql="delete from subject where id=?";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps = null;
		int i=0;
		try {
			ps = cn.prepareStatement(sql);
			ps.setInt(1, id);
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<ks> findAll() {
		// TODO Auto-generated method stub
		String sql="select * from subject";
		Connection cn=JDBCUtil.open();
		List<ks> list=new ArrayList<ks>();
		PreparedStatement ps=null;
		ResultSet re=null;
		try {
		    ps = cn.prepareStatement(sql);
			re = ps.executeQuery();
			while(re.next()) {
				ks ks= new ks();
				ks.setKy(re.getString("ky"));
				ks.setId(re.getInt("id"));
				ks.setNd(re.getString("nd"));
				ks.setTm(re.getString("tm"));
				ks.setType(re.getString("type"));
				list.add(ks);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
		return list;
		
	}

	@Override
	public void add(ks ks1) {
		int i=0;
		// TODO Auto-generated method stub
		String sql="insert into subject(tm,ky,type,nd) value(?,?,?,?)";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps=null;
		try {
		    ps = cn.prepareStatement(sql);
		    ps.setString(1, ks1.getTm());
		    ps.setString(2, ks1.getKy());
		    ps.setString(3, ks1.getType());
		    ps.setString(4, ks1.getNd());
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
	}

	@Override
	public void edit(int id,String tm, String ky,String type,String nd) {
		Connection connection = JDBCUtil.open();
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement("update subject set tm=?,ky=?,type=?,nd=? where id=?");
			ps.setString(1, tm);
			ps.setString(2, ky);
			ps.setString(3, type);
			ps.setString(4, nd);			
			ps.setInt(5, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<User> find() {
		// TODO Auto-generated method stub
		String sql="select * from t_user";
		Connection cn=JDBCUtil.open();
		List<User> userlist=new ArrayList<User>();
		PreparedStatement ps=null;
		ResultSet re=null;
		try {
		    ps = cn.prepareStatement(sql);
			re = ps.executeQuery();
			while(re.next()) {
				User user= new User();
				user.setId(re.getInt(1));
				user.setUsername(re.getString(2));
				user.setPassword(re.getString(3));
				user.setTel(re.getString(4));
				user.setEmail(re.getString(5));
				System.out.println(user);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
		return userlist;
	}

	@Override
	public void uadd(User user) {
		// TODO Auto-generated method stub
		int i=0;
		// TODO Auto-generated method stub
		String sql="insert into t_user (username,password,tel,email) value(?,?,?,?)";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps=null;
		try {
		    ps = cn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getEmail());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.close(cn,ps,null);
	}

	@Override
	public void udelete(int id) {
		// TODO Auto-generated method stub
		String sql="delete from t_user where id=?";
		Connection cn=JDBCUtil.open();
		PreparedStatement ps = null;
		
		try {
			ps = cn.prepareStatement(sql);
			ps.setInt(1, id);
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void uedit(int id,String username, String password,String tel,String email) {
		Connection connection = JDBCUtil.open();
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement("update t_user set username=?,password=?,tel=?,email=? where id=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, tel);
			ps.setString(4, email);
			
			
			ps.setInt(5, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
