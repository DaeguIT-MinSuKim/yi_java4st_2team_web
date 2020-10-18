package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;

import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;

public class RentService {
	private EventDaoImpl dao = EventDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public RentService() {
		dao.setCon(con);
	}
	
	public ArrayList<Event> listEvent(){
		return dao.selectEventByAll();
	}

}