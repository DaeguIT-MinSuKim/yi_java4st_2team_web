package rentcar.service;

import java.sql.Connection;

import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.EventBox;

public class EventBoxService {
	private EventBoxDaoImpl dao = EventBoxDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public EventBoxService() {
		dao.setCon(con);
	}
	
	public int insertEventBox(EventBox eventBox) {
		System.out.println("왔따!!");
		return dao.insertEventBox(eventBox);
	}
	
	public EventBox selectEventBoxFindCodeId(String eventCode, String id) {
		return dao.selectEventBoxFindCodeId(eventCode, id);
	}
	
}
