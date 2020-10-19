package rentcar.dto;

import java.util.Date;

public class Notice {
	private int no;
	private String title;
	private String contents;
	private Date writeDate;
	private int isTop;	// default 1 -> 공지x, 0 -> 공지 
	
	public Notice() {
	}

	public Notice(int no, String title, String contents, Date writeDate, int isTop) {
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.isTop = isTop;
	}




	public int getIsTop() {
		return isTop;
	}


	public void setIsTop(int isTop) {
		this.isTop = isTop;
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


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}




	@Override
	public String toString() {
		return String.format("Notice [no=%s, title=%s, contents=%s, writeDate=%s, isTop=%s]", no, title, contents,
				writeDate, isTop);
	}



}
