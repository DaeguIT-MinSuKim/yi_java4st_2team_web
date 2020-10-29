package rentcar.controller.handler.admin.member;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.service.MemberService;

public class AdminMemberBlackUpdateHandler implements Command {
	
	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminMemberBlackUpdateHandler");

			return null;

		} else {
			System.out.println("POST AdminMemberBlackUpdateHandler");
					
			Gson gson = new Gson();
			Member blackMember = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Member.class);
			System.out.println("blackMember > " + blackMember);
			
			int res = service.updateBlack(blackMember);
			response.getWriter().print(res);
			
			return "/admin/member/memberBlackList.jsp";
		}

	}

}
