package rentcar.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.ds.JdbcUtil;
import rentcar.dto.Brand;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BrandDaoImplTest {
	private static BrandDaoImpl dao = BrandDaoImpl.getInstance();
	private static Connection con = JdbcUtil.getConnection();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao.setCon(con);
		System.out.println(con);
	}

	@Test
	public void test01SelectBrandByAll() {
		System.out.println("test01SelectBrandByAll");
		List<Brand> list = dao.selectBrandByAll();
		Assert.assertNotNull(list);
		System.out.println(list);
	}

	@Test
	public void test02SelectBrandByNo() {
		System.out.println("test02SelectBrandByNo");
		Brand b = dao.selectBrandByNo(3);
		Assert.assertNotNull(b);
		System.out.println(b);
	}

	@Test
	public void test03InsertBrand() {
		System.out.println("test03InsertBrand");
		Brand b = new Brand(4, "몰라", "");
		System.out.println(b);
		int res = dao.insertBrand(b);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test04UpdateBrand() {
		System.out.println("test04UpdateBrand");
		Brand b = new Brand(4, "알아", "");
		System.out.println(b);
		int res = dao.updateBrand(b);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05DeleteBrand() {
		System.out.println("test05DeleteBrand");
		Brand b = new Brand(4);
		int res = dao.deleteBrand(b);
		Assert.assertEquals(1, res);
	}

}
