package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.KindDao;
import rentcar.dto.Kind;
import rentcar.dto.Kind;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

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
		k.setName(rs.getString("KIND_NAME"));
		k.setFare(rs.getInt("KIND_FARE"));
		return k;
	}

	@Override
	public List<Kind> selectKindByAll() {
		String sql = "SELECT * FROM KIND ORDER BY KIND_CODE";
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
		System.out.println("kind > " + kind);
		String sql = "INSERT INTO KIND VALUES (KIND_CODE_SEQ.NEXTVAL,?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, kind.getName());
			pstmt.setInt(2, kind.getFare());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateKind(Kind kind) {
		String sql = "UPDATE KIND SET KIND_NAME = ?, KIND_FARE = ? WHERE KIND_CODE = ?";
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
	public int deleteKind(Kind kind) {
		deleteKindByCar(kind);
		// 차종 삭제
		String sql = "DELETE FROM KIND WHERE KIND_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 차량과 연관된 차종 삭제
	private int deleteKindByCar(Kind kind) {
		String sql = "UPDATE CAR SET KIND_CODE = NULL WHERE KIND_CODE = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, kind.getCode());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int countKindByAll() {
		String sql = "select count(*) from KIND";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Kind> pagingKindByAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM KIND ORDER BY KIND_CODE) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Kind> list = new ArrayList<Kind>();
					do {
						list.add(getKind(rs));
					} while (rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int countSearchKindByAll(String condition, String keyword) {
		String sql = "select count(*) from KIND ";
		try {
			if (keyword != null && !keyword.isEmpty()) {
				sql += " WHERE KIND_NAME LIKE '%" + keyword.trim() + "%'";
			}
			try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public ArrayList<Kind> searchKindList(String condition, String keyword, Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM KIND ";
		if (keyword != null && !keyword.isEmpty()) {
			sql += " WHERE KIND_NAME LIKE '%" + keyword.trim() + "%' ";
		}
		sql += "ORDER BY KIND_CODE) a) WHERE RN BETWEEN ? AND ?";
		try {
			System.out.println("sql > " + sql);
			try (PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setInt(1, paging.getStart());
				pstmt.setInt(2, paging.getEnd());
				try (ResultSet rs = pstmt.executeQuery()) {
					if (rs.next()) {
						ArrayList<Kind> list = new ArrayList<Kind>();
						do {
							list.add(getKind(rs));
						} while (rs.next());
						return list;
					}
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}
}
