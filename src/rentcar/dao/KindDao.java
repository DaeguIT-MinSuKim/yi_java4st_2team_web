package rentcar.dao;

import java.util.List;

import rentcar.dto.Kind;

public interface KindDao {
	
	//차종리스트 불러오기
	List<Kind> selectKindByAll();
	
	//차종 불러오기
	Kind selectKindByNo(int res);
	
	//차종 추가하기
	int insertKind(Kind kind);
	
	//차종 수정하기
	int updateKind(Kind kind);
	
	//차종 삭제하기
	int deleteKind(Kind kind);
}
