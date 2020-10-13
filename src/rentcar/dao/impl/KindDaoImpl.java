package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.KindDao;
import rentcar.dto.Kind;
import rentcar.exception.CustomSQLException;
import sun.security.jca.GetInstance;
import sun.security.jca.GetInstance.Instance;

public class KindDaoImpl implements KindDao {
	private static final KindDaoImpl instance = new KindDaoImpl();
	private Connection con;

	public KindDaoImpl() {
		super();
	}

	public static KindDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	private Kind getKind(ResultSet rs) throws SQLException {
		Kind k = new Kind();
		k.setCode(rs.getInt("KIND_CODE"));
		k.setName(rs.getString("NAME"));
		k.setPrice(rs.getInt("PRICE"));
		return k;
	}

	@Override
	public List<Kind> selectKindByAll() {
		String sql = "SELECT * FROM KIND";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Kind> list = new ArrayList<Kind>();
				do {
					list.add(getKind(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public Kind selectKindByNo(int res) {
		String sql = "SELECT * FROM KIND WHERE KIND_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, res);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getKind(rs);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	@Override
	public int insertKind(Kind kind) {
		String sql = "INSERT INTO KIND VALUES (?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			pstmt.setString(2, kind.getName());
			pstmt.setInt(3, kind.getPrice());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateKind(Kind kind) {
		String sql = "UPDATE KIND SET NAME = ?, PRICE = ? WHERE KIND_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, kind.getName());
			pstmt.setInt(2, kind.getPrice());
			pstmt.setInt(3, kind.getCode());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteKind(Kind kind) {
		String sql = "DELETE FROM KIND WHERE KIND_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
