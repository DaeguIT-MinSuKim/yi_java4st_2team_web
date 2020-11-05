package rentcar.controller.handler.rent;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentcar.controller.Command;
import rentcar.dto.Car;
import rentcar.dto.Event;
import rentcar.dto.Ins;
import rentcar.dto.Member;
import rentcar.dto.Opt;
import rentcar.dto.Rent;
import rentcar.service.CarService;
import rentcar.service.EventService;
import rentcar.service.InsService;
import rentcar.service.OptService;
import rentcar.service.RentService;

public class RentDetailHandler implements Command {
	private CarService carService = new CarService();
	private InsService insService = new InsService();
	private OptService OptService = new OptService();
	private EventService eventService = new EventService();
	private RentService rentService = new RentService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("get")) {

			// 사용자가 선택한 날짜+시간 데이터 가져옴, 다음 페이지에 던짐
			String minDate = request.getParameter("minDate");
			String maxDate = request.getParameter("maxDate");
			String minHour = request.getParameter("minHour");
			String maxHour = request.getParameter("maxHour");
			
			// 선택한 차량 상세정보 가져옴
			String carNo = request.getParameter("carNo");
			Car res = carService.carDetail(carNo);
			
			// 보험, 옵션, 할인쿠폰 정보 가져옴
			List<Ins> ins = insService.selectInsByAll();
			List<Opt> opt = OptService.selectOptByAll();
			
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			String id = loginUser.getId();
			ArrayList<Event> evt = eventService.selectEventBoxFindMemberCoupon(id);
			
			
			// ---------- 한 차량에 대한 최대 대여 가능일 가져옴 ↓ ----------
			Rent ren = rentService.selectRentByDate(carNo);
			
			if( ren.getReturn_date()!=null ) {
				// 1. localDateTime -> String으로 형변환.
				DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
				LocalDateTime returnDate = ren.getReturn_date();
				String formattedDateTime = returnDate.format(formatter);
				// 2. 형변환한 String을 다시 Date로 변환.
				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
				Date FristDate;		// rentDate   대여일
				Date secondDate;	// returnDate 반납일
				try {
					FristDate = format.parse(minDate);
					secondDate = format.parse(formattedDateTime);
					if( FristDate.after(secondDate) ) { // 두 날짜를 체크. after => FristDate가 괄호안의 secondDate보다 미래일 때 true (true면 잘못된거임..그래서 사용자단에 returnDate를 걍 빈값을 던진다)
	//					System.out.println("secondDate가 FristDate보다 이전날짜");
						ren = null;
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				// ---------- 한 차량에 대한 최대 대여 가능일 가져옴 ↑ ----------
			}
			
			request.setAttribute("minDate", minDate);
			request.setAttribute("maxDate", maxDate);
			request.setAttribute("minHour", minHour);
			request.setAttribute("maxHour", maxHour);
			request.setAttribute("carDetail", res);
			request.setAttribute("insList", ins);
			request.setAttribute("optList", opt);
			request.setAttribute("evtList", evt);
			request.setAttribute("maxDateLimit", ren);
			
		}
		return "/rent/rent_detail.jsp";
	}

}