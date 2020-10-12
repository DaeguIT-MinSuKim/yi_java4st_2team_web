package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.dao.EventDao;
import rentcar.dto.Event;
import rentcar.exception.CustomSQLException;

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
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT";
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
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'y'";
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
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT WHERE is_event = 'n'";
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

}
