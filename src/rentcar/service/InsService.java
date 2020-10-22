package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.impl.InsDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Ins;

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
	public int deleteIns(Ins ins) {
		return dao.deleteIns(ins);
	}

}
