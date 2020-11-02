package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.LoginFailService;
import rentcar.service.MemberService;

public class LoginHandler implements Command {

	private MemberService service = new MemberService();
	private LoginFailService service2 = new LoginFailService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET LoginHandler");

			return "member/login.jsp";

		} else {
			System.out.println("POST LoginHandler");

			HttpSession session = request.getSession();

			String id = request.getParameter("member_id").trim();
			String pwd = request.getParameter("passwd").trim();
			System.out.println("id > " + id + ", pwd > " + pwd);

			Member getId = service.selectMemberByUserId((id));
			System.out.println("getId > " + getId);

			int lock = service2.loginLockStatus(id);
			System.out.println("lock > " + lock);

			if (getId == null) {

			} else if (lock == 0) {
				if (getId.getPwd().equals(pwd)) {
					session.removeAttribute(id);
					session.setAttribute("loginUser", getId);
					int loginFail = service2.loginFailCount(id);
					System.out.println("loginFail > " + loginFail);
					int resetLFC = service2.resetLoginFailCount(id);
					System.out.println("resetLFC > " + resetLFC);
					int resetLLC = service2.resetLockCount(id);
					System.out.println("resetLLC > " + resetLLC);
					return "index.do";
				} else {
					int loginFail = service2.loginFailCount(id);
					System.out.println("loginFail > " + loginFail);
					int loginLock = service2.loginLock(id);
					System.out.println("loginLock > " + loginLock);
					request.setAttribute("message", "비밀번호가 틀렸습니다.");
					request.setAttribute("message2", "다시 확인해주세요.");
					return "member/login.jsp";
				}

			} else {
				request.setAttribute("message", "로그인을 1분간 할 수 없습니다.");
				return "member/login.jsp";
			}
			request.setAttribute("message", "존재하지 않는 아이디입니다.");
			return "member/login.jsp";
		}

	}

}
