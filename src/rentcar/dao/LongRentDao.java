package rentcar.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;

import rentcar.dto.Event;
import rentcar.dto.LongRent;
import rentcar.utils.Paging;

public interface LongRentDao {

	ArrayList<LongRent> selectLongRentList();

	// 게시판 no별 list
	LongRent getLongRentList(int no);

	// 글쓰기
	int insertLongRent(LongRent longrent);
	int updateLongRent(LongRent longrent);

	// 게시글 보기 비밀번호
	LongRent checkPassword(int no, String pwd);

	// 게시판 페이징
	int countLongRentByAll();

	ArrayList<LongRent> pagingLongRentByAll(Paging paging);

	


	// 검색
	List<LongRent> selectSearch(String condition, String keyword);

	// 검색 후 페이징
	List<LongRent> selectSearchPaging(String condition, String keyword, Paging paging);

	int countSearchLongRentByAll(String condition, String keyword);

	
	// 관리자
	ArrayList<LongRent> adminList();
	int deleteLongRent(int no);
	
	
	// 관리자 댓글 남기기 버튼
	int adminUpdateLongRent(String rep, int no);

	// 관리자 댓글 삭제 버튼
	int adminReplyDeleteLongRent(int no);

	

	// 차트용
	JSONArray getCountLongRent();
	JSONArray getCountTimeLongRent();

	ArrayList<LongRent> selectLongRentChartList();




}
