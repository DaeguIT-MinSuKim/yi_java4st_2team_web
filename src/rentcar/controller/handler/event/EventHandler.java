package rentcar.controller.handler.event;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.service.EventService;

public class EventHandler implements Command {
	private EventService service = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<Event> eventList = service.listEventIng();
		
		request.setAttribute("eventList", eventList);
		
		return "/event/event.jsp";
	}

}
