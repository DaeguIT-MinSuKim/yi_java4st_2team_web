package rentcar.controller.handler.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Notice;
import rentcar.service.NoticeSerivce;

public class NoticeViewHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		System.out.println("view notice 서블릿 >>> "+ no);
				
		Notice notice = service.getNotice(no);
		request.setAttribute("Notice", notice);

		return "/notice/notice_view.jsp";
	}

}
