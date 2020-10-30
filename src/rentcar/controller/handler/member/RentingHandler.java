package rentcar.controller.handler.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class RentingHandler implements Command {
	
	private RentService rentService = new RentService();
	private OptBoxService optBoxService = new OptBoxService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		List<Rent> rentList = rentService.selectRentById(userId);
		
		request.setAttribute("rentList", rentList);
		
		return "/member/renting.jsp";
	}

}
