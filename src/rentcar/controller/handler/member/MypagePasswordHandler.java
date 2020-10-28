package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;

public class MypagePasswordHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {

			return null;

		} else {
			System.out.println("POST MypagePasswordHandler");

			HttpSession session = request.getSession();

			Member loginUser = (Member) session.getAttribute("loginUser");
			System.out.println("loginUser > " + loginUser);

			String pwd = request.getParameter("passwd").trim();
			System.out.println("pwd > " + pwd);

			if (loginUser.getPwd().equals(pwd)) {
				request.setAttribute("loginUser", loginUser);
				return "member/mypage.jsp";
				//return "mypage/modify.jsp";
			} else {
				request.setAttribute("message", "비밀번호가 틀렸습니다.");
			}
			request.setAttribute("loginUser", loginUser);

			return "member/mypage_password.jsp";
			

		}

	}

}
