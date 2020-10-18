package rentcar.controller.handler.admin.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Kind;
import rentcar.service.KindService;

public class AdminCarKindHandler implements Command {
	private KindService service = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			List<Kind> kindList = service.selectKindByAll();
			request.setAttribute("kindList", kindList);
			return null;
		} else {
			System.out.println("POST");
		}
		return null;
	}

}
