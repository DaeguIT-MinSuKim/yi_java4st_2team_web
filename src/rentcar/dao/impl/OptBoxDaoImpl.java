package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.OptBoxDao;
import rentcar.dto.Opt;

public class OptBoxDaoImpl implements OptBoxDao {
	private static final OptBoxDaoImpl instance = new OptBoxDaoImpl();
	private Connection con;

	public OptBoxDaoImpl() {
		super();
	}

	public static OptBoxDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public List<Opt> selectOptByAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOptInBox() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOptInBox() {
		// TODO Auto-generated method stub
		return 0;
	}

}
