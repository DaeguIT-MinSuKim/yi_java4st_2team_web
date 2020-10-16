package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import rentcar.dao.EventBoxDao;
import rentcar.dto.EventBox;
import rentcar.exception.CustomSQLException;

public class EventBoxDaoImpl implements EventBoxDao {
	private static final EventBoxDaoImpl instance = new EventBoxDaoImpl();

	private Connection con;

	public EventBoxDaoImpl() {
	}

	public static EventBoxDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public int insertEventBox(EventBox eventBox) {
		String sql = "INSERT INTO EVENT_BOX(EVENT_CODE, ID, IS_EVENT) VALUES(?, ?, ?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, Integer.parseInt(eventBox.getEventCode().getEventCode()));
			pstmt.setString(2, eventBox.getId().getId());
			pstmt.setString(3, eventBox.getIsEvent());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

}
