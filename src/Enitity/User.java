package Enitity;

public class User {
	private int id;
	private String username;
	private String password;
	private String tel;
	private String email;

	



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User() {
		
	}
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public User(int id,String username, String password, String tel, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.tel = tel;
		this.email = email;
	
	}
	
	public User(String username, String password, String tel, String email) {
		super();
		this.username = username;
		this.password = password;
		this.tel = tel;
		this.email = email;
	
	}



	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", tel=" + tel + ", email=" + email + "]";
	}
	
	
}
