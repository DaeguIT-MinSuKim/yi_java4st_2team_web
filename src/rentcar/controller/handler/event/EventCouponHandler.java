package rentcar.controller.handler.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;
import rentcar.service.EventBoxService;

public class EventCouponHandler implements Command {
	private EventBoxService service = new EventBoxService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String eventCode = request.getParameter("code");
		
		EventBox eventBox = new EventBox();
		eventBox.setEventCode(new Event(eventCode));
		eventBox.setId(loginUser);
		
		int res = service.insertEventBox(eventBox);
		
		response.getWriter().print(res);
		response.sendRedirect("event.do");
		
		return null;
	}

}
