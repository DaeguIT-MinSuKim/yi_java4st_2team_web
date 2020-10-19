package rentcar.dao;

import rentcar.dto.Member;

public interface LoginFailDao {

	// 로그인 제한 상태
	int loginLockStatus(Member member);

	// 로그인 시도 횟수
	int loginFailCount(Member member);

	// 로그인 시도 횟수 리셋
	int resetLoginFailCount(Member member);

	// 로그인 제한 횟수
	int loginLock(Member member);

	// 로그인 제한 횟수 리셋
	int resetLockCount(Member member);

}
