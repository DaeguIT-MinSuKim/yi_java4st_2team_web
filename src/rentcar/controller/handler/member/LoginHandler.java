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

			String url = "member/login_fail.jsp";
			String url2 = "member/login_lock.jsp";

			HttpSession session = request.getSession();

			String id = request.getParameter("member_id").trim();
			String pwd = request.getParameter("passwd").trim();
			System.out.println("id > " + id + ", pwd > " + pwd);

			Member getId = service.selectMemberByUserId(new Member(id));
			System.out.println("getId > " + getId);

			int lock = service2.loginLockStatus(new Member(id));
			System.out.println("lock > " + lock);
			
			if (lock == 0) {
				if (getId.getPwd().equals(pwd)) {
					session.removeAttribute(id);
					session.setAttribute("loginUser", getId);
					int resetLFC = service2.resetLoginFailCount(new Member(id));
					System.out.println("resetLFC > " + resetLFC);
					int resetLLC = service2.resetLockCount(new Member(id));
					System.out.println("resetLLC > " + resetLLC);
					url = "index.do";
				} else {
					int loginFail = service2.loginFailCount(new Member(id));
					System.out.println("loginFail > " + loginFail);
					int loginLock = service2.loginLock(new Member(id));
					System.out.println("loginLock > " + loginLock);
				}
				return url;
				
			} else {

			}

			return url2;
		}

	}

}
