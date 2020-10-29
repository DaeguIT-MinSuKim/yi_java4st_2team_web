package rentcar.dto;

import java.util.Date;


public class LongRent {
	private int no;
	private String title;
	private String contents;
	private int repYn; // 답변여부 1:답변무, 2:답변유
	private Date writeDate;
	private String rentTerm;
	private String  name;
	private String tel;
	private String pwd;
	private String options;
	private String repContent; //답변 내용
	private String writeMonth;
	private int totalCount;
	
	public LongRent() {
	}
	


	


	public LongRent(int no, String title, String contents, int repYn, Date writeDate, String rentTerm, String name,
			String tel, String pwd, String options, String repContent, String writeMonth, int totalCount) {
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.repYn = repYn;
		this.writeDate = writeDate;
		this.rentTerm = rentTerm;
		this.name = name;
		this.tel = tel;
		this.pwd = pwd;
		this.options = options;
		this.repContent = repContent;
		this.writeMonth = writeMonth;
		this.totalCount = totalCount;
	}






	public LongRent(int no, String title, String contents, int repYn, Date writeDate, String rentTerm, String name,
			String tel, String pwd, String options, String repContent) {
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.repYn = repYn;
		this.writeDate = writeDate;
		this.rentTerm = rentTerm;
		this.name = name;
		this.tel = tel;
		this.pwd = pwd;
		this.options = options;
		this.repContent = repContent;
	}

	


	public String getWrite_month() {
		return writeMonth;
	}


	public void setWriteMonth(String writeMonth) {
		this.writeMonth = writeMonth;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public int getRepYn() {
		return repYn;
	}


	public void setRepYn(int repYn) {
		this.repYn = repYn;
	}


	public Date getWriteDate() {
		return writeDate;
	}
	
//	public String getWriteDateStr() {
//		//${writeDateStr}
//		return writeDate;
//	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public String getRentTerm() {
		return rentTerm;
	}


	public void setRentTerm(String rentTerm) {
		this.rentTerm = rentTerm;
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


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getOptions() {
		return options;
	}


	public void setOptions(String options) {
		this.options = options;
	}


	public String getRepContent() {
		return repContent;
	}


	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}


	@Override
	public String toString() {
		return String.format(
				"LongRent [no=%s, title=%s, contents=%s, repYn=%s, writeDate=%s, rentTerm=%s, name=%s, tel=%s, pwd=%s, options=%s, repContent=%s, writeMonth=%s, writeDate=%s]",
				no, title, contents, repYn, writeDate, rentTerm, name, tel, pwd, options, repContent, writeMonth, writeDate );
	}




	
}
