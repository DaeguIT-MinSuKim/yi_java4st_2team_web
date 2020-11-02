package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;

public class JoinEndHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET JoinEndHandler");

			HttpSession session = request.getSession();

			Member joinMember = (Member) session.getAttribute("joinMember");
			System.out.println("joinMember > " + joinMember);

			return "member/join_end.jsp";

		} else {
			System.out.println("POST JoinEndHandler");

			return null;
		}

	}

}
