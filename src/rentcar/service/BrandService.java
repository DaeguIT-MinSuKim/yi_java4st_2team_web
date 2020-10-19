package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.BrandDao;
import rentcar.dao.impl.BrandDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Brand;

public class BrandService {
	private static Connection con;
	private BrandDao dao;

	public BrandService() {
		con = JndiDS.getConnection();
		dao = BrandDaoImpl.getInstance();
		((BrandDaoImpl) dao).setCon(con);
	}
	
	public List<Brand> BrandList(){
		return dao.selectBrandByAll();
	}
	
	public Brand BrandDetail(int no) {
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
}
