package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;

import rentcar.dao.LongRentDao;
import rentcar.ds.JndiDS;
import rentcar.dto.LongRent;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class LongRentDaoImpl implements LongRentDao {
	private static final LongRentDaoImpl instance = new LongRentDaoImpl();

	private Connection con;

	public LongRentDaoImpl() {
	}

	public static LongRentDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}
	
	//SELECT * FROM longrent ORDER BY WRITE_DATE desc

	//차트용
	@Override
	public JSONArray getCountLongRent() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray jsonArray = new JSONArray();
		
		JSONArray colNameArray = new JSONArray(); //컬 타이틀 설정
		colNameArray.put("해당 월");
		colNameArray.put("월별 건수");
		jsonArray.put(colNameArray);
		
		try {
			con = JndiDS.getConnection();
			sql="SELECT TO_CHAR(WRITE_DATE, 'MM') AS WRITE_MONTH, COUNT(*) AS MON_COUNT FROM LONGRENT GROUP BY TO_CHAR(WRITE_DATE, 'MM') ORDER BY WRITE_month";
//			sql="SELECT  no, name FROM LONGRENT";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				JSONArray rowArray = new JSONArray();
//				rowArray.put(rs.getString("NAME"));
//				rowArray.put(rs.getInt("no"));
				rowArray.put(rs.getString("WRITE_MONTH"));
				rowArray.put(rs.getInt("MON_COUNT"));
				
				jsonArray.put(rowArray);
			}//while
		}catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}
	//차트용
	@Override
	public JSONArray getCountTimeLongRent() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray jsonArray = new JSONArray();
		
		JSONArray colNameArray = new JSONArray(); //컬 타이틀 설정
		colNameArray.put("시간");
		colNameArray.put("건수");
		jsonArray.put(colNameArray);
		
		try {
			con = JndiDS.getConnection();
			sql="SELECT to_char(WRITE_DATE, 'hh24') AS WRITE_hour, COUNT(*) AS HOUR_count FROM longrent GROUP BY TO_CHAR(WRITE_DATE, 'hh24') ORDER BY WRITE_hour asc";
//			sql="SELECT  no, name FROM LONGRENT";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				JSONArray rowArray = new JSONArray();
//				rowArray.put(rs.getString("NAME"));
//				rowArray.put(rs.getInt("no"));
				rowArray.put(rs.getString("WRITE_HOUR"));
				rowArray.put(rs.getInt("HOUR_COUNT"));
				
				jsonArray.put(rowArray);
			}//while
		}catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}
		
	
	@Override
	public ArrayList<LongRent> selectLongRentList() {
		String sql = "SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM LONGRENT ORDER BY WRITE_DATE desc";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<LongRent> list = new ArrayList<>();
				do {
					list.add(getLongRent(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}
	
	@Override
	public ArrayList<LongRent> selectLongRentChartList() {
		String sql = "SELECT TO_CHAR(WRITE_DATE, 'MM') AS WRITE_MONTH, COUNT(*) AS MON_COUNT FROM LONGRENT GROUP BY TO_CHAR(WRITE_DATE, 'MM')";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<LongRent> list = new ArrayList<>();
				do {
					list.add(getLongRentChart(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private LongRent getLongRent(ResultSet rs) throws SQLException {
//NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM LONGRENT		
		int no = rs.getInt("NO");
		String title = rs.getString("TITLE");
		String contents = rs.getString("CONTENTS");
		int repYn = rs.getInt("REP_YN");
		Date writeDate = rs.getTimestamp("WRITE_DATE");
		String rentTerm = rs.getString("RENT_TERM");
		String name = rs.getString("NAME");
		String tel = rs.getString("TEL");
		String pwd = rs.getString("PWD");
		String options = rs.getString("OPTIONS");
		String repContent = rs.getString("REP_CONTENT");

		return new LongRent(no, title, contents, repYn, writeDate, rentTerm, name, tel, pwd, options, repContent);
	}
	
	private LongRent getLongRentChart(ResultSet rs) throws SQLException {
	//NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM LONGRENT		
		int no = rs.getInt("NO");
		String title = rs.getString("TITLE");
		String contents = rs.getString("CONTENTS");
		int repYn = rs.getInt("REP_YN");
		Date writeDate = rs.getTimestamp("WRITE_DATE");
		String rentTerm = rs.getString("RENT_TERM");
		String name = rs.getString("NAME");
		String tel = rs.getString("TEL");
		String pwd = rs.getString("PWD");
		String options = rs.getString("OPTIONS");
		String repContent = rs.getString("REP_CONTENT");
		String write_month = rs.getString("WRITE_MONTH");
		int totalCount = rs.getInt("MON_COUNT");
		
		return new LongRent(no, title, contents, repYn, writeDate, rentTerm, name, tel, pwd, options, repContent, write_month, totalCount);
	}

	@Override
	public LongRent getLongRentList(int no) {
		String sql = "SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT "
				+ "FROM LONGRENT WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, no);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getLongRent(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int insertLongRent(LongRent longrent) {
		String sql = "INSERT INTO LONGRENT(NO, TITLE, CONTENTS,RENT_TERM, NAME, TEL, PWD, OPTIONS) "
				+ "VALUES(LONGRENT_NO_SEQ.NEXTVAL,?,empty_clob(),?,?,?,?,?)";

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			// 업데이트하는동안 다른 porcess의 접근을 막기 위해 오토커밋 닫고 시작
			con.setAutoCommit(false);
			
			pstmt.setString(1, longrent.getTitle());
			pstmt.setString(2, longrent.getRentTerm());
			pstmt.setString(3, longrent.getName());
			pstmt.setString(4, longrent.getTel());
			pstmt.setString(5, longrent.getPwd());
			pstmt.setString(6, longrent.getOptions());
			
			pstmt.executeUpdate(); // CLOB빼고 값 모두 삽입 완료
			
			pstmt.close();
			
			// 위에서 Insert한 데이터를 다시 가져옵니다.
			String sql2 = "SELECT CONTENTS FROM LONGRENT "
					+ "WHERE NO = (SELECT max(NO) FROM LONGRENT)";

//			longrent.getContents()
			
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			ResultSet rs = pstmt2.executeQuery();
			if (rs.next()) {

				System.out.println("CLOB 안된다 !!!!!!!!!!! 될거다 ");
//				Clob cl = ((OracleResultSet)rs).getClob(1);
//				 BufferedWriter writer = new BufferedWriter(cl.getCharacterOutputStream());
//				 writer.write(longrent.getContents().toString());
//				 writer.close();
				
//				BufferedWriter bw = new BufferedWriter(clob.setCharacterStream(0L));
//				bw.write(longrent.getContents());
//				bw.close();
				
			}
			
			// CLOB column에 데이터을 저장하였다면 commit()을 실행시키고  
			con.commit();
			// conn.setAutoCommit(true)로 다시 설정합니다.  
			con.setAutoCommit(true);  
			
			return pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	
	@Override
	public int updateLongRent(LongRent longrent) {
		String sql = "UPDATE LONGRENT SET TITLE = ?, contents = ?, RENT_TERM = ? , name= ? , tel =? , PWD = ?, OPTIONS = ? WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, longrent.getTitle());
			pstmt.setString(2, longrent.getContents());
			pstmt.setString(3, longrent.getRentTerm());
			pstmt.setString(4, longrent.getName());
			pstmt.setString(5, longrent.getTel());
			pstmt.setString(6, longrent.getPwd());
			pstmt.setString(7, longrent.getOptions());
			pstmt.setInt(8, longrent.getNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int deleteLongRent(int no) {
		String sql = "DELETE FROM LONGRENT WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public LongRent checkPassword(int no, String pwd) {
		String sql = "SELECT * FROM LONGRENT WHERE NO =? AND PWD = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, no);
			pstmt.setString(2, pwd);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getLongRent(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	/// 관리자

	@Override
	public int adminUpdateLongRent(String rep, int no) {
		String sql = "UPDATE LONGRENT SET REP_CONTENT = ?, REP_YN = 2 WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, rep);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 답변안한거 먼저보이기, 다음 날짜순
	@Override
	public ArrayList<LongRent> adminList() {
		String sql = "SELECT * FROM LONGRENT ORDER BY REP_YN ASC, WRITE_DATE ASC";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				ArrayList<LongRent> list = new ArrayList<>();
				do {
					list.add(getLongRent(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int adminReplyDeleteLongRent(int no) {
		String sql = "UPDATE LONGRENT SET REP_CONTENT = null, REP_YN = 1  WHERE NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

//	@Override
//	public int totalRecord(int no) {
//		int total_pages = 0;
//		String sql = "SELECT  COUNT(*) FROM LONGRENT WHERE NO LIKE ?";
//		try(PreparedStatement pstmt = con.prepareStatement(sql)){
//			pstmt.setInt(1, no);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				if(rs.next()) {
//					total_pages = rs.getInt(1); //레코드의 개수
//				}
//			}
//		} catch (SQLException e) {
//			throw new CustomSQLException(e);
//		}return total_pages;
//	}
//
	
	// 페이징
	@Override
	public int countLongRentByAll() {
		String sql = "select count(*) from longrent ";
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
	public ArrayList<LongRent> pagingLongRentByAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM longrent ORDER BY WRITE_DATE desc) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					ArrayList<LongRent> list = new ArrayList<LongRent>();
					do {
						list.add(getLongRent(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

		
		
	//검색
	@Override
	public List<LongRent> selectSearch(String condition, String keyword) {
		//select * from where name like '%?%'
		//select * from where title like'%?%'
//			String sql = "SELECT * FROM LONGRENT WHERE NAME LIKE '%?%' ORDER BY WRITE_DATE DESC";
		
		String sql = "SELECT * FROM LONGRENT ";
		//System.out.println("[SQL 1단계]" + sql);
	//	System.out.println("컨디션: " + condition + " keyword: " + keyword);
		try {
			if(keyword != null && !keyword.isEmpty()) {
			//	sql += "where" + condition.trim() + " like '%" || ? || '%' " + "order by write_date desc" ;
				sql += " where " + condition.trim()+ " like '%"+keyword.trim()+"%' order by write_date desc";
				
			//	System.out.println("sql = 처음부분**********************!" + sql);
			} else { //모든 레코드 검색 
				sql += "ORDER BY WRITE_DATE DESC";
			}
			//System.out.println("[SQL 2단계]" + sql);
			try (PreparedStatement pstmt = con.prepareStatement(sql); 
				ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<LongRent> list = new ArrayList<>();
					do {
						list.add(getLongRent(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch(Exception e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public List<LongRent> selectSearchPaging(String condition, String keyword, Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN,a.* FROM (SELECT * FROM longrent";
		try {
			if(keyword != null && !keyword.isEmpty()) {
				sql += " where " + condition.trim()+ " like '%"+keyword.trim()+"%' ORDER BY write_date desc) a) where rn between ? and ? order by rn ";
				System.out.println("키워드가 있을때 --> "+ sql);
				
			} else { //모든 레코드 검색 
				sql += " ORDER BY WRITE_DATE DESC) a ) WHERE rn BETWEEN ? AND ? ORDER BY rn";

				System.out.println("모든 레코드 일때 -------------------->"+ sql);

			}

			try (PreparedStatement pstmt = con.prepareStatement(sql)){
					pstmt.setInt(1, paging.getStart());
					pstmt.setInt(2, paging.getEnd());
					
				try(ResultSet rs = pstmt.executeQuery()) {
					if (rs.next()) {
					ArrayList<LongRent> list = new ArrayList<>();
					do {
						list.add(getLongRent(rs));
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
	public int countSearchLongRentByAll(String condition, String keyword) {
		String sql = "select count(*) from LONGRENT";
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
