package rentcar.dao;

import java.util.ArrayList;
import java.util.List;

import rentcar.dto.Kind;
import rentcar.utils.Paging;

public interface KindDao {

	// 차종리스트 불러오기
	List<Kind> selectKindByAll();

	// Kind 불러오기
	Kind selectKindByNo(int res);

	// Kind 추가하기
	int insertKind(Kind k);

	// Kind 수정하기
	int updateKind(Kind k);

	// Kind 삭제하기
	int deleteKind(Kind k);

	// 페이징
	int countKindByAll();

	ArrayList<Kind> pagingKindByAll(Paging paging);

	// 관리자 차량 - 검색
	int countSearchKindByAll(String condition, String keyword);

	ArrayList<Kind> searchKindList(String condition, String keyword, Paging paging);
}
