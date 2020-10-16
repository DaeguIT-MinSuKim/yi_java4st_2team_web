package rentcar.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.ds.JdbcUtil;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;

public class EventBoxDaoTest {
	private static Connection con;
	private static EventBoxDaoImpl dao;

	@Before
	public void setUp() throws Exception {
		con = JdbcUtil.getConnection();
		dao = EventBoxDaoImpl.getInstance();
		dao.setCon(con);
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
	}

	public void testInsertEventBox() {
		System.out.println("testInsertEventBox");
		EventBox eventBox = new EventBox();
		eventBox.setEventCode(new Event("1"));
		eventBox.setId(new Member("dong"));
		eventBox.setIsEvent("y");
		
		int res = dao.insertEventBox(eventBox);
		Assert.assertNotEquals(1, res);
	}

	@Test
	public void testSelectEventBoxFindCodeId() {
		System.out.println("testSelectEventBoxFindCodeId");
		
		EventBox eventBox = dao.selectEventBoxFindCodeId("1", "dong");
		System.out.println(eventBox);
	}
}
