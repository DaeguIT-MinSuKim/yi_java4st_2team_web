package rentcar.dao;

import java.util.Date;
import java.util.List;

import rentcar.dto.Rent;

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
	int deleteRent(Rent rent);
}
