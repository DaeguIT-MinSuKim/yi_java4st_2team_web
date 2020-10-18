package rentcar.controller.handler.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class LongRentViewHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		System.out.println("view 서블릿 >>>>" + no	);
		
		 LongRent longrent = service.getLongRent(no);
		 request.setAttribute("LongRent", longrent);
		 
		return "/longrent/longrent_view.jsp";
	}
}
