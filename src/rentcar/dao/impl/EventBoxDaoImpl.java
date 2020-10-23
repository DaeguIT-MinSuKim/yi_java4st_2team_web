package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.dao.EventBoxDao;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;
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
		String sql = "INSERT INTO EVENT_BOX(EVENT_CODE, ID) VALUES(?, ?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, Integer.parseInt(eventBox.getEventCode().getEventCode()));
			pstmt.setString(2, eventBox.getId().getId());
			System.out.println("왔따구!!!");
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int deleteEventBox(EventBox eventBox) {
		String sql = "DELETE FROM EVENT_BOX WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, Integer.parseInt(eventBox.getEventCode().getEventCode()));
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public EventBox selectEventBoxFindCodeId(String eventCode, String id) {
		String sql = "SELECT EVENT_BOX, EVENT_CODE, ID, IS_EVENT FROM EVENT_BOX WHERE EVENT_CODE = ? AND ID = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, eventCode);
			pstmt.setString(2, id);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getEventBox(rs);
				}
			}
			
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private EventBox getEventBox(ResultSet rs) throws SQLException {
		EventBox eventBox = new EventBox();
		eventBox.setEventBox(rs.getInt("EVENT_BOX"));
		eventBox.setEventCode(new Event(rs.getString("EVENT_CODE")));
		eventBox.setId(new Member(rs.getString("ID")));
		eventBox.setIsEvent(rs.getString("IS_EVENT"));
		
		return eventBox;
	}

	@Override
	public int updateEventBoxEndIsEvent(String eventCode) {
		String sql = "UPDATE EVENT_BOX SET IS_EVENT = 'y' WHERE EVENT_CODE = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, eventCode);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public ArrayList<EventBox> selectEventBoxFindCode(String eventCode) {
		String sql = "SELECT EVENT_BOX, EVENT_CODE, ID, IS_EVENT FROM EVENT_BOX WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, eventCode);
			
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					ArrayList<EventBox> list = new ArrayList<EventBox>();
					do {
						list.add(getEventBox(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}
	
	
	@Override
	public EventBox selectEventBoxFindMemberCoupon(String id) {
		String sql = "SELECT E.NAME, E.SALE " + 
					"FROM EVENT_BOX B, EVENT E " + 
					"WHERE B.IS_EVENT = 'n' AND B.ID = ? AND B.EVENT_CODE = E.EVENT_CODE";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getEventBox(rs);
				}
			}
			
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}
}
