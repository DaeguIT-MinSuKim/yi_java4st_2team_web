package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.EventBox;

public interface EventBoxDao {
	// 이벤트 보관함 추가
	int insertEventBox(EventBox eventBox);
	
	// 이벤트 보관함 - 아이디 및 쿠폰 코드 찾기
	EventBox selectEventBoxFindCodeId(String eventCode, String id);
	
	// 이벤트 찾기
	//ArrayList<EventBox> selectEventBoxByFind
	
	// 이벤트 종료 - 보관함에 사용여부 y
	int updateEventBoxEndIsEvent(String eventCode);
}
