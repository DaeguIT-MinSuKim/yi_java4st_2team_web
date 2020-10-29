package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import rentcar.dao.NoticeDao;
import rentcar.dto.LongRent;
import rentcar.dto.Notice;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

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
		String sql = "SELECT * FROM NOTICE ORDER BY IS_TOP, WRITE_DATE desc";
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

	@Override
	public int insertNotice(Notice notice) {
		String sql = "INSERT INTO NOTICE (TITLE, CONTENTS, WRITE_DATE, IS_TOP ) "
				+ "VALUES(?,?,sysdate,?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContents());
			pstmt.setInt(3, notice.getIsTop());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}


	@Override
	public int deleteNotice(int no) {
		String sql = "DELETE FROM NOTICE WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}


	@Override
	public int updateNotice(Notice notice) {
		String sql = "UPDATE NOTICE SET TITLE = ?, contents = ?, is_top = ? where no= ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContents());
			pstmt.setInt(3, notice.getIsTop());
			pstmt.setInt(4, notice.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}


	// 페이징
			@Override
			public int countNoticeByAll() {
				String sql = "select count(*) from Notice";
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
			public ArrayList<Notice> pagingNoticeByAll(Paging paging) {
				String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM NOTICE ORDER BY IS_TOP, WRITE_DATE desc) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
				try (PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setInt(1, paging.getStart());
					pstmt.setInt(2, paging.getEnd());
					try (ResultSet rs = pstmt.executeQuery()){
						if (rs.next()) {
							ArrayList<Notice> list = new ArrayList<Notice>();
							do {
								list.add(getNotice(rs));
							} while (rs.next());
							return list;
						}
					}
				} catch (SQLException e) {
					throw new CustomSQLException(e);
				}
				return null;
			}
		
		//검색 기능 구현
		 @Override
		 public ArrayList<Notice> selectSearchNotice(String condition, String keyword){
			//select * from where title like '%?%'
			//select * from where no like '%?%'
			 String sql = "SELECT * FROM NOTICE";
			 try {
				 if(keyword != null && !keyword.isEmpty()) {
					 sql += " where " + condition.trim() + " like '%"+keyword.trim()+"%' ORDER BY IS_TOP, WRITE_DATE desc";
				 }else {
					 //모든 레코드 검색
					 sql += " ORDER BY IS_TOP, WRITE_DATE desc";
				 }
				 try(PreparedStatement pstmt = con.prepareStatement(sql);
						 ResultSet rs = pstmt.executeQuery()){
					 if(rs.next()) {
						 ArrayList<Notice> list = new ArrayList<Notice>();
						 do {
							 list.add(getNotice(rs));
						 }while(rs.next());
						 return list;
					 }
				 }
			 }catch(Exception e) {
				 throw new CustomSQLException(e);
			 }
		 return null;
		 }
		 
		 
		 
		 //검색 + 페이징 구현 
		 @Override
		 public ArrayList<Notice> selectPagingSearchNotice(String condition, String keyword, Paging paging){
			 String sql = "SELECT * FROM (SELECT rownum Rn, a.* FROM (SELECT * FROM notice";
			 try {
				 if(keyword != null && !keyword.isEmpty()) {
					 sql += " where " + condition.trim() + " like '%"+keyword.trim()+"%' ORDER BY is_top, WRITE_DATE desc ) a) WHERE rn BETWEEN ? AND ? ORDER BY rn";
				 }else {
					 //모든 레코드 검색
					 sql += " ORDER BY is_top, WRITE_DATE desc ) a) WHERE rn BETWEEN ? AND ? ORDER BY rn";
				 }
				 try(PreparedStatement pstmt = con.prepareStatement(sql)){
						 pstmt.setInt(1, paging.getStart());
						 pstmt.setInt(2, paging.getEnd());
					 try(ResultSet rs = pstmt.executeQuery()){
						 if(rs.next()) {
							 ArrayList<Notice> list = new ArrayList<Notice>();
							 do {
								 list.add(getNotice(rs));
							 }while(rs.next());
							 return list;
						 }
						}
					 }
			 }catch(Exception e) {
				 throw new CustomSQLException(e);
			 }
		 return null;
		 }
		 
		 @Override
			public int countSearchNoticeByAll(String condition, String keyword) {
				String sql = "select count(*) from Notice";
				try {
					if (keyword != null && !keyword.isEmpty()) {
						sql += " WHERE " + condition.trim() + " LIKE '%" + keyword.trim() + "%'";
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
		 
		 
		 
}
