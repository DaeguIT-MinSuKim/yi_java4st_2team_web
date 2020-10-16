package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.LongRent;

public interface LongRentDao {

	ArrayList<LongRent> selectLongRentList();

	// 게시판 no별 list
	LongRent getLongRentList(int no);

	// 글쓰기
	int insertLongRent(LongRent longrent);

	int updateLongRent(LongRent longrent);

	int deleteLongRent(int no);

	// 게시글 보기 비밀번호 
	LongRent checkPassword(int no, String pwd);
	
	
	
	//게시판 페이징 
//	int totalRecord(int no);
//
//	public String pageNumber(int tpage, String name);
//
//	ArrayList<LongRent> listLongRent(int tpage, int no);
	
}
