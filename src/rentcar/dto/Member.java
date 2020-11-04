package rentcar.dto;

import java.util.Date;

public class Member {

	// 회원가입
	private String id;
	private String pwd;
	private String gender;
	private Date birth;
	private String name;
	private String tel;
	private String li_class;
	private String li_number;
	private String email;
	private String address;

	private String is_black; // 블랙 리스트

	private Integer counting; // 대여 횟수

	// 로그인 제한
	private Date date;
	private Integer try_counting;
	private String is_lock;
	private Integer lock_counting;

	// 탈퇴
	private String reason;
	private String content;

	public Member() {
		super();
	}

	public Member(String id, String pwd, String gender, Date birth, String name, String tel, String li_class,
			String li_number, String email, String address) {
		this.id = id;
		this.pwd = pwd;
		this.gender = gender;
		this.birth = birth;
		this.name = name;
		this.tel = tel;
		this.li_class = li_class;
		this.li_number = li_number;
		this.email = email;
		this.address = address;
	}

	public Member(String id, String pwd, String gender, Date birth, String name, String tel, String li_class,
			String li_number, String email, String address, String is_black, Integer counting, Date date,
			Integer try_counting, String is_lock, Integer lock_counting, String reason, String content) {
		this.id = id;
		this.pwd = pwd;
		this.gender = gender;
		this.birth = birth;
		this.name = name;
		this.tel = tel;
		this.li_class = li_class;
		this.li_number = li_number;
		this.email = email;
		this.address = address;
		this.is_black = is_black;
		this.counting = counting;
		this.date = date;
		this.try_counting = try_counting;
		this.is_lock = is_lock;
		this.lock_counting = lock_counting;
		this.reason = reason;
		this.content = content;
	}

	public Member(String id, String is_black) {
		this.id = id;
		this.is_black = is_black;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
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

	public String getLi_class() {
		return li_class;
	}

	public void setLi_class(String li_class) {
		this.li_class = li_class;
	}

	public String getLi_number() {
		return li_number;
	}

	public void setLi_number(String li_number) {
		this.li_number = li_number;
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
		return "Member [id=" + id + ", pwd=" + pwd + ", gender=" + gender + ", birth=" + birth + ", name=" + name
				+ ", tel=" + tel + ", li_class=" + li_class + ", li_number=" + li_number + ", email=" + email
				+ ", address=" + address + ", is_black=" + is_black + ", counting=" + counting + ", date=" + date
				+ ", try_counting=" + try_counting + ", is_lock=" + is_lock + ", lock_counting=" + lock_counting
				+ ", reason=" + reason + ", content=" + content + "]";
	}

}
