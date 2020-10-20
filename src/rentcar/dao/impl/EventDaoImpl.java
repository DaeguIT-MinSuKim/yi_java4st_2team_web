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

	@Override
	public int totalRecord() {
		int total_pages = 0;
		String sql = "select count(*) from EVENT";
		try (PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				total_pages = rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return total_pages;
	}
	
    private static int VIEW_ROWS = 5; // 페이지의 개수
    private static int COUNTS = 5; // 한 페이지에 나타낼 상품의 개수

	@Override
	public String pageNumber(int tpage, String name) {
		String str = "";

        int total_pages = totalRecord();            //총레코드수
        int page_count = (total_pages / COUNTS) + 1;    //총 페이지 개수 11/5 = 2.2(2) => 3 페이지로 표시+1함
        
        if (total_pages % COUNTS == 0) {                //정확히 레코드수가 5의 배수면 전체페이지수를 1감소
            page_count--;
        }
        
        if (tpage < 1) {                                //현재 보고 있는 페이지는 1미만은 없음
            tpage = 1;
        }
        
        int start_page = tpage - (tpage % VIEW_ROWS) + 1; 
        //현재 페이지가 1이면 1-(1%5) + 1 = 1, 2,3,4,5
        //현재 페이지가 2이면 2-(2%5) + 1 = 1, 
        //현재 페이지가 3이면 3-(3%5) + 1 = 1, 
        //현재 페이지가 4이면 4-(4%5) + 1 = 1, 
        //현재 페이지가 5이면 5-(5%5) + 1 = 6, 
        //현재 페이지가 6이면 6-(6%5) + 1 = 6,
        //현재 페이지가 7이면 7-(7%5) + 1 = 6,
        //현재 페이지가 8이면 8-(8%5) + 1 = 6,
        //현재 페이지가 9이면 9-(9%5) + 1 = 6,
        //현재 페이지가 10이면 10-(10%5) + 1 = 11,
        //현재 페이지가 11이면 11-(11%5) + 1 = 11,
        int end_page = start_page + (COUNTS-1); 
        //start페이지가 1이면 마지막 페이지는 5
        //start페이지가 2이면 마지막 페이지는 6
        
        if (end_page > page_count) { //마지막 페이지가 총페이지수보다 크다면 마지막 페이지를 총페이지수에 맞춤
            end_page = page_count; 
        }
        
        if (start_page > VIEW_ROWS) { //시작 페이지가 5보다 크다면 6일경우 "<< < " 표시   
            str += "<a href='adminEvent.do?tpage=1&key=" + name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
            str += "<a href='adminEvent.do?tpage=" + (start_page - 1) + "&key=<%=event.name%>'>&lt;</a>&nbsp;&nbsp;";
        }
        
        // [6] [7] [8] [9] [10]
        for (int i = start_page; i <= end_page; i++) {
            if (i == tpage) {
                str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
            } else {
                str += "<a href='adminEvent.do?tpage=" + i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
            }
        }
        
        //마지막 페이지 보다 총페이지수가 크다면 뒤페이지가 있다면 " > >>" 추가
        if (page_count > end_page) {
            str += "<a href='adminEvent.do?tpage=" + (end_page + 1) + "&key=" + name + "'> &gt; </a>&nbsp;&nbsp;";
            str += "<a href='adminEvent.do?tpage=" + page_count + "&key=" + name + "'> &gt; &gt; </a>&nbsp;&nbsp;";
        }
        
        return str;
	}

	@Override
	public ArrayList<Event> listEvent(int tpage) {
		String sql = "SELECT EVENT_CODE, NAME, SALE, THUM_IMAGE, VIEW_IMAGE, IS_EVENT FROM EVENT ORDER BY TO_NUMBER(EVENT_CODE) DESC";
		int absolutepage = 1;
		absolutepage = (tpage - 1) * COUNTS + 1;
		ArrayList<Event> eventList = new ArrayList<Event>();
		try (PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;
				while(count < COUNTS) {
					eventList.add(getEvent(rs));
					if (rs.isLast()) break;
					rs.next();
					count++;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return eventList;
	}

}
