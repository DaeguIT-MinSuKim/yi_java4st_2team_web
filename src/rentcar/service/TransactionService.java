package rentcar.service;

import java.sql.Connection;
import java.sql.SQLException;

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
			
			
			
			/*for (EventBox eb : ) {
				eventBoxDao.updateEventBoxEndIsEvent(eb.getEventCode().getEventCode());	
			}*/
			
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
