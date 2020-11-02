package rentcar.dto;

public class Admin {

	private String id; // 아이디
	private String pwd; // 비밀번호

	public Admin() {
		super();
	}

	public Admin(String id) {
		this.id = id;
	}

	public Admin(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return String.format("Admin [id=%s, pwd=%s]", id, pwd);
	}

}
