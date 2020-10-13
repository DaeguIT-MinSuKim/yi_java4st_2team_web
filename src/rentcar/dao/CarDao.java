package rentcar.dao;

import java.util.List;

import rentcar.dto.Car;

public interface CarDao {

	// 차량리스트 불러오기
	List<Car> selectCarByAll();

	// 렌트중인 차량정보 불러오기
	List<Car> selectCarByRent();

	// 차량 검색하기
	List<Car> selectCarByFind(int res, String query);
	
	// 차량정보 불러오기
	Car selectCarByNo(String no);

	// 차량 추가하기
	int insertCar(Car car);

	// 차량 수정하기
	int updateCar(Car car);

	// 차량 삭제하기?
	int deleteCar(Car car);
}
