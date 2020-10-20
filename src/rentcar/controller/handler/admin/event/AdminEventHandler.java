package rentcar.controller.handler.admin.event;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.service.EventService;

public class AdminEventHandler implements Command {
	private EventService service = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ArrayList<Event> eventList = service.listEvent();
		//request.setAttribute("eventList", eventList);
		
		String key = request.getParameter("key");
		key = (key==null) ? "" : key;
		
		String tpage = request.getParameter("tpage");
		tpage = (tpage == null || tpage.equals("1")) ? "1" : tpage;

		request.setAttribute("key", key);
		request.setAttribute("tpage", tpage);
		
		ArrayList<Event> eventList = service.listEvent(Integer.parseInt(tpage));

		String paging = service.pageNumber(Integer.parseInt(tpage), key);
		
		request.setAttribute("eventList", eventList);
		int n = eventList.size();
		request.setAttribute("eventList2Size", n);
		request.setAttribute("paging", paging);
		
		
		
		return "/admin/event/event.jsp";
	}

}
