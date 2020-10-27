package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.LongRent;
import rentcar.dto.Notice;
import rentcar.utils.Paging;

public interface NoticeDao {

	ArrayList<Notice> selectNoticeList();

	// 게시판 no별 list
	Notice getNoticeList(int no);

	
	//관리자 
	int insertNotice(Notice notice);
	
	int updateNotice(Notice notice);

	int deleteNotice(int no);

	
	//페이징 

	int countNoticeByAll();

	ArrayList<Notice> pagingNoticeByAll(Paging paging);

	ArrayList<Notice> selectSearchNotice(String condition, String keyword);

	
	//검색 + 페이징 구현
	ArrayList<Notice> selectPagingSearchNotice(String condition, String keyword, Paging paging);

	int countSearchNoticeByAll(String condition, String keyword);
	
	
	
}
