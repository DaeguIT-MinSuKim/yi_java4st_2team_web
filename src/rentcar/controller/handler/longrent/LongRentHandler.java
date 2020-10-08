package rentcar.controller.handler.longrent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class LongRentHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<LongRent> list = service.getLongRentList();
		request.setAttribute("list", list);
		
		return "/longrent/longrent_list.jsp";
	}

}
