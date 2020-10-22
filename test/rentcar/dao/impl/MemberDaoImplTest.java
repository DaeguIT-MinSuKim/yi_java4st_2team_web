package rentcar.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.dao.MemberDao;
import rentcar.ds.JdbcUtil;
import rentcar.dto.Member;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MemberDaoImplTest {

	private static Connection con;
	private MemberDao dao;

	@Before
	public void setUp() throws Exception {
		con = JdbcUtil.getConnection();
		dao = MemberDaoImpl.getInstance();
		((MemberDaoImpl) dao).setCon(con);
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
	}

	@Test
	public void test04SelectMemberByAll() {
		System.out.println("test04SelectMemberByAll");
		List<Member> list = dao.selectMemberByAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
		System.out.println();
	}

	@Test
	public void test03SelectMemberByUserId() {
		System.out.printf("%s()%n", "test03SelectMemberByUserId");
		Member getMember = MemberDaoImpl.getInstance().selectMemberByUserId(new Member("dong"));
		Assert.assertNotNull(getMember);

		System.out.printf("%s%n%n", getMember);
	}

	@Test
	public void test01InsertMember() {
		System.out.printf("%s()%n", "test01InsertMember");
		Member insertMember = new Member("dong", "1234", "M", new Date(2020-9-1), "창동", "010-1234-1234", "Class1A",
				"12-12-123456-12", "aaa@aaa.com", "대구");
		int res = MemberDaoImpl.getInstance().insertMember(insertMember);
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", insertMember);
	}

	@Test
	public void test02UpdateMember() {
		System.out.printf("%s()%n", "test02UpdateMember");
		Member updateMember = new Member();
		int res = MemberDaoImpl.getInstance().updateMember(updateMember);
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", updateMember);
	}

	@Test
	public void test05DeleteMember() {
		System.out.printf("%s()%n", "test05DeleteMember");
		Member deleteMember = new Member("test");
		int res = MemberDaoImpl.getInstance().deleteMember(deleteMember);
		Assert.assertEquals(1, res);

		System.out.printf("%s%n%n", deleteMember);
	}

}
