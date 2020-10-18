package rentcar.service;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.dao.impl.EventDaoImpl;
import rentcar.ds.JdbcUtil;

public class TransactionServiceTest {
	private static Connection con;
	private EventDaoImpl eventDao;
	private EventBoxDaoImpl eventBoxDao;

	@Before
	public void setUp() throws Exception {
		con = JdbcUtil.getConnection();
		eventDao = EventDaoImpl.getInstance();
		eventBoxDao = EventBoxDaoImpl.getInstance();
		eventDao.setCon(con);
		eventBoxDao.setCon(con);
	}

	@After
	public void tearDown() throws Exception {
		eventDao = null;
		eventBoxDao = null;
	}

	@Test
	public void testUpdateEvnetAndEventBox() {
		System.out.println("testUpdateEvnetAndEventBox()");
	}

}
