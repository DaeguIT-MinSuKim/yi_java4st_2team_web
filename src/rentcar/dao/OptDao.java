package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.Opt;
import rentcar.utils.Paging;

public interface OptDao {
	
	//옵션리스트 불러오기
	List<Opt> selectOptByAll();
	
	//Opt 불러오기
	Opt selectOptByNo(int res);
	
	//Opt 추가하기
	int insertOpt(Opt opt);
	
	//Opt 수정하기
	int updateOpt(Opt opt);
	
	//Opt 삭제하기
	int deleteOpt(Opt opt);

	ArrayList<Opt> pagingOptByAll(Paging paging);

	int countOptByAll();

	List<Opt> selectSearchPagingOpt(String condition, String keyword, Paging paging);
}
