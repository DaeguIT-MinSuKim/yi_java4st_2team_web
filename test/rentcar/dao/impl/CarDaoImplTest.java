package rentcar.dao.impl;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Car;

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
		Car c = new Car("39호1234", "비와이", 1, 2, "얍얍얍", "Y", 10000, "주님만이");
		int res = dao.insertCar(c);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05UpdateCar() {
		System.out.println("testUpdateCar");
		Car c = new Car("39호1234", "비가와", 1, 2, "얍얍얍", "Y", 10000, "주님만이");
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

}
