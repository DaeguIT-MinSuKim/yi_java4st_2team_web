package rentcar.controller.handler.rent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class RentHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
<<<<<<< HEAD
		if (request.getMethod().equalsIgnoreCase("get")) {
			return "/rent/rent.jsp";
		}else {
			System.out.println("미안하다");
			return null;
		}
=======
		
		
		return "/rent/rent.jsp";
>>>>>>> branch 'master' of https://github.com/DaeguIT-MinSuKim/yi_java4st_2team_web.git
	}
}