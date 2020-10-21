package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.Notice;

public interface NoticeDao {

	ArrayList<Notice> selectNoticeList();

	// 게시판 no별 list
	Notice getNoticeList(int no);

	
	//관리자 
	int insertNotice(Notice notice);
	
	int deleteNotice(Notice notice);
	
	int updateNotice(Notice notice);
	
	
	
}
