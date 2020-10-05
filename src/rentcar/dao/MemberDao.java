package rentcar.dao;

import java.util.ArrayList;

import rentcar.dto.Member;

public interface MemberDao {

	// 회원 리스트
	ArrayList<Member> selectMemberByAll();

	// 회원 정보 - 마이페이지
	Member selectMemberByUserId(Member member);

	// 회원 가입
	int insertMember(Member member);

	// 회원 수정
	int updateMember(Member member);

	// 회원 탈퇴
	int deleteMember(Member member);

}
