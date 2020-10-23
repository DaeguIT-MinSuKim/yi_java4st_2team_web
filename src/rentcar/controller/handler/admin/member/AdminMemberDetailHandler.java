package rentcar.controller.handler.admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;

public class AdminMemberDetailHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminMemberDetailHandler");

			ArrayList<Member> memberList = service.selectMemberByAll();
			request.setAttribute("memberList", memberList);

			return "/admin/member/memberDetail.jsp";

		} else {
			System.out.println("POST AdminMemberDetailHandler");

			return null;

		}

	}

}
