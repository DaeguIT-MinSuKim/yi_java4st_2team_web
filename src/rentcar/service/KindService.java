package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.KindDao;
import rentcar.dao.impl.KindDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Kind;
import rentcar.dto.Kind;
import rentcar.utils.Paging;
import rentcar.dto.Kind;

public class KindService {
	private static Connection con;
	private KindDao dao;

	public KindService() {
		con = JndiDS.getConnection();
		dao = KindDaoImpl.getInstance();
		((KindDaoImpl) dao).setCon(con);
	}

	public List<Kind> kindList() {
		return dao.selectKindByAll();
	}

	public Kind kindDetail(int no) {
		return dao.selectKindByNo(no);
	}

	public int insertKind(Kind k) {
		return dao.insertKind(k);
	}

	public int updateKind(Kind k) {
		return dao.updateKind(k);
	}

	public int deleteKind(Kind k) {
		return dao.deleteKind(k);
	}
	public int countKindByall() {
		return dao.countKindByAll();
	}
	
	public ArrayList<Kind> pagingEventByAll(Paging paging){
		return dao.pagingKindByAll(paging);
	}
	
	public int countSearchKindByAll(String condition, String keyword) {
		return dao.countSearchKindByAll(condition, keyword);
	}

	public ArrayList<Kind> searchKindList(String condition, String keyword, Paging paging){
		return dao.searchKindList(condition, keyword, paging);
	}
}
