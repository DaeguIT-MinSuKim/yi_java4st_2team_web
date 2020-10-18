package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Ins;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class InsDaoImplTest {
	private static InsDaoImpl dao = InsDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectInsByAll() {
		System.out.println("testSelectInsByAll");
		List<Ins> list = dao.selectInsByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}
	
	@Test
	public void test02SelectInsByNo() {
		System.out.println("testSelectInsByNo");
		Ins ins = dao.selectInsByNo(3);
		Assert.assertNotNull(ins);
		System.out.println(ins);
	}

	@Test
	public void test03InsertIns() {
		System.out.println("testInsertIns");
		Ins ins = new Ins(6, "몰라", 1000);
		System.out.println(ins);
		int res = dao.insertIns(ins);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test04UpdateIns() {
		System.out.println("testUpdateIns");
		Ins ins = new Ins(6, "알아", 5000);
		System.out.println(ins);
		int res = dao.updateIns(ins);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05DeleteIns() {
		System.out.println("testDeleteIns");
		Ins ins = new Ins(6);
		int res = dao.deleteIns(ins);
		Assert.assertEquals(1, res);
	}
}
