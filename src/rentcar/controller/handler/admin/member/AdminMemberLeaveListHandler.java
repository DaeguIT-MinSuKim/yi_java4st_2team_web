package rentcar.controller.handler.admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class AdminMemberLeaveListHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminMemberLeaveListHandler");

			return null;

		} else {
			System.out.println("POST AdminMemberLeaveListHandler");

			return null;
		}
		
	}

}
