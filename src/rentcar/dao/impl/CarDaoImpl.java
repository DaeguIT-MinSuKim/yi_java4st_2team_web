package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.CarDao;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Event;
import rentcar.dto.Kind;
import rentcar.exception.CustomSQLException;
import rentcar.utils.Paging;

public class CarDaoImpl implements CarDao {
	private static final CarDaoImpl instance = new CarDaoImpl();
	private Connection con;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHH");

	public CarDaoImpl() {
		super();
	}

	public static CarDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	private Car getCar(ResultSet rs) throws SQLException {
		Car c = new Car();
		Kind k = new Kind();
		Brand b = new Brand();
		try {
			k.setCode(rs.getInt("KIND_CODE"));
			k.setName(rs.getString("KIND_NAME"));
			k.setFare(rs.getInt("KIND_FARE"));
		} catch (NullPointerException e) {
			System.out.println("차종이 비었습니다");
		}
		try {
			b.setCode(rs.getInt("BRAND_CODE"));
			b.setName(rs.getString("BRAND_NAME"));
			b.setImage(rs.getString("BRAND_IMAGE"));
		} catch (NullPointerException e) {
			System.out.println("차종이 비었습니다");
		}

		c.setNo(rs.getString("CAR_NO"));
		c.setName(rs.getString("CAR_NAME"));
		c.setKind(k);
		c.setBrand(b);
		c.setRemark(rs.getString("REMARK"));
		c.setIs_rent(rs.getString("IS_RENTCAR"));
		c.setCounting(rs.getInt("CAR_COUNT"));
		c.setImage(rs.getString("CAR_IMAGE"));
		return c;
	}

	@Override
	public List<Car> selectCarByAll() {
		String sql = "SELECT *"
				+ " FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Car> list = new ArrayList<Car>();
				do {
					list.add(getCar(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public List<Car> selectCarByRent() {
		String sql = "SELECT * "
				+ " FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE "
				+ "WHERE IS_RENTCAR = 'Y'";
		try (PreparedStatement pstmt = con.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Car> list = new ArrayList<Car>();
				do {
					list.add(getCar(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public List<Car> selectCarByFind(int res, String query) {
		String sql = "SELECT * "
				+ " FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE "
				+ " WHERE ";
		switch (res) {
		case 1:
			sql += "CAR_NO LIKE '%' || ? || '%'";
			break;
		case 2:
			sql += "NAME LIKE '%' || ? || '%'";
			break;
		case 3:
			sql += "KIND_NAME LIKE '%' || ? || '%'";
			break;
		case 4:
			sql += "BRAND_NAME LIKE '%' || ? || '%'";
			break;
		case 5:
			sql += "IS_RENTCAR = ?";
			break;
		default:
			System.out.println("CarDaoImpl.selectCarByFind ERROR");
			return null;
		}
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, query);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					List<Car> list = new ArrayList<Car>();
					do {
						list.add(getCar(rs));
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
	public Car selectCarByNo(String no) {
		String sql = "SELECT * "
				+ " FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE "
				+ " WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, no);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getCar(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public List<Car> selectRentByCar(LocalDateTime rentDate) {
		String sql = "SELECT * "
				+ "  FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE "
				+ " WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO " + "  FROM rent r "
				+ " WHERE NOT(TO_DATE(RENT_DATE) > TO_DATE(?,'YYYYMMDDHH24') OR TO_DATE(RETURN_DATE) < TO_DATE(?,'YYYYMMDDHH24')))";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, rentDate.format(formatter));
			pstmt.setString(2, rentDate.format(formatter));
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					List<Car> list = new ArrayList<Car>();
					do {
						list.add(getCar(rs));
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
	public List<Car> selectRentByCar(LocalDateTime rentDate, LocalDateTime returnDate) {
		String sql = "SELECT * "
				+ "  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE"
				+ " WHERE CAR_NO NOT IN (SELECT DISTINCT CAR_NO " + "  FROM rent r "
				+ " WHERE (TO_DATE(RENT_DATE) > TO_DATE(?,'YYYYMMDDHH24') AND TO_DATE(RENT_DATE) < TO_DATE(?,'YYYYMMDDHH24')) "
				+ "	OR (TO_DATE(RETURN_DATE) > TO_DATE(?,'YYYYMMDDHH24') AND TO_DATE(RETURN_DATE) < TO_DATE(?,'YYYYMMDDHH24')))";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, rentDate.format(formatter));
			pstmt.setString(2, returnDate.format(formatter));
			pstmt.setString(3, rentDate.format(formatter));
			pstmt.setString(4, returnDate.format(formatter));
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					List<Car> list = new ArrayList<Car>();
					do {
						list.add(getCar(rs));
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
	public Car selectRentByNo(LocalDateTime rentDate, LocalDateTime returnDate, String no) {
		String sql = "SELECT * " + 
				"  FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE" + 
				" WHERE CAR_NO = ? AND CAR_NO IN (SELECT DISTINCT CAR_NO " + 
				"  FROM rent r " + 
				" WHERE (TO_DATE(RENT_DATE) > TO_DATE(?,'YYYYMMDDHH24') AND TO_DATE(RENT_DATE) < TO_DATE(?,'YYYYMMDDHH24')) " + 
				"	OR (TO_DATE(RETURN_DATE) > TO_DATE(?,'YYYYMMDDHH24') AND TO_DATE(RETURN_DATE) < TO_DATE(?,'YYYYMMDDHH24')))";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, no);
			pstmt.setString(2, rentDate.format(formatter));
			pstmt.setString(3, returnDate.format(formatter));
			pstmt.setString(4, rentDate.format(formatter));
			pstmt.setString(5, returnDate.format(formatter));
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getCar(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int insertCar(Car car) {
		String sql = "INSERT INTO CAR VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, car.getNo());
			pstmt.setString(2, car.getName());
			pstmt.setInt(3, car.getKind().getCode());
			pstmt.setInt(4, car.getBrand().getCode());
			pstmt.setString(5, car.getRemark());
			pstmt.setString(6, "Y");
			pstmt.setInt(7, 0);
			pstmt.setString(8, car.getImage());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateCar(Car car) {
		String sql = "UPDATE CAR SET CAR_NAME = ? , KIND_CODE = ? , BRAND_CODE = ? , REMARK = ? , CAR_IMAGE = ? WHERE CAR_NO = ?  ";

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, car.getName());
			pstmt.setInt(2, car.getKind().getCode());
			pstmt.setInt(3, car.getBrand().getCode());
			pstmt.setString(4, car.getRemark());
			pstmt.setString(5, car.getImage());
			pstmt.setString(6, car.getNo());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteCar(Car car) {
		String sql = "DELETE FROM CAR WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, car.getNo());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public LocalDateTime rentLastDate(Car car) {
		String sql = "SELECT min(return_date) FROM RENT  WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, car.getNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getTimestamp("RETURN_DATE").toLocalDateTime();
				}
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public boolean isCar(String no) {
		String sql = "SELECT * FROM CAR WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, no);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return false;
				}
				return true;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	// 페이징
		@Override
		public int countCarByAll() {
			String sql = "select count(*) from CAR";
			try(PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				throw new CustomSQLException(e);
			}
			return 0;
		}

		@Override
		public ArrayList<Car> pagingEventAyAll(Paging paging) {
			String sql = "SELECT * FROM (SELECT rownum RN, a.* FROM (SELECT * FROM CAR c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY c.KIND_CODE) a) WHERE RN BETWEEN ? AND ? ORDER BY RN";
			try (PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, paging.getStart());
				pstmt.setInt(2, paging.getEnd());
				try (ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						ArrayList<Car> list = new ArrayList<Car>();
						do {
							list.add(getCar(rs));
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
	public List<Car> selectCarByRentCount() {
		String sql = "SELECT * FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE LEFT OUTER JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE ORDER BY CAR_COUNT DESC";
		try (PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				List<Car> list = new ArrayList<Car>();
				do {
					list.add(getCar(rs));
				} while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return null;
	}
}
