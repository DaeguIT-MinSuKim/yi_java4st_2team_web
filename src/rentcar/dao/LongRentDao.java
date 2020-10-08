package rentcar.dao;

import rentcar.dto.LongRent;
import java.util.ArrayList;

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
	
	
}
