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
	
	public List<Car> carList(){
		return dao.selectCarByAll();
	}
	
	public Car carDetail(String no) {
		return dao.selectCarByNo(no);
	}
	
	public int insertCar(Car c) {
		return dao.insertCar(c);
	}
	
	public int updateCar(Car c) {
		return dao.updateCar(c);
	}
	
	public int deleteCar(Car c) {
		return dao.deleteCar(c);
	}
}
