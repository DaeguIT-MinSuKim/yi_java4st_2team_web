package rentcar.controller.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.Notice;
import rentcar.service.EventService;
import rentcar.service.NoticeSerivce;

public class MainHandler implements Command {
	private EventService eventService = new EventService();
	private NoticeSerivce noticeService = new NoticeSerivce();
	
	@Override	
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Event> eventList = eventService.listEvent();
		List<Notice> noticeList = noticeService.getNoticeList();
		
		request.setAttribute("eventList", eventList);
		request.setAttribute("noticeList", noticeList);
		return "main/main.jsp";
	}
}