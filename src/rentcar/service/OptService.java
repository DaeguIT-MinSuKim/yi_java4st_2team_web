package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.OptDao;
import rentcar.dao.impl.OptDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Opt;
import rentcar.utils.Paging;

public class OptService {
	private static Connection con;
	private OptDao dao;

	public OptService() {
		con = JndiDS.getConnection();
		dao = OptDaoImpl.getInstance();
		((OptDaoImpl) dao).setCon(con);
	}
	
	//옵션리스트 불러오기
	public List<Opt> selectOptByAll(){
		return dao.selectOptByAll();
	}
	
	//Opt 불러오기
	public Opt selectOptByNo(int res) {
		return dao.selectOptByNo(res);
	}
	
	//Opt 추가하기
	public int insertOpt(Opt opt) {
		return dao.insertOpt(opt);
	}
	
	//Opt 수정하기
	public int updateOpt(Opt opt) {
		return dao.updateOpt(opt);
	}
	
	//Opt 삭제하기
	public int deleteOpt(Opt opt) {
		return dao.deleteOpt(opt);
	}

	
	public ArrayList<Opt> pagingOptByAll(Paging paging) {
		return dao.pagingOptByAll(paging);
	}
	
	public int countOptByAll() {
		return dao.countOptByAll();
	}
	
	
	public List<Opt> selectSearchPagingOpt(String condition, String keyword, Paging paging) {
		return dao.selectSearchPagingOpt(condition, keyword, paging);
	}
}
