package rentcar.service;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.JSONArray;

import rentcar.dao.MemberDao;
import rentcar.dao.impl.MemberDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Member;
import rentcar.utils.Paging;

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

	public ArrayList<Member> selectMemberBlackList() {
		return dao.selectMemberBlackList();
	}

	public Member selectMemberByUserId(String id) {
		return dao.selectMemberByUserId(id);
	}

	public int insertMember(Member member) {
		return dao.insertMember(member);
	}
	
	public int changePass(String id, String pwd) {
		return dao.changePass(id, pwd);
	}

	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	public int updateBlack(Member member) {
		return dao.updateBlack(member);
	}

	public int deleteMember(Member member) {
		return dao.deleteMember(member);
	}

	// 페이징 - 회원 리스트
	public int countMemberByAll() {
		return dao.countMemberByAll();
	}

	public ArrayList<Member> pagingMemberByAll(Paging paging) {
		return dao.pagingMemberByAll(paging);
	}

	// 페이징 - 회원 블랙 리스트
	public int countMemberBlackList() {
		return dao.countMemberBlackList();
	}

	public ArrayList<Member> pagingMemberBlackList(Paging paging) {
		return dao.pagingMemberBlackList(paging);
	}

	// 검색
	public ArrayList<Member> selectSearchMember(String condition, String keyword) {
		return dao.selectSearchMember(condition, keyword);
	}

	//차트
	public JSONArray getCountBlackList() {
		return dao.getCountBlackList();
	}
}
