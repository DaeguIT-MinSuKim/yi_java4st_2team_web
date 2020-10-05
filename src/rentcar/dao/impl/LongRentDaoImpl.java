package rentcar.dao.impl;

import java.sql.Connection;
import java.util.ArrayList;

import rentcar.dao.LongRentDao;
import rentcar.dto.LongRent;

public class LongRentDaoImpl implements LongRentDao {

	private static final LongRentDaoImpl instance = new LongRentDaoImpl();
	
	private Connection con;

	public LongRentDaoImpl() {
	}

	public static LongRentDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public ArrayList<LongRent> listLongRent(String id) {
		String spl="";
		return null;
	}

	@Override
	public LongRent getLongRent(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertLongRent(LongRent longrent) {
		// TODO Auto-generated method stub
		return 0;
	}

}
