package rentcar.controller.handler.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class RentHandler implements Command {
	private CarService carService = new CarService();
	private KindService KindService = new KindService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("get")) {
		}
		
		// 최초 시작시 차량정보 GET
		List<Car> car = carService.selectCarByAll();
		request.setAttribute("car", car);
		
		// 최초 시작시 차량분류 GET
		List<Kind> kind = KindService.kindList();
		request.setAttribute("kind", kind);
		
		
		return "/rent/rent.jsp";
	}

}