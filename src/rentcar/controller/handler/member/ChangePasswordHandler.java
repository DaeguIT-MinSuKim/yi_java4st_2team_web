package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;

public class ChangePasswordHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET ChangePasswordHandler");

			return "mypage/change_password.jsp";
			
		} else {
			System.out.println("POST ChangePasswordHandler");
			
			HttpSession session = request.getSession();
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			System.out.println("loginUser > " + loginUser);

			String pwd = request.getParameter("passwd").trim();
			System.out.println("pwd > " + pwd);
			
			String newPwd1 = request.getParameter("new_passwd1").trim();
			System.out.println("newPwd1 > " + newPwd1);
			
			String newPwd2 = request.getParameter("new_passwd2").trim();
			System.out.println("newPwd2 > " + newPwd2);

			if(pwd.isEmpty()) {
				request.setAttribute("message", "현재 비밀번호를 입력하세요.");
				return "mypage/change_password.jsp";
			}
			
			if (loginUser.getPwd().equals(pwd)) {
				
				if (newPwd1.isEmpty()) {
					request.setAttribute("message", "변경할 비밀번호를 입력하세요.");
					return "mypage/change_password.jsp";
				}
				
				if (newPwd2.isEmpty()) {
					request.setAttribute("message", "변경할 비밀번호를 한번 더 입력하세요.");
					return "mypage/change_password.jsp";
				}
				
				if (newPwd1.equals(newPwd2)) {
					int changePass = service.changePass(loginUser.getId(), newPwd2);
					request.setAttribute("message", "비밀번호가 변경되었습니다.");
					response.getWriter().print(changePass);
					return "mypage/change_password.jsp";
				} else {
					request.setAttribute("message", "변경할 비밀번호가 일치하지 않습니다.");
					return "mypage/change_password.jsp";
				}

			} else {
				request.setAttribute("message", "현재 비밀번호가 틀렸습니다.");
				return "mypage/change_password.jsp";
			}

		}
		
	}

}
