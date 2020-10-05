package rentcar.dao.impl;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.BeforeClass;
import org.junit.Test;

import rentcar.ds.JdbcUtil;

public class LongRentDaoImplTest2 {
	private static LongRentDaoImpl dao = LongRentDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println(con);
		dao.setCon(con);
	}

	@Test
	public void testListLongRent() {
	}

}
