package rentcar.controller.handler.admin.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class AdminLongRentUpdateHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			System.out.println("Admin UpdateModel Get!!!");
			
			int no = Integer.parseInt(request.getParameter("no").trim());
			String rep = request.getParameter("reply");
			
			int success = service.adminUpdateLongRent(rep, no);
			
			System.out.println(success);
			
			return "adminLongRent.do";
	}
}
