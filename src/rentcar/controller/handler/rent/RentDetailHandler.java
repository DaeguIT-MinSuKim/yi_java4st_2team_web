package rentcar.controller.handler.rent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.service.CarService;

public class RentDetailHandler implements Command {
	private CarService carService = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		if (request.getMethod().equalsIgnoreCase("GET")) {
			String carNo = request.getParameter("carNo");
			System.out.println("carNo >>>> " + carNo);
		}
		
		return "/rent/rent_detail.jsp";
	}

}