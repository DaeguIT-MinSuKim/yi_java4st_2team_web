package rentcar.dao;

import java.util.List;

import rentcar.dto.Ins;

public interface InsDao {
	
	//보험리스트 불러오기
	List<Ins> selectInsByAll();
	
	//Ins 불러오기
	Ins selectInsByNo(int res);
	
	//Ins 추가하기
	int insertIns(Ins ins);
	
	//Ins 수정하기
	int updateIns(Ins ins);
	
	//Ins 삭제하기
	int deleteIns(Ins ins);
}
