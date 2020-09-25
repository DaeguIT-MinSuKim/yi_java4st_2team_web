package rentcar.controller.intro.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class IntroHandler implements Command {
	
	@Override	
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "intro/intro.jsp";
	}
}
