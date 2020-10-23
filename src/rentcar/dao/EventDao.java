package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.utils.Paging;

public interface EventDao {
	// 이벤트 리스트
	ArrayList<Event> selectEventByAll();
	
	// 이벤트 진행중 리스트
	ArrayList<Event> selectEventIng();
	
	// 이벤트 종료된 리스트
	ArrayList<Event> selectEventEnd();
	
	// 이벤트 코드 검색
	Event selectEventByCode(String code);
	
	// 이벤트 추가
	int insertEvent(Event event);
	
	// 이벤트 수정
	int updateEvent(Event event);
	
	// 이벤트 삭제
	int deleteEvent(String code);
	
	// 페이징
	int countEventByAll();
	ArrayList<Event> pagingEventAyAll(Paging paging);
	
	// 이벤트 - 한 회원이 갖고 있는 할인쿠폰 찾기 
	ArrayList<Event> selectEventBoxFindMemberCoupon(String id);
}
