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
import rentcarTest.conn.JdbcUtil;

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
		c.setCarNo(rs.getString("CAR_NO"));
		c.setCarName(rs.getString("NAME"));
		c.setKind(rs.getString("KIND"));
		c.setPrice(rs.getInt("PRICE"));
		c.setRemark(rs.getString("REMARK"));
		return c;
	}

	@Override
	public List<Car> selectCarByAll() {
		String sql = "SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car";
		try (PreparedStatement pstmt = con.prepareStatement(sql); 
				ResultSet rs = pstmt.executeQuery()) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Car selectCarByFind(int res, String query) {
		String sql = "SELECT CAR_NO,NAME,KIND,PRICE,REMARK FROM car WHERE ";
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
			return null;
		}
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, query);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
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
		String sql = "INSERT INTO CAR VALUES(?, ?, ?, ?, ?)";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, car.getCarNo());
			pstmt.setString(2, car.getCarName());
			pstmt.setString(3, car.getKind());
			pstmt.setInt(4, car.getPrice());
			pstmt.setString(5, car.getRemark());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateCar(Car car) {
		String sql = "UPDATE CAR SET CAR_NAME = ? , CAR_KIND = ? , FUEL = ? , DISTANCE = ? , FARE = ? , SALE = ? , CAR_REMARK = ? WHERE CAR_NO = ?  ";

		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, car.getCarName());
			pstmt.setString(2, car.getCarKind().getCar_kind());
			pstmt.setString(3, car.getFuel());
			pstmt.setInt(4, car.getDistance());
			pstmt.setInt(5, car.getFare());
			pstmt.setInt(6, car.getSale());
			pstmt.setString(7, car.getCarRemark());
			pstmt.setString(8, car.getCarNo());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int deleteCar(Car car) {
		String sql = "DELETE FROM CAR WHERE CAR_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, car.getCarNo());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Car> selectCarByName(Car car) {
		// TODO Auto-generated method stub
		return null;
	}

}
