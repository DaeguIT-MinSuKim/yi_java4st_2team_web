package rentcar.dto;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String license;
	private String email;
	private String address;
	private String is_black;
	private String remark;
	private Integer counting;

	public Member() {
		super();
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String address,
			String is_black, String remark, Integer counting) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.address = address;
		this.is_black = is_black;
		this.remark = remark;
		this.counting = counting;
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String address,
			String remark) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.address = address;
		this.remark = remark;
	}

	public Member(String id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIs_black() {
		return is_black;
	}

	public void setIs_black(String is_black) {
		this.is_black = is_black;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getCounting() {
		return counting;
	}

	public void setCounting(Integer counting) {
		this.counting = counting;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", license=" + license
				+ ", email=" + email + ", address=" + address + ", is_black=" + is_black + ", remark=" + remark
				+ ", counting=" + counting + "]";
	}

}
