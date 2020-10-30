package rentcar.dao;

import java.util.List;

import rentcar.dto.Rent;
import rentcar.utils.Paging;

public interface RentDao {
	//대여목록 불러오기
	List<Rent> selectRentByAll();
	//대여정보 불러오기
	Rent selectRentByNo(int res);
	//대여정보 추가하기
	int insertRent(Rent rent);
	//대여정보 수정하기
	int updateRent(Rent rent);
	//대여정보 삭제하기
	int deleteRent(int rentNo);
	// 한 차량에 대한 대여가능일 불러오기
	Rent selectRentByDate(String id);
	// 관리자 단기렌트 검색
//	List<Rent> selectSearch(String condition, String keyword);
	List<Rent> selectSearchAndPaging(String condition, String keyword, Paging paging);
	// 페이징용 카운팅
	int countRentByAll();
	// 페이징용 카운팅2
	List<Rent> pagingRentByAll(Paging paging);
	
	// 최근 insert된 No 가져오기
	int selectRecentByNo();
	
	// 가장 최근에  예약완료한 정보 (예약완료에 뿌릴 정보)
	Rent selectRecentByRent(String id, String carNo);
	
	// 한 회원의 모든 렌트 현황 가져오기
	List<Rent> selectRentById(String id);
}
