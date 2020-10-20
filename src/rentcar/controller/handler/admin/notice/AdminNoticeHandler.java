package rentcar.controller.handler.admin.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.service.EventService;

public class AdminNoticeHandler implements Command {
//	private EventService service = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		ArrayList<Event> eventList = service.listEvent();
//		request.setAttribute("eventList", eventList);
		return "/admin/notice/notice.jsp";
	}

}
