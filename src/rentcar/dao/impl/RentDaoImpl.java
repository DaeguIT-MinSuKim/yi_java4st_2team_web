package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
		k.setName(rs.getString("NAME"));
		k.setFare(rs.getInt("FARE"));

		b.setCode(rs.getInt("BRAND_CODE"));
		b.setName(rs.getString("NAME"));
		b.setImage(rs.getString("IMAGE"));

		c.setNo(rs.getString("CAR_NO"));
		c.setName(rs.getString("CAR_NAME"));
		c.setKind(k);
		c.setBrand(b);
		c.setRemark(rs.getString("REMARK"));
		c.setIs_rent(rs.getString("IS_RENT"));
		c.setCounting(rs.getInt("COUNTING"));
		c.setImage(rs.getString("IMAGE"));

		i.setCode(rs.getInt("INS_CODE"));
		i.setName(rs.getString("NAME"));
		i.setFare(rs.getInt("FARE"));

		r.setRentNo(rs.getInt("RENT_NO"));
		r.setId(m);
		r.setCarNo(c);
		r.setInsCode(i);
		r.setRent_date(rs.getDate("RENT_DATE"));
		r.setReturn_date(rs.getDate("RETURN_DATE"));
		r.setIs_rent(rs.getString("IS_RENT"));
		r.setFare(rs.getLong("FARE"));
		r.setRemark(rs.getString("REMARK"));

		return r;
	}

	@Override
	public List<Rent> selectRentByAll() {
		String sql = "SELECT * FROM Rent r LEFT OUTER JOIN MEMBER m ON r.ID = m.ID JOIN INSURANCE i ON r.INS_CODE = i.INS_CODE JOIN car c ON r.CAR_NO = c.CAR_NO LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE";
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
		String sql = "SELECT * FROM car c LEFT OUTER join kind k ON c.KIND_CODE = k.KIND_CODE JOIN BRAND b ON c.BRAND_CODE = b.BRAND_CODE WHERE CAR_NO = ?";
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRent(Rent rent) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRent(Rent rent) {
		// TODO Auto-generated method stub
		return 0;
	}

}
