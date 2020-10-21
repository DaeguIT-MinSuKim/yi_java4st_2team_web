package rentcar.controller.handler.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.service.CarService;

public class CarDeleteHandler implements Command {
	private CarService service = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			String no = request.getParameter("carNo");
			int res = service.deleteCar(new Car(no));
			request.setAttribute("res", res);
			
			response.sendRedirect("carList.do");
			return null;
		} else {
			System.out.println("POST");

			return "carList.do";
		}
	}
}
