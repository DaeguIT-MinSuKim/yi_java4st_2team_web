package rentcar.controller.handler.admin.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;
import rentcar.service.NoticeSerivce;

public class AdminNoticeDeleteHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		System.out.println("delete 서블릿 >>>>" + no	);
		
		service.deleteNotice(no);
		 
		 
		return "adminNotice.do";
	}
}
