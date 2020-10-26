package rentcar.controller.handler.admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class AdminMemberDeleteHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET AdminMemberDeleteHandler");
			
			return null;
			
		} else {
			System.out.println("POST AdminMemberDeleteHandler");
			
			return null;
			
		}
		
	}

}
