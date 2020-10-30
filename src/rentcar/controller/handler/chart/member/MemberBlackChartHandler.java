package rentcar.controller.handler.chart.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import rentcar.controller.Command;
import rentcar.service.LongRentSerivce;
import rentcar.service.MemberService;

public class MemberBlackChartHandler implements Command {
	private MemberService service = new MemberService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONArray jsonArray = service.getCountBlackList();
		System.out.println("jsonArray >>> " + jsonArray);

		request.setAttribute("jsonArray",jsonArray);
		//		List<LongRent> chartList = service.selectLongRentChartList();
//		System.out.println("chartList >>> " + chartList);
		
		
		
		
		return "/chart/member/member_black_chart.jsp";
		
		
	}
}
