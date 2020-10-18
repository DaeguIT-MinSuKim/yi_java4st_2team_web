package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import rentcar.dao.RentDao;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Ins;
import rentcar.dto.Kind;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.exception.CustomSQLException;

public class RentDaoImpl implements RentDao {
	private static final RentDaoImpl instance = new RentDaoImpl();
	private Connection con;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-DD HH24:MI:SS");
	
	public RentDaoImpl() {
		super();
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
		m.setLicense(rs.getString("LICENSE"));
		m.setEmail(rs.getString("EMAIL"));
		m.setAddress(rs.getString("ADDRESS"));
		m.setIs_black(rs.getString("IS_BLACK"));
		m.setRemark(rs.getString("REMARK"));
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

	@Override
	public List<Rent> selectRentByAll() {
		String sql = "SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE"
				+ " JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE";
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
	public int insertRent(Rent rent) {
		String sql = "INSERT INTO RENT(ID, CAR_NO, INS_CODE, RENT_DATE, RETURN_DATE, IS_RENT, RENT_FARE, RENT_REMARK) values(?, ?, ?, to_date(?,'YYYY-MM-DD HH24:MI:SS'), to_date(?,'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?)";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
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
	public int deleteRent(Rent rent) {
		String sql = "DELETE FROM RENT WHERE RENT_NO = ?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, rent.getRentNo());
			return pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
