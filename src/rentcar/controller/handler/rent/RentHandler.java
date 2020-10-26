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
import rentcar.dto.Kind;
import rentcar.dto.Member;
import rentcar.dto.RentDate;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class RentHandler implements Command {
	private CarService carService = new CarService();
	private KindService KindService = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("get")) {
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			
			if(loginUser==null) { // 로그인 했을때만 들어오도록
				response.sendRedirect("login.do");
				return null;
			}else {
				// 최초 시작시 차량정보 GET
				List<Car> car = carService.carList();
				// 최초 시작시 차량정보 GET (화면에서 차량리스트에 뿌림)
				request.setAttribute("car", car);

				// 최초 시작시 차량분류 GET (화면에서 탭버튼에 뿌림)
				List<Kind> kind = KindService.kindList();
				request.setAttribute("kind", kind);
			}
		
		} else { // POST
			
			// 대여일선택 -> ajax로 값 받아옴
			Gson gson = new Gson();
			RentDate rent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), RentDate.class);
			
			// String으로 불러와야 앞자리 0이 사라지지 않기 때문에...
			String minYear = rent.getMinYear();
			String minMonth = rent.getMinMonth();
			String minDay = rent.getMinDay();
			String minHour = rent.getMinHour();
			
			String maxYear = rent.getMaxYear();
			String maxMonth = rent.getMaxMonth();
			String maxDay = rent.getMaxDay();
			String maxHour = rent.getMaxHour();
			
			if( maxYear==null ) { // 대여일만 선택한 경우
//				System.out.println("대여일 선택");
				
				// 형식에 맞게 조립.
				LocalDateTime minDate = LocalDateTime.of(
					Integer.parseInt(minYear), 
					Integer.parseInt(minMonth), 
					Integer.parseInt(minDay), 
					Integer.parseInt(minHour), 0
				);
				
				// 차량 목록 호출 
				List<Car> res = carService.selectRentByCar(minDate);
				String json = gson.toJson(res);
				response.getWriter().print(json);
				
			} else { // 대여일  + 반납일 선택한 경우 
//				System.out.println("대여일 + 반납일 선택");
				
				// 형식에 맞게 조립.
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
				List<Car> res = carService.selectRentByCar(minDate, maxDate);
				String json = gson.toJson(res);
				response.getWriter().print(json);
			}
			return null;
		}
		
		return "/rent/rent.jsp";
	}

}