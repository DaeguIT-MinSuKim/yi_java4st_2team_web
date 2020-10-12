package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.Event;

public interface EventDao {
	// 이벤트 리스트
	ArrayList<Event> selectEventByAll();
	
	// 이벤트 진행중 리스트
	ArrayList<Event> selectEventIng();
	
	// 이벤트 종료된 리스트
	ArrayList<Event> selectEventEnd();
	
	// 이벤트 코드 검색
	Event selectEventByCode(String code);
}
