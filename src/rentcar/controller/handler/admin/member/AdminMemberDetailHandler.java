package rentcar.controller.handler.admin.member;

import java.io.IOException;

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

			String id = request.getParameter("id").trim();
			Member selectMember = service.selectMemberByUserId(new Member(id));

			request.setAttribute("selectMember", selectMember);
			System.out.println(selectMember);
			
			/*String name = request.getParameter("name");
			String nameDESC = "SELECT * FROM MEMBER ORDER BY " + name + " DESC";
			System.out.println(nameDESC);*/
		
			return "admin/member/memberDetail.jsp";

		} else {
			System.out.println("POST AdminMemberDetailHandler");

			return null;

		}

	}

}
