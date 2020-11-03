package rentcar.controller.handler.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.service.AdminService;

public class AdminLoginHandler implements Command {

	private AdminService service = new AdminService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminLoginHandler");

			return null;

		} else {
			System.out.println("POST AdminLoginHandler");
			
			HttpSession session = request.getSession();
			
			String id = request.getParameter("member_id").trim();
			String pwd = request.getParameter("passwd").trim();
			System.out.println("id > " + id + ", pwd > " + pwd);

			return null;
		}

	}

}
