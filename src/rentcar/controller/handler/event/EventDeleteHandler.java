package rentcar.controller.handler.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.service.EventService;

public class EventDeleteHandler implements Command {
	private EventService service = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		
		int res = service.deleteEvent(code);
		response.getWriter().print(res);
		
		response.sendRedirect("event.do");
		
		return null;
	}

}
