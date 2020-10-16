package rentcar.service;

import java.sql.Connection;

import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.ds.JndiDS;

public class EventBoxService {
	private EventBoxDaoImpl dao = EventBoxDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public EventBoxService() {
		dao.setCon(con);
	}
	
	

}
