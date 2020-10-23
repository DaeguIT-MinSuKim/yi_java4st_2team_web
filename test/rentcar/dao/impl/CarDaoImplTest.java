package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CarDaoImplTest {
	private static CarDaoImpl dao = CarDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectCarByAll() {
		System.out.println("testSelectCarByAll");
		List<Car> list = dao.selectCarByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test02SelectCarByFind() {
		System.out.println("testSelectCarByFind");
		List<Car> list = dao.selectCarByFind(1, "하");
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test03SelectCarByRent() {
		System.out.println("testSelectCarByRent");
		List<Car> list = dao.selectCarByRent();
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test04InsertCar() {
		System.out.println("testInsertCar");
		Car c = new Car("39호1234", "비와이", new Kind(1), new Brand(2), "얍얍얍", "Y", 10000, "주님만이");
		int res = dao.insertCar(c);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05UpdateCar() {
		System.out.println("testUpdateCar");
		Car c = new Car("39호1234", "비가와", new Kind(1), new Brand(2), "얍얍얍", "Y", 10000, "주님만이");
		int res = dao.updateCar(c);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test07DeleteCar() {
		System.out.println("testDeleteCar");
		Car c = new Car("39호1234");
		int res = dao.deleteCar(c);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test06SelectCarByNo() {
		System.out.println("testSelectCarByNo");
		Car c = dao.selectCarByNo("39호1234");
		Assert.assertNotNull(c);
		System.out.println(c);
	}

	@Test
	public void test08selectRentByCar() {
		System.out.println("test08selectRentByCar");
		LocalDateTime rent = LocalDateTime.of(2020, 10, 15, 0, 0);
		List<Car> list = dao.selectRentByCar(rent);
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test09selectRentByCar2() {
		System.out.println("test09selectRentByCar2");
		LocalDateTime rent = LocalDateTime.of(2020, 10, 20, 0, 0);
		
		LocalDateTime return_d = LocalDateTime.of(2020, 10, 25, 0, 0);
		
		List<Car> list = dao.selectRentByCar(rent, return_d);
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test10selectRentByNo() {
		System.out.println("test10selectRentByNo");
		LocalDateTime rent = LocalDateTime.of(2020, 10, 23, 0, 0);
		
		LocalDateTime return_d = LocalDateTime.of(2020, 10, 25, 0, 0);
		
		Car list = dao.selectRentByNo(rent, return_d, "11하5678");
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test11selectCarByRentCount() {
		System.out.println("test11selectCarByRentCount");
		List<Car> list = dao.selectCarByRentCount();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}
}
