package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;

import rentcar.dao.MemberDao;
import rentcar.dao.impl.MemberDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Member;

public class MemberService {

	private static Connection con;
	private MemberDao dao;

	public MemberService() {
		con = JndiDS.getConnection();
		dao = MemberDaoImpl.getInstance();
		((MemberDaoImpl) dao).setCon(con);
	}

	public ArrayList<Member> selectMemberByAll() {
		return dao.selectMemberByAll();
	}

	public Member selectMemberByUserId(Member member) {
		return dao.selectMemberByUserId(member);
	}

	public int insertMember(Member member) {
		return dao.insertMember(member);
	}

	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	public int deleteMember(Member member) {
		return dao.deleteMember(member);
	}

}
