package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;

public class JoinIdCheckHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET JoinIdCheckHandler");

			String id = request.getParameter("id").trim();
			System.out.println("id > " + id);

			Member message = service.selectMemberByUserId(new Member(id));
			System.out.println("message > " + message);

			request.setAttribute("id", id);
			request.setAttribute("message", message);

			return "member/member_id_check.jsp";

		} else {
			System.out.println("POST JoinIdCheckHandler");

			String id = request.getParameter("id").trim();
			System.out.println("id > " + id);
			
			Member message = service.selectMemberByUserId(new Member(id));
			System.out.println("message > " + message.getId());
			
			request.setAttribute("id", id);
			request.setAttribute("message", message.getId());

			return "member/member_id_check.jsp";
		}

	}

}