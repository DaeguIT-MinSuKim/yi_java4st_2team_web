package rentcar.controller.handler.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.service.CarService;

public class RentHandler implements Command {
	private CarService service = new CarService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("get")) {
		}
		
		List<Car> carList = service.selectCarByAll();
		request.setAttribute("carList", carList);
		
		return "/rent/rent.jsp";
	}

}