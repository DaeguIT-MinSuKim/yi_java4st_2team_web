package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.Ins;
import rentcar.utils.Paging;

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
	int deleteIns(int code);
	
	//검색+페이징
	List<Ins> selectSearhPaging(String condition, String keyword, Paging paging);
	
	int countSearchInsByAll(String condition, String keyword);

	//페이징
	ArrayList<Ins> pagingInsByAll(Paging paging);

	int countInsByAll();

	
}
