package rentcar.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.dto.EventBox;

public class TransactionService {
	private EventDaoImpl eventDao = EventDaoImpl.getInstance();
	private EventBoxDaoImpl eventBoxDao = EventBoxDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public TransactionService() {
		eventDao.setCon(con);
		eventBoxDao.setCon(con);
	}
	
	public int updateEvnetAndEventBox(Event event) {
		try {
			con.setAutoCommit(false);
			
			eventDao.updateEvent(event);
			
			ArrayList<EventBox> eventBoxList = eventBoxDao.selectEventBoxFindCode(event.getEventCode());
			
			for (EventBox eb : eventBoxList) {
				eventBoxDao.updateEventBoxEndIsEvent(eb.getEventCode().getEventCode());	
			}
			
			con.commit();
		} catch (SQLException e) {
			rollbackUtil(con, e);
		}
		
		return 0;
	}
	
	public int deleteEventAndEventBox(Event event) {
		try {
			con.setAutoCommit(false);
			
			eventDao.deleteEvent(event.getEventCode());
			
			ArrayList<EventBox> eventBoxList = eventBoxDao.selectEventBoxFindCode(event.getEventCode());
			System.out.println("eventBoxList : "+ eventBoxList);
			
			for (EventBox eb : eventBoxList) {
				eventBoxDao.deleteEventBox(eb);
			}
			
			con.commit();
		} catch (SQLException e) {
			rollbackUtil(con, e);
		}
		
		return 0;
		
	}

	private void rollbackUtil(Connection con, SQLException e) {
		try {
			System.out.println("roll back");
			con.rollback();
			throw new RuntimeException();
		} catch (SQLException ex) {
			
		}
	}

}
