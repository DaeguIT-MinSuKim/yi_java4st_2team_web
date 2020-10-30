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

			Member getId = service.selectMemberByUserId(id);
			System.out.println("getId > " + getId);

			if (getId == null) {
				request.setAttribute("id", id);
				request.setAttribute("getId", getId);
				return "member/member_id_check.jsp";
			} 
			
			if (getId.getId().equals(id)) {
				request.setAttribute("id", id);
				request.setAttribute("getId", getId);
			}

			return "member/member_id_check.jsp";

		} else {
			System.out.println("POST JoinIdCheckHandler");

			String id = request.getParameter("id").trim();
			System.out.println("id > " + id);
			
			Member getId = service.selectMemberByUserId(id);
			System.out.println("getId > " + getId);
			
			if (getId == null) {
				request.setAttribute("id", id);
				request.setAttribute("getId", getId);
				return "member/member_id_check.jsp";
			} 
			
			if (getId.getId().equals(id)) {
				request.setAttribute("id", id);
				request.setAttribute("getId", getId);
			}

			return "member/member_id_check.jsp";
		}

	}

}