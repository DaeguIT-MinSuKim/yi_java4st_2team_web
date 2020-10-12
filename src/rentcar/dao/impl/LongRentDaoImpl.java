package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import org.apache.jasper.tagplugins.jstl.core.Catch;

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
		String sql = "INSERT INTO LONGRENT(NO, TITLE, CONTENTS,RENT_TERM, NAME, TEL, PWD, OPTIONS) " + 
				"VALUES(LONGRENT_NO_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, longrent.getTitle());
			pstmt.setString(2, longrent.getContents());
			pstmt.setString(3, longrent.getRentTerm());
			pstmt.setString(4, longrent.getName());
			pstmt.setString(5, longrent.getTel());
			pstmt.setString(6, longrent.getPwd());
			pstmt.setString(7, longrent.getOptions());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int updateLongRent(LongRent longrent) {
		String sql = "UPDATE LONGRENT SET TITLE = ?, contents = ?, RENT_TERM = ? , name= ? , tel =? , PWD = ?, OPTIONS = ? WHERE NO = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
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
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public LongRent checkPassword(int no, String pwd) {
		String sql = "SELECT NO, TITLE, CONTENTS, REP_YN, WRITE_DATE, RENT_TERM, NAME, TEL, PWD, OPTIONS FROM LONGRENT WHERE NO =? AND PWD = ? ";
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

}
