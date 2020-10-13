package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.CarDao;
import rentcar.dto.Car;
import rentcar.exception.CustomSQLException;

public class CarDaoImpl implements CarDao {
	private static final CarDaoImpl instance = new CarDaoImpl();
	private Connection con;

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
		c.setNo(rs.getString("CAR_NO"));
		c.setName(rs.getString("CAR_NAME"));
		c.setKind(rs.getInt("KIND_CODE"));
		c.setBrand(rs.getInt("BRAND_CODE"));
		c.setRemark(rs.getString("REMARK"));
		c.setIs_rent(rs.getString("IS_RENT"));
		c.setCounting(rs.getInt("COUNTING"));
		c.setImage(rs.getString("IMAGE"));
		return c;
	}

	@Override
	public List<Car> selectCarByAll() {
		String sql = "SELECT * FROM CAR";
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
		String sql = "SELECT * FROM CAR WHERE IS_RENT = 'Y'";
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
		String sql = "SELECT * FROM CAR WHERE ";
		switch (res) {
		case 1:
			sql += "CAR_NO LIKE '%' || ? || '%'";
			break;
		case 2:
			sql += "NAME LIKE '%' || ? || '%'";
			break;
		case 3:
			sql += "KIND LIKE '%' || ? || '%'";
			break;
		default:
			System.out.println("해당사항 예외를 선택하셨습니다");
			System.out.println("CarDaoImpl.78line");
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
		String sql = "SELECT * FROM CAR WHERE CAR_NO = ?";
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
	public int insertCar(Car car) {
		String sql = "INSERT INTO CAR VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, car.getNo());
			pstmt.setString(2, car.getName());
			pstmt.setInt(3, car.getKind());
			pstmt.setInt(4, car.getBrand());
			pstmt.setString(5, car.getRemark());
			pstmt.setString(6, car.getIs_rent());
			pstmt.setInt(7, car.getCounting());
			pstmt.setString(8, car.getImage());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateCar(Car car) {
		String sql = "UPDATE CAR SET CAR_NAME = ? , KIND_CODE = ? , BRAND_CODE = ? , REMARK = ? , IS_RENT = ? , COUNTING = ? , IMAGE = ? WHERE CAR_NO = ? ";

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(8, car.getNo());
			pstmt.setString(1, car.getName());
			pstmt.setInt(2, car.getKind());
			pstmt.setInt(3, car.getBrand());
			pstmt.setString(4, car.getRemark());
			pstmt.setString(5, car.getIs_rent());
			pstmt.setInt(6, car.getCounting());
			pstmt.setString(7, car.getImage());

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

}
