package rentcar.controller.handler.rent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.service.CarService;

public class RentDetailHandler implements Command {
	private CarService carService = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("get")) {

			// 날짜+시간 데이터 가져와서 다음 페이지에 던짐
			String minDate = request.getParameter("minDate");
			String maxDate = request.getParameter("maxDate");
			String minHour = request.getParameter("minHour");
			String maxHour = request.getParameter("maxHour");
			
			// 선택한 차량 상세정보 가져옴
			String carNo = request.getParameter("carNo");
			Car res = carService.carDetail(carNo);
			
			request.setAttribute("carDetail", res);
			request.setAttribute("minDate", minDate);
			request.setAttribute("maxDate", maxDate);
			request.setAttribute("minHour", minHour);
			request.setAttribute("maxHour", maxHour);
		}
		
		return "/rent/rent_detail.jsp";
	}

}