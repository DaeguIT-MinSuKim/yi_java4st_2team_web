package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.impl.InsDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Ins;
import rentcar.utils.Paging;

public class InsService {
	private InsDaoImpl dao = InsDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public InsService() {
		dao.setCon(con);
	}
	
	//보험리스트 불러오기
	public List<Ins> selectInsByAll() {
		return dao.selectInsByAll();
	}
	
	//Ins 불러오기
	public Ins selectInsByNo(int res) {
		return dao.selectInsByNo(res);
	}
	
	//Ins 추가하기
	public int insertIns(Ins ins) {
		return dao.insertIns(ins);
	}
	
	//Ins 수정하기
	public int updateIns(Ins ins) {
		return dao.updateIns(ins);
	}
	
	//Ins 삭제하기
	public int deleteIns(int code) {
		return dao.deleteIns(code);
	}
	
	
	//검색 + 페이징
	public List<Ins> selectSearhPaging(String condition, String keyword, Paging paging){
		return dao.selectSearhPaging(condition, keyword, paging);
	}
	
	public int countSearchInsByAll(String condition, String keyword) {
		return dao.countSearchInsByAll(condition, keyword);
	}
	
	//페이징
	public ArrayList<Ins> pagingInsByAll(Paging paging){
		return dao.pagingInsByAll(paging);
	}

	public int countInsByAll() {
		return dao.countInsByAll();
	}
	

}
