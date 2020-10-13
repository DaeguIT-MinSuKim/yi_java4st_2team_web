package rentcar.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JdbcUtil;
import rentcar.dto.Event;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
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
	public void test01SelectEventByAll() {
		System.out.println("testSelectEventByAll()");
		ArrayList<Event> list = dao.selectEventByAll();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void test02SelectEventIng() {
		System.out.println("testSelectEventIng()");
		ArrayList<Event> list = dao.selectEventIng();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void test03SelectEventEnd() {
		System.out.println("testSelectEventEnd()");
		ArrayList<Event> list = dao.selectEventEnd();
		Assert.assertNotNull(list);
		list.stream().forEach(System.out::println);
	}

	@Test
	public void test04SelectEventByCode() {
		System.out.println("testSelectEventByCode()");
		Event event = dao.selectEventByCode("1");
		Assert.assertNotNull(event);
		System.out.println(event);
	}

	@Test
	public void test05InsertEvent() {
		System.out.println("testInsertEvent()");
		Event event = new Event();
		event.setName("1월 이벤트");
		event.setSale(5000);
		event.setThumImage("1_thumbnail.png");
		event.setViewImage("1_view.png");
		event.setIsEvent("y");
		
		int res = dao.insertEvent(event);
		Assert.assertNotEquals(1, res);
	}
	
	@Test
	public void test06UpdateEvent() {
		System.out.println("testUpdateEvent()");
		Event event = new Event();
		event.setEventCode("4");
		event.setName("3월 이벤트");
		event.setSale(5000);
		event.setThumImage("1_thumbnail.png");
		event.setViewImage("1_view.png");
		event.setIsEvent("n");
		
		int res = dao.updateEvent(event);
		Assert.assertNotEquals(1, res);
		
	}
	
	@Test
	public void test07DeleteEvent() {
		System.out.println("testDeleteEvent()");
		int res = dao.deleteEvent("4");
		Assert.assertNotEquals(1, res);
	}

}
