package rentcar.service;

import java.sql.Connection;

import rentcar.dao.LoginFailDao;
import rentcar.dao.impl.LoginFailDaoImpl;
import rentcar.ds.JndiDS;

public class LoginFailService {

	private static Connection con;
	private LoginFailDao dao;

	public LoginFailService() {
		con = JndiDS.getConnection();
		dao = LoginFailDaoImpl.getInstance();
		((LoginFailDaoImpl) dao).setCon(con);
	}

	public int loginLockStatus(String id) {
		return dao.loginLockStatus(id);
	}

	public int loginFailCount(String id) {
		return dao.loginFailCount(id);
	}

	public int resetLoginFailCount(String id) {
		return dao.resetLoginFailCount(id);
	}

	public int loginLock(String id) {
		return dao.loginLock(id);
	}

	public int resetLockCount(String id) {
		return dao.resetLockCount(id);
	}

}
