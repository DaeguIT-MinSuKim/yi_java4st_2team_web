package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Opt;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OptDaoImplTest {
	private static OptDaoImpl dao = OptDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectOptByAll() {
		System.out.println("testSelectOptByAll");
		List<Opt> list = dao.selectOptByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}
	
	@Test
	public void test02SelectOptByNo() {
		System.out.println("testSelectOptByNo");
		Opt opt = dao.selectOptByNo(3);
		Assert.assertNotNull(opt);
		System.out.println(opt);
	}

	@Test
	public void test03InsertOpt() {
		System.out.println("testInsertOpt");
		Opt opt = new Opt(6, "몰라", 1000);
		System.out.println(opt);
		int res = dao.insertOpt(opt);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test04UpdateOpt() {
		System.out.println("testUpdateOpt");
		Opt opt = new Opt(6, "알아", 5000);
		System.out.println(opt);
		int res = dao.updateOpt(opt);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05DeleteOpt() {
		System.out.println("testDeleteOpt");
		Opt opt = new Opt(6);
		int res = dao.deleteOpt(opt);
		Assert.assertEquals(1, res);
	}
}
