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
import rentcar.service.EventService;

public class EventViewHandler implements Command {
	private EventService service = new EventService();
	private EventBoxService eventBoxService = new EventBoxService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			String code = request.getParameter("code").trim();
			Event event = service.getEvent(code);
			
			if (event.getIsEvent().equalsIgnoreCase("y")) {
				if (loginUser == null) {
					request.setAttribute("member", "nonmember");
				} else {
					EventBox eventBoxUser = eventBoxService.selectEventBoxFindCodeId(code, loginUser.getId());
					if (eventBoxUser != null) {
						request.setAttribute("member", "coupon_exist");
					} else {					
						request.setAttribute("member", "member");
					}
				}	
			} else {
				request.setAttribute("event_end", "event_end");
			}
			
			request.setAttribute("event", event);

			return "/event/event_view.jsp";
		} else {

			return "/event/event_view.jsp";	
		}
	}

}
