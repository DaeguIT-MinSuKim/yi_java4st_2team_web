package rentcar.controller.handler.rent;

import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.dto.Member;
import rentcar.dto.rentDate;
import rentcar.service.CarService;

public class RentDetailMainHandler implements Command {
	private CarService carService = new CarService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {

			return null;
		} else {
			System.out.println("post");
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			if (loginUser == null) {				
				Gson gson = new Gson();
				String json = gson.toJson("noLogin");
				response.getWriter().print(json);
				
			} else {

				Gson gson = new Gson();
				rentDate rent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), rentDate.class);
				
				// String으로 불러와야 앞자리 0이 사라지지 않기 때문에...
				String minYear = rent.getMinYear();
				String minMonth = rent.getMinMonth();
				String minDay = rent.getMinDay();
				String minHour = rent.getMinHour();
				
				String maxYear = rent.getMaxYear();
				String maxMonth = rent.getMaxMonth();
				String maxDay = rent.getMaxDay();
				String maxHour = rent.getMaxHour();
				
				String carNo = rent.getCarNo();
				
				LocalDateTime minDate = LocalDateTime.of(
					Integer.parseInt(minYear), 
					Integer.parseInt(minMonth), 
					Integer.parseInt(minDay), 
					Integer.parseInt(minHour), 0
				);
				
				LocalDateTime maxDate = LocalDateTime.of(
					Integer.parseInt(maxYear),
					Integer.parseInt(maxMonth),
					Integer.parseInt(maxDay),
					Integer.parseInt(maxHour), 0
				);
				
				// 차량 목록 호출 
				Car res = carService.selectRentByNo(minDate, maxDate, carNo);
				String json = gson.toJson(res);
				response.getWriter().print(json);
				
			}
			
			return null;
		}
	}

}
