package rentcar.controller.handler.chart.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import rentcar.controller.Command;
import rentcar.service.EventService;

public class EventChartHandler implements Command {
	private EventService service = new EventService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JSONArray jsonArray = service.getCountEvent();
		System.out.println("jsonArray >>> " + jsonArray);

		request.setAttribute("jsonArray",jsonArray);
		//		List<LongRent> chartList = service.selectLongRentChartList();
//		System.out.println("chartList >>> " + chartList);
		
		
		return "/chart/event/event_chart.jsp";
	}

}
