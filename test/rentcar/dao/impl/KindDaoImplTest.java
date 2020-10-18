package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Kind;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class KindDaoImplTest {
	private static KindDaoImpl dao = KindDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectKindByAll() {
		System.out.println("testSelectKindByAll");
		List<Kind> list = dao.selectKindByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}
	
	@Test
	public void test02SelectKindByNo() {
		System.out.println("testSelectKindByNo");
		Kind k = dao.selectKindByNo(5);
		Assert.assertNotNull(k);
		System.out.println(k);
	}

	@Test
	public void test03InsertKind() {
		System.out.println("testInsertKind");
		Kind k = new Kind(6, "몰라", 1000);
		System.out.println(k);
		int res = dao.insertKind(k);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test04UpdateKind() {
		System.out.println("testUpdateKind");
		Kind k = new Kind(6, "알아", 5000);
		System.out.println(k);
		int res = dao.updateKind(k);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05DeleteKind() {
		System.out.println("testDeleteKind");
		Kind k = new Kind(6);
		int res = dao.deleteKind(k);
		Assert.assertEquals(1, res);
	}
}
