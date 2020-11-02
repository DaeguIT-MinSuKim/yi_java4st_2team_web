package rentcar.service;

import java.sql.Connection;
import java.util.List;

import org.json.JSONArray;

import rentcar.dao.impl.RentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Rent;
import rentcar.utils.Paging;

public class RentService {
	private RentDaoImpl dao = RentDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();

	public RentService() {
		dao.setCon(con);
	}

	// 대여목록 불러오기
	public List<Rent> selectRentByAll() {
		return dao.selectRentByAll();
	}

	public Rent selectRentByDate(String id) {
		return dao.selectRentByDate(id);
	}

	public List<Rent> selectSearchAndPaging(String condition, String keyword, Paging paging) {
		return dao.selectSearchAndPaging(condition, keyword, paging);
	}

	public int countRentByAll() {
		return dao.countRentByAll();
	}

	public int insertRent(Rent rent) {
		return dao.insertRent(rent);
	}

	public List<Rent> pagingRentByAll(Paging paging) {
		return dao.pagingRentByAll(paging);
	}

	public int selectRecentByNo() {
		return dao.selectRecentByNo();
	}

	public Rent selectRecentByRent(String id, String carNo) {
		return dao.selectRecentByRent(id, carNo);
	}

	public List<Rent> selectRentById(String id) {
		return dao.selectRentById(id);
	}

	public Rent selectRentByNo(int res) {
		return dao.selectRentByNo(res);
	}

	public int deleteRent(int rentNo) {
		return dao.deleteRent(rentNo);
	}

	public JSONArray getCountMemberByAge() {
		return dao.getCountMemberByAge();
	}

	public JSONArray getCountCarByMonthly() {
		return dao.getCountCarByMonthly();
	}
	
	public JSONArray getCountCarByYearly() {
		return dao.getCountCarByYearly();
	}
}