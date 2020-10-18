package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.KindDao;
import rentcar.dao.impl.KindDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Kind;

public class KindService {
	private static Connection con;
	private KindDao dao;

	public KindService() {
		con = JndiDS.getConnection();
		dao = KindDaoImpl.getInstance();
		((KindDaoImpl) dao).setCon(con);
	}
	
	public List<Kind> selectKindByAll(){
		return dao.selectKindByAll();
	}
}
