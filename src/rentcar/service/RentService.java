package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.impl.RentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.LongRent;
import rentcar.dto.Rent;
import rentcar.utils.Paging;

public class RentService {
	private RentDaoImpl dao = RentDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();
	
	public RentService() {
		dao.setCon(con);
	}
	
	//대여목록 불러오기
	public List<Rent> selectRentByAll(){
		return dao.selectRentByAll();
	}

	public Rent selectRentByDate(String id){
		return dao.selectRentByDate(id);
	}
	
	public List<Rent> selectSearchAndPaging(String condition, String keyword, Paging paging){
		return dao.selectSearchAndPaging(condition, keyword, paging);
	}
	
	public int countRentByAll(){
		return dao.countRentByAll();
	}
	
	public List<Rent> pagingRentByAll(Paging paging){
		return dao.pagingRentByAll(paging);
	}
}