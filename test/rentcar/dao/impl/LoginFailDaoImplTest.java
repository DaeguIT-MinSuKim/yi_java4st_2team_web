package rentcar.dao.impl;

import java.sql.Connection;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.dao.LoginFailDao;
import rentcar.ds.JdbcUtil;
import rentcar.dto.Member;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LoginFailDaoImplTest {

	private static Connection con;
	private LoginFailDao dao;

	@Before
	public void setUp() throws Exception {
		con = JdbcUtil.getConnection();
		dao = LoginFailDaoImpl.getInstance();
		((LoginFailDaoImpl) dao).setCon(con);
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
	}

	@Test
	public void test06LoginLockStatus() {
		System.out.printf("%s()%n", "test06LoginLockStatus");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginLockStatus("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test01LoginFailCount() {
		System.out.printf("%s()%n", "test01LoginFailCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginFailCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test02LoginFailCount() {
		System.out.printf("%s()%n", "test02LoginFailCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginFailCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test03LoginFailCount() {
		System.out.printf("%s()%n", "test03LoginFailCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginFailCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test04LoginFailCount() {
		System.out.printf("%s()%n", "test04LoginFailCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginFailCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test07ResetLoginFailCount() {
		System.out.printf("%s()%n", "test07ResetLoginFailCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().resetLoginFailCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test05LoginLock() {
		System.out.printf("%s()%n", "test05LoginLock");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().loginLock("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

	@Test
	public void test08ResetLockCount() {
		System.out.printf("%s()%n", "test08ResetLockCount");
		Member loginFail = new Member("dong");
		int res = LoginFailDaoImpl.getInstance().resetLockCount("dong");
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", loginFail);
	}

}
