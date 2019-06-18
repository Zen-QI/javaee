package Enitity;

public class ks {
	
	private int id;
	private String ky;
	private String tm;
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKy() {
		return ky;
	}
	public void setKy(String km) {
		this.ky = km;
	}
	public String getTm() {
		return tm;
	}
	public void setTm(String tm) {
		this.tm = tm;
	}
	public String getType() {
		return type;
	}
	public ks(int id, String km, String tm, String type, String nd) {
		super();
		this.id = id;
		this.ky = km;
		this.tm = tm;
		this.type = type;
		this.nd = nd;
	}
	public ks(String ky, String tm, String type, String nd) {
		super();
		this.ky = ky;
		this.tm = tm;
		this.type = type;
		this.nd = nd;
	}
	public ks() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNd() {
		return nd;
	}
	public void setNd(String nd) {
		this.nd = nd;
	}
	private String nd;

}
