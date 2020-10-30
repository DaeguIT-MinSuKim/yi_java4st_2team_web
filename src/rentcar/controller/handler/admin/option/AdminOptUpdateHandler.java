package rentcar.controller.handler.admin.option;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Opt;
import rentcar.service.OptService;

public class AdminOptUpdateHandler implements Command {

	private OptService service = new OptService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			int code = Integer.parseInt(request.getParameter("code"));
			Opt opt = service.selectOptByNo(code);
			request.setAttribute("opt", opt);
			
		}else {
			
			int optCode = Integer.parseInt(request.getParameter("optCode"));
			String optName = request.getParameter("optName");
			int optFare = Integer.parseInt(request.getParameter("optFare"));
			
			int res = service.updateOpt(new Opt(optCode, optName, optFare));
			
		}
		
		
		return "/admin/opt/optUpdate.jsp";
	}
}
