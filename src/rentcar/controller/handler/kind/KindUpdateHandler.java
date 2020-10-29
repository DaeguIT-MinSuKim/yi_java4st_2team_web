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

public class KindUpdateHandler implements Command {
	private KindService service = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			int code = Integer.parseInt(request.getParameter("kindCode"));
			Kind kind = service.kindDetail(code);
			request.setAttribute("kind", kind);

			return "admin/kind/kindUpdate.jsp";
		} else {
			System.out.println("POST");
			
			int code = Integer.parseInt(request.getParameter("code"));
			String name = request.getParameter("name");
			int fare = Integer.parseInt(request.getParameter("fare"));
			
			Kind k = new Kind(code, name, fare);
			service.updateKind(k);

			response.sendRedirect("kindList.do");
			return null;
		}
	}
}
