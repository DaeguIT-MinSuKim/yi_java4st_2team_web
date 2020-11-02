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
	private RentService service = new RentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONArray memberByAge = service.getCountMemberByAge();
		
		JSONArray carByYearly = service.getCountCarByYearly();
		
		JSONArray carByMonthly = service.getCountCarByMonthly();

		request.setAttribute("memberByAge", memberByAge);
		request.setAttribute("carByYearly", carByYearly);
		request.setAttribute("carByMonthly", carByMonthly);
		
	return "/chart/rentChart.jsp";
	}
}
