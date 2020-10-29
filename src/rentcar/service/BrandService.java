package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import rentcar.dao.BrandDao;
import rentcar.dao.impl.BrandDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Brand;
import rentcar.dto.Brand;
import rentcar.utils.Paging;

public class BrandService {
	private static Connection con;
	private BrandDao dao;

	public BrandService() {
		con = JndiDS.getConnection();
		dao = BrandDaoImpl.getInstance();
		((BrandDaoImpl) dao).setCon(con);
	}
	
	public List<Brand> brandList(){
		return dao.selectBrandByAll();
	}
	
	public Brand brandDetail(int no) {
		return dao.selectBrandByNo(no);
	}
	
	public int insertBrand(Brand b) {
		return dao.insertBrand(b);
	}
	
	public int updateBrand(Brand b) {
		return dao.updateBrand(b);
	}
	
	public int deleteBrand(Brand b) {
		return dao.deleteBrand(b);
	}
	
	public int countBrandByall() {
		return dao.countBrandByAll();
	}
	
	public ArrayList<Brand> pagingEventByAll(Paging paging){
		return dao.pagingBrandByAll(paging);
	}
	
	public int countSearchBrandByAll(String condition, String keyword) {
		return dao.countSearchBrandByAll(condition, keyword);
	}

	public ArrayList<Brand> searchBrandList(String condition, String keyword, Paging paging){
		return dao.searchBrandList(condition, keyword, paging);
	}
}
