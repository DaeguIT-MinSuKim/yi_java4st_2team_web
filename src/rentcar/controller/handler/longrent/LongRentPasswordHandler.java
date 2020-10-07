package rentcar.controller.handler.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class LongRentPasswordHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			
			return "/longrent/longrent_password.jsp";
		} else {
			
			
			response.sendRedirect("/longrent/longrent_view.jsp");
			return null;
		}
	}

}
