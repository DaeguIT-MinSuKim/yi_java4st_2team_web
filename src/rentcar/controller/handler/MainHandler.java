package rentcar.controller.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Notice;
import rentcar.service.NoticeSerivce;

public class MainHandler implements Command {
	private NoticeSerivce nService = new NoticeSerivce();
	
	@Override	
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "main/main.jsp";
	}
}