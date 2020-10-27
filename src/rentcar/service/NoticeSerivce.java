package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.impl.NoticeDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.LongRent;
import rentcar.dto.Notice;
import rentcar.utils.Paging;

public class NoticeSerivce {
	private NoticeDaoImpl dao = NoticeDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();

	public NoticeSerivce() {
		dao.setCon(con);
	}

	public List<Notice> getNoticeList() {
		return dao.selectNoticeList();
	}

	public Notice getNotice(int no) {
		return dao.getNoticeList(no);
	}

	public int insertNotice(Notice notice) {
		return dao.insertNotice(notice);
	}

	public int updateNotice(Notice notice) {
		return dao.updateNotice(notice);
	}

	public int deleteNotice(int no) {
		return dao.deleteNotice(no);
	}

	// 페이징
	public int countNoticeByall() {
		return dao.countNoticeByAll();
	}

	public ArrayList<Notice> pagingNoticeByAll(Paging paging) {
		return dao.pagingNoticeByAll(paging);
	}

	// 검색
	public ArrayList<Notice> selectSearchNotice(String condition, String keyword){
		return dao.selectSearchNotice(condition, keyword);
	}
	
	
	// 검색 + 페이징 
	public ArrayList<Notice> selectPagingSearchNotice(String condition, String keyword, Paging paging){
		return dao.selectPagingSearchNotice(condition, keyword, paging);
	}
	
	public int countSearchNoticeByAll(String condition, String keyword) {
		return dao.countSearchNoticeByAll(condition, keyword);
	}
	
}
