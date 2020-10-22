package rentcar.utils;

public class Paging {
	private int nowPage; // 현재페이지
	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private int total; // 게시글 총수
	private int cntPerPage; // 페이지당 글 갯수
	private int lastPage; // 마지막페이지
	private int start; // sql쿼리에 쓸 start
	private int end; // end
	private int cntPage = 5;
	private String keyword;		//검색어
	private String condition;	//검색조건
	private int startRowNo;   //조회 시작 row번호
	private int endRowNo;	// 조회 마지막 row번호 
		
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	

	public int getStartRowNo() {
		return startRowNo;
	}

	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}

	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}

	public Paging(int nowPage, int total, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage()); //현재페이지1, 5
	}

	// 제일 마지막 페이지 계산
	public void calcLastPage(int totla, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
		
		  //--조회 시작 row, 조회 마지막 row 계산
	    int startRowNo = ( (nowPage-1) * cntPerPage ) + 1;
	    int endRowNo = nowPage * cntPerPage; 
	    setStartRowNo( startRowNo );
	    setEndRowNo( endRowNo );
		
	}

	// db 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int contPerPage) { //현재페이지, 페이지당 글갯수
		setEnd(nowPage * cntPerPage); 
		setStart(getEnd() - cntPerPage + 1); 
		
	}
	
	
	

	

	@Override
	public String toString() {
		return "Paging [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", keyword=" + keyword + ", condition=" + condition + ", startRowNo=" + startRowNo + ", endRowNo=" + endRowNo + " ]";
	}
	
	
	
}
