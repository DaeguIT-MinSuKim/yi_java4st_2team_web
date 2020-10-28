package rentcar.controller.handler.rent;

import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import rentcar.controller.Command;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.service.EventBoxService;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class RentEndHandler implements Command {

	private RentService rentService = new RentService();
	private OptBoxService optBoxService = new OptBoxService();
	private EventBoxService eventBoxService = new EventBoxService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getMethod().equalsIgnoreCase("POST")) {
			
			// gson 안에 LocalDateTime 변수도 받을 수 있게 오버라이딩 !!!
			Gson gson = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new JsonDeserializer<LocalDateTime>() {
			       @Override
			       public LocalDateTime deserialize(JsonElement json, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
			           Instant instant = Instant.ofEpochMilli(json.getAsJsonPrimitive().getAsLong());
			           return LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
			       }
			}).create();
			Rent rent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Rent.class);
			System.out.println("RentDetail >>>>>>>>>" + rent);

			
			/*
			 * 예약하기 누를 시 DB변경 항목
			 * 1. 렌트(RENT) INSERT
			 * 2. 옵션(OPT_BOX) 체크한 종류별로 각각 INSERT
			 * 3. 해당 회원의 할인/쿠폰(EVENT_BOX) 사용 했다면 UPDATE
			 * */
			
			// 1. 렌트(RENT) INSERT
//			int rentInsert = rentService.insertRent(rent);
//			
//			if( rentInsert==1 ) { // INSERT 성공하면
//				Rent rentNo = rentService.selectRecentByNo(); // 1번에서 삽입한 RENT_NO 가져옴
//				
//				// 2. 옵션(OPT_BOX) 체크한 종류별로 각각 INSERT
//				String optAll = rent.getOptAll();
//				String optStr[] = optAll.split(",");
//				for( String opt : optStr ) {
//					optBoxService.insertOptByRent(Integer.parseInt(opt), rentNo.getRentNo());
//				}
//			}
			
			// 회원의 쿠폰 UPDATE
			Member userId = rent.getId();
			Event eventCode = rent.getEventCode();
			EventBox eventBox = new EventBox();
			eventBox.setId(userId);
			eventBox.setEventCode(eventCode);
			
//			eventBoxService.
			
//			response.getWriter().print(rentIn);
			return null;
		}
//		else { // GET	
//			System.out.println("get");
//		}
		return "/rent/rent_end.jsp";
		
	}
		
	
	
}