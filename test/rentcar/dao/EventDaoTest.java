package rentcar.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JdbcUtil;
import rentcar.dto.Event;

public class EventDaoTest {
	private static Connection con;
	private static EventDaoImpl dao;

	@Before
	public void setUp() throws Exception {
		con = JdbcUtil.getConnection();
		dao = EventDaoImpl.getInstance();
		dao.setCon(con);
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
	}

	@Test
	public void testSelectEventByAll() {
		System.out.println("testSelectEventByAll()");
		ArrayList<Event> list = dao.selectEventByAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void testSelectEventIng() {
		System.out.println("testSelectEventIng()");
		ArrayList<Event> list = dao.selectEventIng();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void testSelectEventEnd() {
		System.out.println("testSelectEventEnd()");
		ArrayList<Event> list = dao.selectEventEnd();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void testSelectEventByCode() {
		System.out.println("testSelectEventByCode()");
		Event event = dao.selectEventByCode("1");
		Assert.assertNotNull(event);
		System.out.println(event);
	}

}
