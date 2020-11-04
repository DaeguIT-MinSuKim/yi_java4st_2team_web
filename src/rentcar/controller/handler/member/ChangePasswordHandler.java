package rentcar.controller.handler.member;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			Member changePass = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Member.class);
			session.setAttribute("changePass", changePass);
			System.out.println("changePass > " + changePass);

			int res = service.changePass1(changePass);
			response.getWriter().print(res);

			return "logout.do";
		}

	}

}
