package rentcar.controller.handler.chart.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import rentcar.controller.Command;
import rentcar.service.LongRentSerivce;

public class LongRentHourChartHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONArray jsonArray = service.getCountTimeLongRent();
		//System.out.println("jsonArray >>> " + jsonArray);

		request.setAttribute("jsonArray",jsonArray);
		//		List<LongRent> chartList = service.selectLongRentChartList();
//		System.out.println("chartList >>> " + chartList);
		
		
		
		
		return "/chart/longrent/longrent_hour_chart.jsp";
		
		
	}
}
