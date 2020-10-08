package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;

public class LoginHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			return "member/login.jsp";

		} else {
			System.out.println("POST");
			
			String url = "member/login_fail.jsp";
			
			HttpSession session = request.getSession();
			
			String id = request.getParameter("member_id").trim();
			String pwd = request.getParameter("passwd").trim();
			System.out.println("id > " + id + ", pwd > " + pwd);
			
			Member getId = service.selectMemberByUserId(new Member(id));
			System.out.println("getId > " + getId);
			
			if (getId.getPwd().equals(pwd)) {
				session.removeAttribute(id);
				session.setAttribute("loginUser", getId);
				url = "index.jsp";
			}
			return url;
		}

	}

}
