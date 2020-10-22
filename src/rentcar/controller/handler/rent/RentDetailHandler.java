package rentcar.controller.handler.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.dto.Ins;
import rentcar.dto.Opt;
import rentcar.service.CarService;
import rentcar.service.InsService;
import rentcar.service.OptService;

public class RentDetailHandler implements Command {
	private CarService carService = new CarService();
	private InsService insService = new InsService();
	private OptService OptService = new OptService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("get")) {

			// 사용자가 선택한 날짜+시간 데이터 가져옴, 다음 페이지에 던짐
			String minDate = request.getParameter("minDate");
			String maxDate = request.getParameter("maxDate");
			String minHour = request.getParameter("minHour");
			String maxHour = request.getParameter("maxHour");
			
			// 선택한 차량 상세정보 가져옴
			String carNo = request.getParameter("carNo");
			Car res = carService.carDetail(carNo);
			
			// 보험, 옵션 정보 가져옴
			List<Ins> ins = insService.selectInsByAll();
			List<Opt> opt = OptService.selectOptByAll();
			
			request.setAttribute("minDate", minDate);
			request.setAttribute("maxDate", maxDate);
			request.setAttribute("minHour", minHour);
			request.setAttribute("maxHour", maxHour);
			request.setAttribute("carDetail", res);
			request.setAttribute("insList", ins);
			request.setAttribute("optList", opt);
		}
		
		return "/rent/rent_detail.jsp";
	}

}