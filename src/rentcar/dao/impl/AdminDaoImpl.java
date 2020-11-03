package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rentcar.dao.AdminDao;
import rentcar.dto.Admin;

public class AdminDaoImpl implements AdminDao {

	private static final AdminDaoImpl instance = new AdminDaoImpl();
	private Connection con;

	public AdminDaoImpl() {
		super();
	}

	public static AdminDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public Admin selectAdminById(String id) {
		String sql = "SELECT * FROM ADMIN WHERE ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getAdmin(rs);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	private Admin getAdmin(ResultSet rs) throws SQLException {
		String id = rs.getString("ID");
		String pwd = rs.getString("PWD");
		return new Admin(id, pwd);
	}

}
