package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;

import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;

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
	public int totalRecord() {
		return dao.totalRecord();
	}
	public String pageNumber(int tpage, String name) {
		return dao.pageNumber(tpage, name);
	}
	public ArrayList<Event> listEvent(int tpage){
		return dao.listEvent(tpage);
	}

}
