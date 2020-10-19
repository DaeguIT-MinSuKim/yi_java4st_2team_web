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

public class KindListHandler implements Command {
	private KindService service = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			List<Kind> kindList = service.kindList();
			request.setAttribute("kindList", kindList);

			return "admin/kind/kindList.jsp";
		} else {
			System.out.println("POST");

			int no = (int) request.getAttribute("kindNo");
			Kind kind = service.kindDetail(no);
			request.setAttribute("kind", kind);

			return "admin/kind/kindUpdate.do";
		}
	}
}