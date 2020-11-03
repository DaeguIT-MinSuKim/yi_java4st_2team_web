package rentcar.dao;

public interface LoginFailDao {

	// 로그인 제한 상태
	int loginLockStatus(String id);

	// 로그인 시도 횟수
	int loginFailCount(String id);

	// 로그인 시도 횟수 리셋
	int resetLoginFailCount(String id);

	// 로그인 제한 횟수
	int loginLock(String id);

	// 로그인 제한 횟수 리셋
	int resetLockCount(String id);

}
