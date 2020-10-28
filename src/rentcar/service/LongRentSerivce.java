package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Condition;

import org.json.JSONArray;

import rentcar.dao.impl.LongRentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.dto.LongRent;
import rentcar.utils.Paging;

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
	
	//관리자
	public List<LongRent> getAdminList(){
		return dao.adminList();
	}
	
	public int adminUpdateLongRent(String rep, int no) {
		return dao.adminUpdateLongRent(rep, no);
	}
	
	public int adminReplyDelete(int no) {
		return dao.adminReplyDeleteLongRent(no);
	}
	
	// 페이징
	public int countLongRentByAll() {
		return dao.countLongRentByAll();
	}
	
	public int countSearchLongRentByAll(String condition, String keyword) {
		return dao.countSearchLongRentByAll(condition, keyword);
	}

	public ArrayList<LongRent> pagingLongRentByAll(Paging paging) {
		return dao.pagingLongRentByAll(paging);
	}
	
	public List<LongRent> searchLongRentList(String condition, String keyword){
		return dao.selectSearch(condition, keyword);
	}
	public List<LongRent> searchLongRentPagingList(String condition, String keyword, Paging paging){
		return dao.selectSearchPaging(condition, keyword, paging);
	}
	
	public JSONArray getCountLongRent() {
		return dao.getCountLongRent();
	}
	
	public ArrayList<LongRent> selectLongRentChartList() {
		return dao.selectLongRentChartList();
	}
	
	
	
	
}
