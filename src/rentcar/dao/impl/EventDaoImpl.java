package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import rentcar.dao.EventDao;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class EventDaoImpl implements EventDao {
	private static final EventDaoImpl instance = new EventDaoImpl();

	private Connection con;
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

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
		// String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY TO_NUMBER(EVENT_CODE) DESC";
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, START_DATE, END_DATE, IS_EVENT FROM EVENT ORDER BY TO_NUMBER(EVENT_CODE) DESC";
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
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, START_DATE, END_DATE, IS_EVENT FROM EVENT WHERE is_event = 'y' ORDER BY TO_NUMBER(EVENT_CODE) DESC";
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
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, START_DATE, END_DATE, IS_EVENT FROM EVENT WHERE is_event = 'n' AND END_DATE < SYSDATE ORDER BY TO_NUMBER(EVENT_CODE) DESC";
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
		event.setStartDate(rs.getTimestamp("START_DATE"));
		event.setEndDate(rs.getTimestamp("END_DATE"));
		event.setIsEvent(rs.getString("IS_EVENT"));
		
		return event;
	}

	@Override
	public Event selectEventByCode(String code) {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, START_DATE, END_DATE, IS_EVENT FROM EVENT WHERE EVENT_CODE = ?";
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
		String sql = "INSERT INTO EVENT(NAME, SALE, THUM_IMAGE, VIEW_IMAGE, START_DATE, END_DATE, IS_EVENT) VALUES(?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, event.getName());
			pstmt.setInt(2, event.getSale());
			pstmt.setString(3, event.getThumImage());
			pstmt.setString(4, event.getViewImage());
			pstmt.setTimestamp(5, new Timestamp(event.getStartDate().getTime()));
			pstmt.setTimestamp(6, new Timestamp(event.getEndDate().getTime()));
			pstmt.setString(7, event.getIsEvent());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int updateEvent(Event event) {
		String sql = "UPDATE EVENT SET NAME = ?, SALE = ?, THUM_IMAGE = ?, VIEW_IMAGE = ?, START_DATE = ?, END_DATE = ?, IS_EVENT = ? WHERE EVENT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, event.getName());
			pstmt.setInt(2, event.getSale());
			pstmt.setString(3, event.getThumImage());
			pstmt.setString(4, event.getViewImage());
			pstmt.setTimestamp(5, new Timestamp(event.getStartDate().getTime()));
			pstmt.setTimestamp(6, new Timestamp(event.getEndDate().getTime()));
			pstmt.setString(7, event.getIsEvent());
			pstmt.setString(8, event.getEventCode());
			
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

	@Override
	public ArrayList<Event> selectEventBoxFindMemberCoupon(String id) {
		String sql = "SELECT E.EVENT_CODE, E.NAME, E.SALE, E.START_DATE, E.END_DATE " + 
					"FROM EVENT_BOX B, EVENT E " + 
					"WHERE B.IS_EVENT = 'n' AND B.ID = ? AND B.EVENT_CODE = E.EVENT_CODE";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					ArrayList<Event> list = new ArrayList<Event>();
					do {
						list.add(getMemberEvent(rs));
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
	public ArrayList<Event> selectEventBoxFindMemberCouponEnd(String id, String isEvent) {
		String sql = "SELECT E.EVENT_CODE, E.NAME, E.SALE, E.START_DATE, E.END_DATE " + 
				"FROM EVENT_BOX B, EVENT E " + 
				"WHERE B.IS_EVENT = ? AND B.ID = ? AND B.EVENT_CODE = E.EVENT_CODE";
	try(PreparedStatement pstmt = con.prepareStatement(sql)){
		pstmt.setString(1, isEvent);
		pstmt.setString(2, id);
		
		try(ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				ArrayList<Event> list = new ArrayList<Event>();
				do {
					list.add(getMemberEvent(rs));
				} while (rs.next());
				return list;
			}
		}
	} catch (SQLException e) {
		throw new CustomSQLException(e);
	}
	return null;
	}
	
	private Event getMemberEvent(ResultSet rs) throws SQLException {
		Event event = new Event();
		
		event.setEventCode(rs.getString("EVENT_CODE"));
		event.setName(rs.getString("NAME"));
		event.setStartDate(rs.getTimestamp("START_DATE"));
		event.setEndDate(rs.getTimestamp("END_DATE"));
		event.setSale(rs.getInt("SALE"));
		
		return event;
	}

	@Override
	public List<Event> searchEventList(String condition, String keyword, Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN,a.* FROM (SELECT * FROM EVENT ORDER BY EVENT_CODE desc) a ) WHERE rn BETWEEN ? AND ? ";
		try {
			if (keyword != null && !keyword.isEmpty()) {
				if (condition.equals("is_event")) {
					if (keyword.equals("진행 예정")) {
						sql += " AND " + condition.trim() + " = 'n' AND START_DATE > SYSDATE ";
					} else if (keyword.equals("진행 중")) {
						sql += " AND " + condition.trim() + " = 'y' ";
					} else if (keyword.equals("진행 완료")) {
						sql += " AND " + condition.trim() + " = 'n' AND END_DATE < SYSDATE ";
					}
				} else {
					sql += " AND " + condition.trim() + " LIKE '%" + keyword.trim() + "%' ";
				}
			}
			sql += "ORDER BY EVENT_CODE DESC";
			try (PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, paging.getStart());
				pstmt.setInt(2, paging.getEnd());
				
				try (ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						List<Event> list = new ArrayList<Event>();
						do {
							list.add(getEvent(rs));
						} while (rs.next());
						return list;
					}
				}
				
			}
		} catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int countSearchEventByAll(String condition, String keyword) {
		String sql = "select count(*) from EVENT";
		try {
			if (keyword != null && !keyword.isEmpty()) {
				if (condition.equals("is_event")) {
					if (keyword.equals("진행 예정")) {
						sql += " WHERE " + condition.trim() + " = 'n' AND START_DATE > SYSDATE ";
					} else if (keyword.equals("진행 중")) {
						sql += " WHERE " + condition.trim() + " = 'y' ";
					} else if (keyword.equals("진행 완료")) {
						sql += " WHERE " + condition.trim() + " = 'n' AND END_DATE < SYSDATE ";
					}
				} else {					
					sql += " WHERE " + condition.trim() + " LIKE '%" + keyword.trim() + "%'";
				}
			}
			try(PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}
	
	@Override
	public JSONArray getCountEvent() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray jsonArray = new JSONArray();
		
		JSONArray colNameArray = new JSONArray(); //컬 타이틀 설정
		colNameArray.put("해당 이벤트");
		colNameArray.put("이벤트별 건수");
		jsonArray.put(colNameArray);
		
		try {
			con = JndiDS.getConnection();
			sql="SELECT TO_CHAR(e.EVENT_CODE) AS EVENT_NUM, COUNT(*) AS EVENT_COUNT FROM EVENT e JOIN EVENT_BOX eb ON eb.EVENT_CODE = e.EVENT_CODE GROUP BY TO_CHAR(e.EVENT_CODE) ORDER BY EVENT_NUM";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				JSONArray rowArray = new JSONArray();
				rowArray.put(rs.getString("EVENT_NUM"));
				rowArray.put(rs.getInt("EVENT_COUNT"));
				
				jsonArray.put(rowArray);
			}//while
		}catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}
}
