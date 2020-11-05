package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.utils.Paging;

public class EventService {
	private EventDaoImpl dao = EventDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public EventService() {
		dao.setCon(con);
	}
	
	public ArrayList<Event> listEvent(){
		return dao.selectEventByAll();
	}
	
	public ArrayList<Event> listEventIng(){
		return dao.selectEventIng();
	}
	
	public ArrayList<Event> listEventEnd(){
		return dao.selectEventEnd();
	}
	
	public Event getEvent(String code) {
		return dao.selectEventByCode(code);
	}
	
	public int insertEvent(Event event) {
		return dao.insertEvent(event);
	}
	
	public int updateEvent(Event event) {
		return dao.updateEvent(event);
	}
	
	public int deleteEvent(String code) {
		return dao.deleteEvent(code);
	}
	
	// 페이징
	public int countEventByall() {
		return dao.countEventByAll();
	}
	public ArrayList<Event> pagingEventByAll(Paging paging){
		return dao.pagingEventAyAll(paging);
	}
	public ArrayList<Event> selectEventBoxFindMemberCoupon(String id) {
		return dao.selectEventBoxFindMemberCoupon(id);
	}
	public ArrayList<Event> selectEventBoxFindMemberCouponEnd(String id, String isEvent) {
		return dao.selectEventBoxFindMemberCouponEnd(id, isEvent);
	}
	
	// 관리자 이벤트 - 검색
	public List<Event> searchEventList(String condition, String keyword, Paging paging){
		return dao.searchEventList(condition, keyword, paging);
	}
	public int countSearchEventByall(String condition, String keyword) {
		return dao.countSearchEventByAll(condition, keyword);
	}
	
	public JSONArray getCountEvent() {
		return dao.getCountEvent();
	}


}
