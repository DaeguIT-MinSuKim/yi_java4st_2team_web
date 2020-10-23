package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.OptDao;
import rentcar.dto.Opt;
import rentcar.exception.CustomSQLException;

public class OptDaoImpl implements OptDao {
	private static final OptDaoImpl instance = new OptDaoImpl();
	private Connection con;

	public OptDaoImpl() {
		super();
	}

	public static OptDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	private Opt getOpt(ResultSet rs) throws SQLException {
		Opt k = new Opt();
		k.setCode(rs.getInt("OPT_CODE"));
		k.setName(rs.getString("NAME"));
		k.setFare(rs.getInt("FARE"));
		return k;
	}

	@Override
	public List<Opt> selectOptByAll() {
		String sql = "SELECT * FROM OPTIONS ORDER BY OPT_CODE";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Opt> list = new ArrayList<Opt>();
				do {
					list.add(getOpt(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public Opt selectOptByNo(int res) {
		String sql = "SELECT * FROM OPTIONS WHERE OPT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, res);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getOpt(rs);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	@Override
	public int insertOpt(Opt kind) {
		String sql = "INSERT INTO OPTIONS VALUES (?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			pstmt.setString(2, kind.getName());
			pstmt.setInt(3, kind.getFare());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateOpt(Opt kind) {
		String sql = "UPDATE OPTIONS SET NAME = ?, FARE = ? WHERE OPT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, kind.getName());
			pstmt.setInt(2, kind.getFare());
			pstmt.setInt(3, kind.getCode());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteOpt(Opt kind) {
		String sql = "DELETE FROM OPTIONS WHERE OPT_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
