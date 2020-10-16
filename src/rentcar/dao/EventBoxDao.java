package rentcar.dao;

import rentcar.dto.EventBox;

public interface EventBoxDao {
	// 이벤트 보관함 추가
	int insertEventBox(EventBox eventBox);
}
