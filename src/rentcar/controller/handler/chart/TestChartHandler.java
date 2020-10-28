package rentcar.controller.handler.chart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;
import rentcar.utils.Paging;

public class TestChartHandler implements Command {
	private LongRentSerivce  service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		JSONArray jsonArray = service.getCountLongRent();
//		System.out.println("jsonArray >>> " + jsonArray);
//
//		request.setAttribute("jsonArray",jsonArray);
//		return "/chart/barChart.jsp";	
	return "/chart/lineChart.jsp";
	}
}
