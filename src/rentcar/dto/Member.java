package rentcar.dto;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String license;
	private int mileage;
	private String is_black;
	private String address;
	private String remark;

	public Member() {
		super();
	}

	public Member(String id, String pwd, String name, String tel, String license, int mileage, String is_black,
			String address, String remark) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.mileage = mileage;
		this.is_black = is_black;
		this.address = address;
		this.remark = remark;
	}

	public Member(String id, String pwd, String name, String tel, String license, String address) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.address = address;
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

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
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

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", license=" + license
				+ ", mileage=" + mileage + ", is_black=" + is_black + ", address=" + address + ", remark=" + remark
				+ "]";
	}

}
