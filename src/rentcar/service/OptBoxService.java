package rentcar.service;

import java.sql.Connection;

import rentcar.dao.OptBoxDao;
import rentcar.dao.impl.OptBoxDaoImpl;
import rentcar.dao.impl.OptDaoImpl;
import rentcar.ds.JndiDS;

public class OptBoxService {
	private static Connection con;
	private OptBoxDao dao;

	public OptBoxService() {
		con = JndiDS.getConnection();
		dao = OptBoxDaoImpl.getInstance();
		((OptBoxDaoImpl) dao).setCon(con);
	}
	
	//대여Box에 opt 추가
	public int insertOptByRent(int optCode, int rentNo) {
		return dao.insertOptByRent(optCode, rentNo);
	}
	
}
