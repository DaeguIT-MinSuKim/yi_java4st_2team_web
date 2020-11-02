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

public class ModifyHandler implements Command {

	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET ModifyHandler");

			return "modify/modify.jsp";

		} else {
			System.out.println("POST ModifyHandler");

			/*String id = request.getParameter("id");
						
			Date birth;
			try {
				birth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth"));
				String tel = request.getParameter("tel");
				String li_class = request.getParameter("li_class");
				String li_number = request.getParameter("li_number");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
			
				Member modify = new Member();
				modify.setId(id);
				modify.setDate(birth);
				modify.setTel(tel);
				modify.setLi_class(li_class);
				modify.setLi_number(li_number);
				modify.setEmail(email);
				modify.setAddress(address);
				service.updateMember(modify);
				response.sendRedirect("modify.do");
				System.out.println(modify);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}*/

			HttpSession session = request.getSession();

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			Member modifyMember = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Member.class);
			session.setAttribute("modifyMember", modifyMember);
			System.out.println("modifyMember > " + modifyMember);

			int res = service.updateMember(modifyMember);
			response.getWriter().print(res);

			return "member/join_end.jsp";
		}

	}

}
