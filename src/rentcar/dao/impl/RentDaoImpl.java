package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;

import rentcar.dao.RentDao;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Ins;
import rentcar.dto.Kind;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class RentDaoImpl implements RentDao {
	private static final RentDaoImpl instance = new RentDaoImpl();
	private Connection con;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

	public RentDaoImpl() {
	}

	public static RentDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	private Rent getRent(ResultSet rs) throws SQLException {
		Rent r = new Rent();
		Member m = new Member();
		Car c = new Car();
		Ins i = new Ins();
		Kind k = new Kind();
		Brand b = new Brand();

		m.setId(rs.getString("ID"));
		m.setPwd(rs.getString("PWD"));
		m.setName(rs.getString("NAME"));
		m.setTel(rs.getString("TEL"));
		m.setLi_class(rs.getString("Li_class"));
		m.setLi_number(rs.getString("Li_number"));
		m.setEmail(rs.getString("EMAIL"));
		m.setAddress(rs.getString("ADDRESS"));
		m.setIs_black(rs.getString("IS_BLACK"));
		m.setCounting(rs.getInt("COUNTING"));

		k.setCode(rs.getInt("KIND_CODE"));
		k.setName(rs.getString("KIND_NAME"));
		k.setFare(rs.getInt("KIND_FARE"));

		b.setCode(rs.getInt("BRAND_CODE"));
		b.setName(rs.getString("BRAND_NAME"));
		b.setImage(rs.getString("BRAND_IMAGE"));

		c.setNo(rs.getString("CAR_NO"));
		c.setName(rs.getString("CAR_NAME"));
		c.setKind(k);
		c.setBrand(b);
		c.setRemark(rs.getString("REMARK"));
		c.setIs_rent(rs.getString("IS_RENTCAR"));
		c.setCounting(rs.getInt("CAR_COUNT"));
		c.setImage(rs.getString("CAR_IMAGE"));

		i.setCode(rs.getInt("INS_CODE"));
		i.setName(rs.getString("INS_NAME"));
		i.setFare(rs.getInt("INS_FARE"));

		r.setRentNo(rs.getInt("RENT_NO"));
		r.setId(m);
		r.setCarNo(c);
		r.setInsCode(i);
		r.setRent_date(rs.getTimestamp("RENT_DATE").toLocalDateTime());
		r.setReturn_date(rs.getTimestamp("RETURN_DATE").toLocalDateTime());
		r.setIs_rent(rs.getString("IS_RENT"));
		r.setFare(rs.getLong("RENT_FARE"));
		r.setRemark(rs.getString("RENT_REMARK"));

		return r;
	}

	private Rent getRentNo(ResultSet rs) throws SQLException {
		Rent r = new Rent();
		r.setRentNo(rs.getInt("RENT_NO"));
		return r;
	}

	private Rent getMaxDateLimit(ResultSet rs) throws SQLException {
		Rent r = new Rent();
		r.setReturn_date(rs.getTimestamp("RETURN_DATE").toLocalDateTime());
		return r;
	}

	@Override
	public List<Rent> selectRentByAll() {
		String sql = "SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE"
				+ " JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY RENT_NO DESC";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Rent> list = new ArrayList<Rent>();
				do {
					list.add(getRent(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public Rent selectRentByNo(int res) {
		String sql = "SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE"
				+ " JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE"
				+ " WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, res);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getRent(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public List<Rent> selectRentById(String id) {
		String sql = "SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE"
				+ " JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE"
				+ " WHERE r.ID = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);

			try (ResultSet rs = pstmt.executeQuery()) {

				if (rs.next()) {
					ArrayList<Rent> list = new ArrayList<Rent>();
					do {
						list.add(getRent(rs));
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
	public Rent selectRentByDate(String id) {
		String sql = "SELECT min(return_date) AS RETURN_DATE FROM RENT WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMaxDateLimit(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		} catch (NullPointerException e) {
			return new Rent(0);
		}
		return null;
	}

	@Override
	public int insertRent(Rent rent) {
		String sql = "INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values(?, ?, ?, to_date(?,'YYYY-MM-DD HH24:MI:SS'), to_date(?,'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {

			int insCode = rent.getInsCode().getCode();

			pstmt.setString(1, rent.getId().getId());
			pstmt.setString(2, rent.getCarNo().getNo());
			pstmt.setInt(3, rent.getInsCode().getCode());
			pstmt.setString(4, rent.getRent_date().format(formatter));
			pstmt.setString(5, rent.getReturn_date().format(formatter));
			pstmt.setString(6, rent.getIs_rent());
			pstmt.setLong(7, rent.getFare());
			pstmt.setString(8, rent.getRemark());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateRent(Rent rent) {
		String sql = "UPDATE RENT SET ID = ?, CAR_NO = ?, INS_CODE = ?, RENT_DATE = to_date(?,'YYYY-MM-DD HH24:MI:SS'), RETURN_DATE = to_date(?,'YYYY-MM-DD HH24:MI:SS'), IS_RENT = ?, RENT_FARE = ?, RENT_REMARK = ? WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, rent.getId().getId());
			pstmt.setString(2, rent.getCarNo().getNo());
			pstmt.setInt(3, rent.getInsCode().getCode());
			pstmt.setString(4, rent.getRent_date().format(formatter));
			pstmt.setString(5, rent.getReturn_date().format(formatter));
			pstmt.setString(6, rent.getIs_rent());
			pstmt.setLong(7, rent.getFare());
			pstmt.setString(8, rent.getRemark());
			pstmt.setInt(9, rent.getRentNo());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteRent(int rentNo) {
		String sql = "DELETE FROM RENT WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, rentNo);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 검색 + 페이징
	@Override
	public List<Rent> selectSearchAndPaging(String condition, String keyword, Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE "
				+ "JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE";
		try {
			if (keyword != null && !keyword.isEmpty()) {
				if (condition.equals("car_name")) {
					sql += " WHERE c.";
				} else {
					sql += " WHERE r.";
				}
				sql += condition.trim() + " LIKE '%" + keyword.trim() + "%' ";
			}
			sql += " ) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";

			try (PreparedStatement pstmt = con.prepareStatement(sql)) {
				pstmt.setInt(1, paging.getStart());
				pstmt.setInt(2, paging.getEnd());
				try (ResultSet rs = pstmt.executeQuery()) {
					if (rs.next()) {
						ArrayList<Rent> list = new ArrayList<>();
						do {
							list.add(getRent(rs));
						} while (rs.next());
						return list;
					}
				}
			}
		} catch (Exception e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int countRentByAll() {
		String sql = "SELECT count(*) FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE "
				+ "JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE";
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
	public List<Rent> pagingRentByAll(Paging paging) {
		String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE "
				+ "JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, paging.getStart());
			pstmt.setInt(2, paging.getEnd());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					ArrayList<Rent> list = new ArrayList<Rent>();
					do {
						list.add(getRent(rs));
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
	public int selectRecentByNo() {
		String sql = "SELECT MAX(TO_NUMBER(RENT_NO)) AS RENT_NO FROM RENT";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public Rent selectRecentByRent(String id, String carNo) {
		String sql = "SELECT * FROM( SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE "
				+ "JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE "
				+ "WHERE M.ID = ? AND c.CAR_NO = ? ORDER BY TO_NUMBER(RENT_NO) DESC) WHERE ROWNUM = 1";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.setString(2, carNo);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return getRent(rs);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public JSONArray getCountMemberByAge() {
		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray();
		colNameArray.put("연령대");
		colNameArray.put("연령별 인원");
		jsonArray.put(colNameArray);
		
		String sql = "select y, count(*) as cnt from(SELECT	floor((to_DATE(sysdate) - TO_DATE(BIRTH)) / 3650) * 10 as y "
				+ "	FROM rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID) group BY y ORDER BY y";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				do {
					JSONArray rowArray = new JSONArray();
					rowArray.put(rs.getString("Y"));
					rowArray.put(rs.getInt("CNT"));

					jsonArray.put(rowArray);
				} while (rs.next());
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}

	@Override
	public JSONArray getCountCarByMonthly() {
		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray();
		colNameArray.put("월별");
		colNameArray.put("월별 대여횟수");
		jsonArray.put(colNameArray);
		String sql = "SELECT COUNT(*) AS COUNT, TO_CHAR(RENT_DATE, 'YYYY-MM') AS RENT_DATE FROM RENT " + 
				"GROUP BY TO_CHAR(RENT_DATE, 'YYYY-MM') ORDER BY RENT_DATE";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				do {
					JSONArray rowArray = new JSONArray();
					rowArray.put(rs.getString("RENT_DATE"));
					rowArray.put(rs.getInt("COUNT"));

					jsonArray.put(rowArray);
				} while (rs.next());
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}

	@Override
	public JSONArray getCountCarByYearly() {
		JSONArray jsonArray = new JSONArray();

		JSONArray colNameArray = new JSONArray();
		colNameArray.put("연도별");
		colNameArray.put("연도별 대여횟수");
		jsonArray.put(colNameArray);
		String sql = "SELECT TO_CHAR(RENT_DATE, 'YYYY') AS RENT_DATE, COUNT(*) AS COUNT " + 
				"	FROM RENT GROUP BY TO_CHAR(RENT_DATE, 'YYYY') ORDER BY RENT_DATE";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				do {
					JSONArray rowArray = new JSONArray();
					rowArray.put(rs.getString("RENT_DATE"));
					rowArray.put(rs.getInt("COUNT"));

					jsonArray.put(rowArray);
				} while (rs.next());
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return jsonArray;
	}

}
