package rentcar.service;

import java.sql.Connection;
import java.util.List;

import rentcar.dao.CarDao;
import rentcar.dao.impl.CarDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Car;

public class CarService {
	private static Connection con;
	private CarDao dao;

	public CarService() {
		con = JndiDS.getConnection();
		dao = CarDaoImpl.getInstance();
		((CarDaoImpl) dao).setCon(con);
	}
	
	public List<Car> selectCarByAll(){
		return dao.selectCarByAll();
	}
	
	public Car selectCarByNo(String no) {
		return dao.selectCarByNo(no);
	}
}
