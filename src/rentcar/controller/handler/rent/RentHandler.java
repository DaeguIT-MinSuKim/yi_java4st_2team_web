package rentcar.controller.handler.rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.dto.Kind;
import rentcar.service.CarService;
import rentcar.service.KindService;

public class RentHandler implements Command {
	private CarService carService = new CarService();
	private KindService KindService = new KindService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getMethod().equalsIgnoreCase("get")) {
			// 최초 시작시 차량정보 GET (화면에서 차량리스트에 뿌림)
			List<Car> car = carService.selectCarByAll();
			request.setAttribute("car", car);

			// 최초 시작시 차량분류 GET (화면에서 탭버튼에 뿌림)
			List<Kind> kind = KindService.kindList();
			request.setAttribute("kind", kind);
			
		} else { // POST
			int minYear = Integer.parseInt(request.getParameter("minYear"));

			System.out.println("minYear >>>>" + minYear);
			
//			int minYear = Integer.parseInt(request.getParameter("minYear"));
//			int minMonth = Integer.parseInt(request.getParameter("minMonth"));
//			int minDay = Integer.parseInt(request.getParameter("minDay"));
//			int minHour = Integer.parseInt(request.getParameter("minHour"));

			
//			LocalDateTime minDate = LocalDateTime.of(minYear, minMonth, minDay, minHour, 00, 00);
//			List<Car> res = carService.selectRentByCar(minDate);
			
//			JSONObject jobj = new JSONObject();
//			jobj.put("result", "true");
			
		    // 응답시 json 타입이라는 걸 명시 ( 안해주면 json 타입으로 인식하지 못함 )
//			response.setContentType("application/json");
//			response.getWriter().print(jobj.toJSONString());
		}

		return "/rent/rent.jsp";
	}

}