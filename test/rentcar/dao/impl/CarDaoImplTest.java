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
	public void testSelectCarByAll() {
		System.out.println("testSelectCarByAll");
		List<Car> list = dao.selectCarByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void testSelectCarByFind() {
		System.out.println("testSelectCarByFind");
		Car c = dao.selectCarByFind(1, "허");
		Assert.assertNotNull(c);
		System.out.println(c);
	}

	@Test
	public void testSelectCarByRent() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertCar() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateCar() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteCar() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectCarByName() {
		fail("Not yet implemented");
	}

}
