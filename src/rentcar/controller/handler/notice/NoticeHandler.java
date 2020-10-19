package rentcar.controller.handler.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Notice;
import rentcar.service.NoticeSerivce;

public class NoticeHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Notice> list =  service.getNoticeList();
		request.setAttribute("list", list);
		return "/notice/notice_list.jsp";
	}

}
