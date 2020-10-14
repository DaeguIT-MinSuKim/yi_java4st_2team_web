package rentcar.dao;

import java.util.List;

import rentcar.dto.Kind;
import rentcar.dto.Kind;

public interface KindDao {
	
	//차종리스트 불러오기
	List<Kind> selectKindByAll();
	
	//Kind 불러오기
	Kind selectKindByNo(int res);
	
	//Kind 추가하기
	int insertKind(Kind k);
	
	//Kind 수정하기
	int updateKind(Kind k);
	
	//Kind 삭제하기
	int deleteKind(Kind k);
}
