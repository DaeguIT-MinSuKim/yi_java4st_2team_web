package rentcar.controller.handler.kind;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Kind;
import rentcar.dto.Kind;
import rentcar.service.KindService;

public class KindDeleteHandler implements Command {
	private KindService service = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			
			int code = Integer.parseInt(request.getParameter("kindCode"));
			int res = service.deleteKind(new Kind(code));
			request.setAttribute("res", res);

			response.sendRedirect("kindList.do");
			return null;
		} else {
			System.out.println("POST");

			return "kindList.do";
		}
	}
}