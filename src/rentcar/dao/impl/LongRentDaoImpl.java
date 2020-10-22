package rentcar.dao.impl;

import java.io.BufferedWriter;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import oracle.jdbc.OracleResultSet;
import rentcar.dao.LongRentDao;
import rentcar.dto.LongRent;
import rentcar.exception.CustomSQLException;

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

	@Override
	public ArrayList<LongRent> selectLongRentList() {
		String sql = "SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS, REP_CONTENT FROM LONGRENT ORDER BY NO DESC";
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
//	private static int VIEW_ROWS = 5; //페이지의 개수
//	private static int COUNTS = 5; //한 페이지에 나타낼 no의 개수
//	
//	@Override
//	public String pageNumber(int tpage, String name) {
//		String str = "";
//		
//		int total_pates
//		
//		return null;
//	}
//
//	@Override
//	public ArrayList<LongRent> listLongRent(int tpage, int no) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
