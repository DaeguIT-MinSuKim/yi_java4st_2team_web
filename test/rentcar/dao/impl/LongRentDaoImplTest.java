package rentcar.dao.impl;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import rentcar.ds.JdbcUtil;
import rentcar.dto.LongRent;

public class LongRentDaoImplTest {
	private static LongRentDaoImpl dao = LongRentDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println(con);
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void testListLongRent() {
		System.out.println("testSelectCarByAll");
		List<LongRent> list = dao.listLongRent("dong");
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void testGetLongRent() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertLongRent() {
		fail("Not yet implemented");
	}

}
