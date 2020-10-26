package rentcar.controller.handler.rent;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Rent;

public class RentEndHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("POST")) {
			
			Gson gson = new Gson();
			Rent rent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Rent.class);
			
			String minHour = request.getParameter("minHour");
			String maxHour = request.getParameter("maxHour");
			
			
			System.out.println("RentDetail >>>>>>>>>" + rent);
		}
		
		return "/rent/rent_end.jsp";
	}
	
}