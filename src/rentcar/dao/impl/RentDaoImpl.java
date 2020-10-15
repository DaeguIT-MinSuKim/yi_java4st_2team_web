package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import rentcar.dao.RentDao;
import rentcar.dto.Rent;

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
	
	private Rent getRent(ResultSet rs) throws SQLException{
		Rent r = new Rent();
		r.setRentNo(rs.getInt("RENT_NO"));
		r.setId(rs.getString("ID"));
		r.setCarNo(rs.getString("CAR_NO"));
		r.setInsCode(rs.getInt("INS_CODE"));
		r.setRent_date(rs.getDate("RENT_DATE"));
		r.setReturn_date(rs.getDate("RETURN_DATE"));
		r.setIs_rent(rs.getString("IS_RENT"));
		r.setFare(rs.getLong("FARE"));
		r.setRemark(rs.getString("REMARK"));
		
		return r;
	}
	
	@Override
	public List<Rent> selectRentByAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Rent selectRentByNo(int res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectRentByCar(Date rentDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectRentByCar(Date rentdate, Date returnDate) {
		// TODO Auto-generated method stub
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
