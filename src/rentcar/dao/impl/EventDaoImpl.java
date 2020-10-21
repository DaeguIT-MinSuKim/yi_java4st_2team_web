package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.dao.EventDao;
import rentcar.dto.Event;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class EventDaoImpl implements EventDao {
	private static final EventDaoImpl instance = new EventDaoImpl();

	private Connection con;

	public EventDaoImpl() {
	}

	public static EventDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public ArrayList<Event> selectEventByAll() {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY TO_NUMBER(EVENT_CODE) DESC";
		try (PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				ArrayList<Event> list = new ArrayList<>();
				do {
					list.add(getEvent(rs));
				} while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public ArrayList<Event> selectEventIng() {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y' ORDER BY TO_NUMBER(EVENT_CODE) DESC";
		try (PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				ArrayList<Event> list = new ArrayList<>();
				do {
					list.add(getEvent(rs));
				} while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public ArrayList<Event> selectEventEnd() {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'n' ORDER BY TO_NUMBER(EVENT_CODE) DESC";
		try (PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				ArrayList<Event> list = new ArrayList<>();
				do {
					list.add(getEvent(rs));
				} while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Event getEvent(ResultSet rs) throws SQLException {
		Event event = new Event();
		
		event.setEventCode(rs.getString("EVENT_CODE"));
		event.setName(rs.getString("NAME"));
		event.setSale(rs.getInt("SALE"));
		event.setThumImage(rs.getString("THUM_IMAGE"));
		event.setViewImage(rs.getString("VIEW_IMAGE"));
		event.setIsEvent(rs.getString("IS_EVENT"));
		
		return event;
	}

	@Override
	public Event selectEventByCode(String code) {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, code);
			
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getEvent(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int insertEvent(Event event) {
		String sql = "INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT) VALUES(?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, event.getName());
			pstmt.setInt(2, event.getSale());
			pstmt.setString(3, event.getThumImage());
			pstmt.setString(4, event.getViewImage());
			pstmt.setString(5, event.getIsEvent());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int updateEvent(Event event) {
		String sql = "UPDATE EVENT SET NAME = ?, SALE = ?, THUM_IMAGE = ?, VIEW_IMAGE = ?, IS_EVENT = ? WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, event.getName());
			pstmt.setInt(2, event.getSale());
			pstmt.setString(3, event.getThumImage());
			pstmt.setString(4, event.getViewImage());
			pstmt.setString(5, event.getIsEvent());
			pstmt.setString(6, event.getEventCode());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int deleteEvent(String code) {
		String sql = "DELETE FROM EVENT WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, code);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	// 페이징
	@Override
	public int countEventByAll() {
		String sql = "select count(*) from EVENT";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Event> pagingEventAyAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM EVENT ORDER BY EVENT_CODE DESC) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					ArrayList<Event> list = new ArrayList<Event>();
					do {
						list.add(getEvent(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

}
