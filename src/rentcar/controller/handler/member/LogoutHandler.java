package rentcar.controller.handler.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;

public class LogoutHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			HttpSession session = request.getSession(false);

			if (session != null) {
				session.invalidate();
			}

			return "index.do";

		} else {
			System.out.println("POST");

			return null;
		}

	}

}
