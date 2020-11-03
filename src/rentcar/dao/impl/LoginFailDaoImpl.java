package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rentcar.dao.LoginFailDao;

public class LoginFailDaoImpl implements LoginFailDao {

	private static final LoginFailDaoImpl instance = new LoginFailDaoImpl();
	private Connection con;

	public LoginFailDaoImpl() {
		super();
	}

	public static LoginFailDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public int loginLockStatus(String id) {
		ResultSet rs = null;
		String sql = "SELECT COUNT(1) CNT\r\n"
				+ "  FROM MEMBER\r\n"
				+ " WHERE ID = ?\r\n"
				+ "   AND IS_LOCK = 'Y'\r\n"
				+ "   AND LOGIN_DATE + ( 1 / 24 / 60 ) * LOCK_COUNTING > SYSDATE";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("CNT");
			}
			return 0;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int loginFailCount(String id) {
		String sql = "UPDATE MEMBER\r\n"
				+ "   SET TRY_COUNTING = TRY_COUNTING + 1, LOGIN_DATE = SYSDATE\r\n"
				+ " WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1,id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int resetLoginFailCount(String id) {
		String sql = "UPDATE MEMBER\r\n"
				+ "   SET TRY_COUNTING = 0, IS_LOCK = 'N'\r\n"
				+ " WHERE ID = ?\r\n"
				+ "   AND IS_LOCK = 'Y'";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int loginLock(String id) {
		String sql = "UPDATE MEMBER\r\n"
				+ "   SET IS_LOCK = 'Y', LOCK_COUNTING = LOCK_COUNTING + 1\r\n"
				+ " WHERE ID = ?\r\n"
				+ "   AND TRY_COUNTING > 2";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	public int resetLockCount(String id) {
		String sql = "UPDATE MEMBER\r\n"
				+ "   SET LOCK_COUNTING = 0\r\n"
				+ " WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
