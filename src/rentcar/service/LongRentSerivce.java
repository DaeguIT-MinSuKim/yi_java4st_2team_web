package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.impl.LongRentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.LongRent;

public class LongRentSerivce {
	private LongRentDaoImpl dao = LongRentDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public LongRentSerivce() {
		dao.setCon(con);
	}
	
	public List<LongRent> getLongRentList(){
		return dao.selectLongRentList();
	}
	
	public LongRent getLongRent(int no) {
		return dao.getLongRentList(no);
	}
	
	public int addLongRent(LongRent longrent) {
		return dao.insertLongRent(longrent);
	}

	public int updateLongRent(LongRent longrent) {
		return dao.updateLongRent(longrent);
	}
	
	public int deleteLongRent(int no) {
		return dao.deleteLongRent(no);
	}
	
	public LongRent checkPwd(int no, String pwd) {
		return dao.checkPassword(no, pwd);
	}
	
}
