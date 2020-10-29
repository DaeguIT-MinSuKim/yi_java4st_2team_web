package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.OptBoxDao;
import rentcar.dao.impl.OptBoxDaoImpl;
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
	
	public List<Integer> selectOptByRent(int rentNo) {
		return dao.selectOptByRent(rentNo);
	}
}
