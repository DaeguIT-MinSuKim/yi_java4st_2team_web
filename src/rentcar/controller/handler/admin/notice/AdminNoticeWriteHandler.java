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

public class AdminNoticeWriteHandler implements Command {
	private NoticeSerivce service = new NoticeSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("공지사항 목록에서 글쓰기 ");
			return "admin/notice/notice_write.jsp";
		} else {
			System.out.println("공지사항 POST!!!!!!!!!!");
			
//			int no = Integer.parseInt(request.getParameter("YN"));
//			System.out.println(no);
			
			Gson gson = new Gson();
			Notice notice = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Notice.class);
			System.out.println("공지사항 작성 하는중............. "+ notice);
			
			int res = service.insertNotice(notice);
			response.getWriter().print(res);
			return null;
		}
	}

}
