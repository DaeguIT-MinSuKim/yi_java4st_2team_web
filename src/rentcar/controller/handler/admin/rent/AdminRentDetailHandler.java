package rentcar.controller.handler.admin.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Rent;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class AdminRentDetailHandler implements Command {
	private RentService rentService = new RentService();
	private OptBoxService optBoxService = new OptBoxService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if(request.getMethod().equalsIgnoreCase("GET")) {
			// 수정 RENT_NO 값 기준으로  RENT현황 + 옵션 수정
			
			int rentNo = Integer.parseInt(request.getParameter("rentNo"));
			Rent rent = rentService.selectRentByNo(rentNo);
			List<String> optList = optBoxService.selectOptByRent(rentNo);
			
			request.setAttribute("rent", rent);
			request.setAttribute("optList", optList);
		}
		
		return "/admin/rent/rent_detail.jsp";
	}
}
