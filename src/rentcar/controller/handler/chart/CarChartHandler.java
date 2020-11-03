package rentcar.controller.handler.chart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import rentcar.controller.Command;
import rentcar.service.CarService;

public class CarChartHandler implements Command {
	private CarService service = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JSONArray carByBrand = service.getCountCarByBrand();

		JSONArray carByKind = service.getCountCarByKind();

		JSONArray carByRent = service.getCountCarByRent();

		JSONArray kindByRent = service.getCountKindByRent();

		JSONArray brandByRent = service.getCountBrandByRent();

		request.setAttribute("kindByRent", kindByRent);
		request.setAttribute("brandByRent", brandByRent);
		request.setAttribute("carByBrand", carByBrand);
		request.setAttribute("carByKind", carByKind);
		request.setAttribute("carByRent", carByRent);

		return "/chart/carChart.jsp";
	}
}
