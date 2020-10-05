package rentcar.dao;

import rentcar.dto.LongRent;
import java.util.ArrayList;

public interface LongRentDao {

	//member id별 list조회
	ArrayList<LongRent> listLongRent(String id);
	
	//게시판 no별 list
	LongRent getLongRent(int no);
	
	//글쓰기
	int insertLongRent(LongRent longrent);
	
}
