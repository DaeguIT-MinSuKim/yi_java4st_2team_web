package rentcar.controller.handler.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.dto.Car;
import rentcar.service.CarService;

public class CarListHandler implements Command {
	private CarService service = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			List<Car> carList = service.carList();
			request.setAttribute("carList", carList);

			return "/admin/car/carList.jsp";
		} else {
			System.out.println("POST");

			String no = (String) request.getAttribute("carNo");
			Car car = service.carDetail(no);
			request.setAttribute("car", car);

			return "admin/car/carUpdate.do";
		}
	}
}
