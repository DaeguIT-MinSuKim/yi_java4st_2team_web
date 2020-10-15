package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OptBoxDaoImplTest {
	private static OptBoxDaoImpl dao = OptBoxDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01InsertOptByRent() {
		System.out.println("testInsertOptByRent");
		int res = dao.insertOptByRent(1, 1);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test02DeleteOptByRent() {
		System.out.println("testDeleteOptByRent");
		int res = dao.deleteOptByRent(1);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test03SelectOptByRent() {
		System.out.println("testSelectOptByRent");
		List<Integer> list = dao.selectOptByRent(3);
		Assert.assertNotNull(list);
		System.out.println(list);
	}

}
