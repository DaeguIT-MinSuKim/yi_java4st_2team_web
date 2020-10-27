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
import rentcar.dto.Rent;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class RentEndHandler implements Command {

	private RentService rentService = new RentService();
	private OptBoxService optBoxService = new OptBoxService();
	
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

//			System.out.println("RentDetail >>>>>>>>>" + rent);
			
			
			// 렌트 INSERT 
//			int rentIn = rentService.insertRent(rent);
//			System.out.println(rentIn);
			
//			if( rentIn==1 ) {
				Rent res = rentService.selectRecentByNo();
				System.out.println("res >>>>>>>" + res.getRentNo());
//			}else {
				
//			}
			
			// 옵션 여러개 INSERT
//			int optInsert = optBoxService.insertOptByRent(optCode, rentNo);
			
			// 회원의 쿠폰 UPDATE
			
			
//			response.getWriter().print(rentIn);
			return null;
		}
//		else { // GET	
//			System.out.println("get");
//		}
		return "/rent/rent_end.jsp";
		
	}
		
	
	
}