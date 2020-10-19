package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.impl.NoticeDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Notice;

public class NoticeSerivce {
	private NoticeDaoImpl dao = NoticeDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public NoticeSerivce() {
		dao.setCon(con);
	}
	
	public List<Notice> getNoticeList(){
		return dao.selectNoticeList();
	}
	
	public Notice getNotice(int no) {
		return dao.getNoticeList(no);
	}
	
	
}
