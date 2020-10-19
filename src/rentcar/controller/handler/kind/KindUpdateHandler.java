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

			int code = (int) request.getAttribute("kindCode");
			Kind kind = service.kindDetail(code);
			request.setAttribute("kind", kind);

			return "admin/kind/kindUpdate.jsp";
		} else {
			Kind k = new Kind();
			k.setCode((int) request.getAttribute("kindCode"));
			k.setName((String) request.getAttribute("kindName"));
			k.setFare((int) request.getAttribute("kindFare"));

			int res = service.updateKind(k);
			request.setAttribute("res", res);

			return "admin/kind/kindList.jsp";
		}
	}
}
