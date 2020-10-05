package rentcar.dto;

import java.util.Date;

public class LongRent {
	private int no;
	private String title;
	private String contents;
	private String exterior;
	private String safety;
	private String multi;
	private String sheet;
	private int fare;
	private Member id;
//	private NonMember nonTel;
	private String nonTel;
	private int repYn; // 답변여부 1:답변무, 2:답변유
	private Date writeDate;

	public LongRent() {
		// TODO Auto-generated constructor stub
	}

	public LongRent(int no) {
		this.no = no;
	}

	public LongRent(int no, String title, String contents, String exterior, String safety, String multi, String sheet,
			int fare, Member id, String nonTel, int repYn, Date writeDate) {
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.exterior = exterior;
		this.safety = safety;
		this.multi = multi;
		this.sheet = sheet;
		this.fare = fare;
		this.id = id;
		this.nonTel = nonTel;
		this.repYn = repYn;
		this.writeDate = writeDate;
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

	public String getExterior() {
		return exterior;
	}

	public void setExterior(String exterior) {
		this.exterior = exterior;
	}

	public String getSafety() {
		return safety;
	}

	public void setSafety(String safety) {
		this.safety = safety;
	}

	public String getMulti() {
		return multi;
	}

	public void setMulti(String multi) {
		this.multi = multi;
	}

	public String getSheet() {
		return sheet;
	}

	public void setSheet(String sheet) {
		this.sheet = sheet;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public Member getId() {
		return id;
	}

	public void setId(Member id) {
		this.id = id;
	}

	public String getNonTel() {
		return nonTel;
	}

	public void setNonTel(String nonTel) {
		this.nonTel = nonTel;
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

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return String.format(
				"LongRent [no=%s, title=%s, contents=%s, exterior=%s, safety=%s, multi=%s, sheet=%s, fare=%s, id=%s, nonTel=%s, repYn=%s, writeDate=%s]",
				no, title, contents, exterior, safety, multi, sheet, fare, id, nonTel, repYn, writeDate);
	}

}
