package rentcar.dto;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String license;
	private String email;
	private String is_black;
	private String address;
	private String remark;
	private Integer count;
	private String event;

	public Member() {
		super();
	}

	public Member(String id) {
		this.id = id;
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String address,
			String remark) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.address = address;
		this.remark = remark;
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String is_black,
			String address, String remark, Integer count, String event) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.is_black = is_black;
		this.address = address;
		this.remark = remark;
		this.count = count;
		this.event = event;
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

	public String getIs_black() {
		return is_black;
	}

	public void setIs_black(String is_black) {
		this.is_black = is_black;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", license=" + license
				+ ", email=" + email + ", is_black=" + is_black + ", address=" + address + ", remark=" + remark
				+ ", count=" + count + ", event=" + event + "]";
	}

}
