package rentcar.controller.handler.admin.notice;

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

public class AdminNoticeHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		List<Notice> list =  service.getNoticeList();
		request.setAttribute("list", list);
		
		
		return "/admin/notice/notice.jsp";
	}

}
