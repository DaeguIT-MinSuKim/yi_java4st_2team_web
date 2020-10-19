package rentcar.service;

import java.sql.Connection;

import rentcar.dao.LoginFailDao;
import rentcar.dao.impl.LoginFailDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Member;

public class LoginFailService {

	private static Connection con;
	private LoginFailDao dao;

	public LoginFailService() {
		con = JndiDS.getConnection();
		dao = LoginFailDaoImpl.getInstance();
		((LoginFailDaoImpl) dao).setCon(con);
	}

	public int loginLockStatus(Member member) {
		return dao.loginLockStatus(member);
	}

	public int loginFailCount(Member member) {
		return dao.loginFailCount(member);
	}

	public int resetLoginFailCount(Member member) {
		return dao.resetLoginFailCount(member);
	}

	public int loginLock(Member member) {
		return dao.loginLock(member);
	}

	public int resetLockCount(Member member) {
		return dao.resetLockCount(member);
	}

}
