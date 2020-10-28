package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.OptBoxDao;
import rentcar.dto.Opt;
import rentcar.dto.Rent;
import rentcar.exception.CustomSQLException;

public class OptBoxDaoImpl implements OptBoxDao {
	private static final OptBoxDaoImpl instance = new OptBoxDaoImpl();
	private Connection con;

	public OptBoxDaoImpl() {
		super();
	}

	public static OptBoxDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public int insertOptByRent(int optCode, int rentNo) {
		String sql = "INSERT INTO OPT_BOX(OPT_CODE, RENT_NO) VALUES (?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, optCode);
			pstmt.setInt(2, rentNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteOptByRent(int rentNo) {
		String sql = "DELETE FROM OPT_BOX WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, rentNo);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Integer> selectOptByRent(int rentNo) {
		String sql = "SELECT OPT_CODE FROM OPT_BOX WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, rentNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					List<Integer> list = new ArrayList<>();
					do {
						list.add(rs.getInt("OPT_CODE"));
					} while (rs.next());
					return list;
				}
			}
		}  catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}
}
