package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import rentcar.dao.NoticeDao;
import rentcar.dto.Notice;
import rentcar.exception.CustomSQLException;

public class NoticeDaoImpl implements NoticeDao {
	
	private static final NoticeDaoImpl instance = new NoticeDaoImpl();
	
	private Connection con;
	
	public static NoticeDaoImpl getInstance() {
		return instance;
	}

	
	public NoticeDaoImpl() {
		
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public ArrayList<Notice> selectNoticeList() {
		String sql = "SELECT * FROM NOTICE ORDER BY IS_TOP, NO DESC";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				ArrayList<Notice> list = new ArrayList<>();
				do {
					list.add(getNotice(rs));
				}while(rs.next());
				return list;
			}
		}catch(SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Notice getNotice(ResultSet rs) throws SQLException {
		int no = rs.getInt("NO");
		String title = rs.getString("TITLE");
		String contents = rs.getString("CONTENTS");
		Date writeDate = rs.getTimestamp("WRITE_DATE");
		int isTop = rs.getInt("is_top");
		return new Notice(no, title, contents, writeDate, isTop);
	}

	@Override
	public Notice getNoticeList(int no) {
		String sql = "SELECT * FROM NOTICE WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, no);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getNotice(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}


}
