package rentcar.dto;

import java.util.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String license;
	private String email;
	private String address;
	private String is_black;
	private Integer counting;
	private Integer birth;
	private Date date;
	private Integer try_counting;
	private String is_lock;
	private Integer lock_counting;

	public Member() {
		super();
	}

	public Member(String id) {
		this.id = id;
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String address,
			String is_black, Integer counting, Integer birth, Date date, Integer try_counting, String is_lock,
			Integer lock_counting) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.address = address;
		this.is_black = is_black;
		this.counting = counting;
		this.birth = birth;
		this.date = date;
		this.try_counting = try_counting;
		this.is_lock = is_lock;
		this.lock_counting = lock_counting;
	}

	public Member(String id, String pwd, String name, String tel, String license, String email, String address,
			Integer birth) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.license = license;
		this.email = email;
		this.address = address;
		this.birth = birth;
	}

	public Member(String id, Date date, Integer try_counting, String is_lock, Integer lock_counting) {
		this.id = id;
		this.date = date;
		this.try_counting = try_counting;
		this.is_lock = is_lock;
		this.lock_counting = lock_counting;
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

	public Integer getCounting() {
		return counting;
	}

	public void setCounting(Integer counting) {
		this.counting = counting;
	}

	public Integer getBirth() {
		return birth;
	}

	public void setBirth(Integer birth) {
		this.birth = birth;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getTry_counting() {
		return try_counting;
	}

	public void setTry_counting(Integer try_counting) {
		this.try_counting = try_counting;
	}

	public String getIs_lock() {
		return is_lock;
	}

	public void setIs_lock(String is_lock) {
		this.is_lock = is_lock;
	}

	public Integer getLock_counting() {
		return lock_counting;
	}

	public void setLock_counting(Integer lock_counting) {
		this.lock_counting = lock_counting;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", license=" + license
				+ ", email=" + email + ", address=" + address + ", is_black=" + is_black + ", counting=" + counting
				+ ", birth=" + birth + ", date=" + date + ", try_counting=" + try_counting + ", is_lock=" + is_lock
				+ ", lock_counting=" + lock_counting + "]";
	}

}
