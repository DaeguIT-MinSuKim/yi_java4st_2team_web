package rentcar.controller.handler.chart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import rentcar.controller.Command;
import rentcar.service.CarService;
import rentcar.service.RentService;

public class RentChartHandler implements Command {
	private RentService rentService = new RentService();
	private CarService carService = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONArray kindByRent = carService.getCountKindByRent();
		
		JSONArray brandByRent = carService.getCountBrandByRent();

		request.setAttribute("kindByRent", kindByRent);
		request.setAttribute("brandByRent", brandByRent);
		
	return "/chart/rentChart.jsp";
	}
}
