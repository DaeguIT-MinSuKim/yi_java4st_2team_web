package rentcar.controller.handler.admin.notice;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Notice;
import rentcar.service.NoticeSerivce;

public class AdminNoticeUpdateHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		if(request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("UpdateModel Get!!!");
			
			Notice notice = service.getNotice(Integer.parseInt(request.getParameter("no")));
			System.out.println(notice);
			request.setAttribute("Notice", notice);
			
			return "admin/notice/notice_update.jsp";
		}else {
			Gson gson= new Gson();
			Notice notice = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Notice.class);
			System.out.println("update >> "+ notice);
			
			int res = service.updateNotice(notice);
			response.getWriter().print(res);
			return null;
		}
	}
}
