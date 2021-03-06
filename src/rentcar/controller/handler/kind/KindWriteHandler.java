package rentcar.controller.handler.kind;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Kind;
import rentcar.service.KindService;

public class KindWriteHandler implements Command {
	private KindService service = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			
			return "admin/kind/kindWrite.jsp";
		} else {
			System.out.println("POST");

			String name = request.getParameter("name");
			int fare = Integer.parseInt(request.getParameter("fare"));
			
			Kind k = new Kind();
			k.setName(name);
			k.setFare(fare);
			service.insertKind(k);

			response.sendRedirect("kindList.do");
			return null;
		}
	}
}
