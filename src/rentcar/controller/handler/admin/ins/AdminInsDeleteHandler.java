package rentcar.controller.handler.admin.ins;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.service.InsService;

public class AdminInsDeleteHandler implements Command {
	private InsService service = new InsService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("code").trim());
		
		service.deleteIns(code);
		 
		return "adminInsList.do";
	}
}
