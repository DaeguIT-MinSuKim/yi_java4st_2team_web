package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.Member;
import rentcar.utils.Paging;

public interface MemberDao {

	// 회원 리스트
	ArrayList<Member> selectMemberByAll();
	
	// 회원 블랙 리스트
	ArrayList<Member> selectMemberBlackList();

	// 회원 정보 - 마이페이지
	Member selectMemberByUserId(Member member);

	// 회원 가입
	int insertMember(Member member);

	// 회원 수정
	int updateMember(Member member);

	// 회원 탈퇴
	int deleteMember(Member member);

	// 페이징 - 회원 리스트
	int countMemberByAll();
	ArrayList<Member> pagingMemberByAll(Paging paging);
	
	// 페이징 - 회원 블랙 리스트
	int countMemberBlackList();
	ArrayList<Member> pagingMemberBlackList(Paging paging);
}
