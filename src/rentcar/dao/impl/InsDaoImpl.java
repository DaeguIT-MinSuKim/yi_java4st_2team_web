package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.InsDao;
import rentcar.dto.Ins;
import rentcar.exception.CustomSQLException;

public class InsDaoImpl implements InsDao {
	private static final InsDaoImpl instance = new InsDaoImpl();
	private Connection con;

	public InsDaoImpl() {
		super();
	}

	public static InsDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	private Ins getIns(ResultSet rs) throws SQLException {
		Ins i = new Ins();
		i.setCode(rs.getInt("INS_CODE"));
		i.setName(rs.getString("INS_NAME"));
		i.setFare(rs.getInt("INS_FARE"));
		return i;
	}

	@Override
	public List<Ins> selectInsByAll() {
		String sql = "SELECT * FROM INSURANCE ORDER BY INS_CODE";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Ins> list = new ArrayList<Ins>();
				do {
					list.add(getIns(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public Ins selectInsByNo(int res) {
		String sql = "SELECT * FROM INSURANCE WHERE INS_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, res);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getIns(rs);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	@Override
	public int insertIns(Ins ins) {
		String sql = "INSERT INTO INSURANCE VALUES (?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, ins.getCode());
			pstmt.setString(2, ins.getName());
			pstmt.setInt(3, ins.getFare());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateIns(Ins ins) {
		String sql = "UPDATE INSURANCE SET INS_NAME = ?, INS_FARE = ? WHERE INS_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, ins.getName());
			pstmt.setInt(2, ins.getFare());
			pstmt.setInt(3, ins.getCode());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteIns(Ins ins) {
		String sql = "DELETE FROM INSURANCE WHERE INS_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, ins.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
