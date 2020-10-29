package rentcar.controller.handler.rent;

import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

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
import rentcar.dao.impl.EventBoxDaoImpl;
import rentcar.dao.impl.OptBoxDaoImpl;
import rentcar.dao.impl.RentDaoImpl;
import rentcar.ds.JndiDS;
import rentcar.dto.Event;
import rentcar.dto.EventBox;
import rentcar.dto.Member;
import rentcar.dto.Rent;
import rentcar.service.OptBoxService;
import rentcar.service.RentService;

public class RentEndHandler implements Command {

	private RentService rentService = new RentService();
	private OptBoxService optBoxService = new OptBoxService();
//	private EventBoxService eventBoxService = new EventBoxService();
	
	/* 트랜잭션 */
	private Connection con = JndiDS.getConnection();
	private RentDaoImpl rentDao = RentDaoImpl.getInstance();
	private OptBoxDaoImpl optBoxDao = OptBoxDaoImpl.getInstance();
	private EventBoxDaoImpl eventBoxDao = EventBoxDaoImpl.getInstance();
	
	

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

			
			/*
			 *트랜잭션 시작
			 *  */
			try {
				//// impl과 연결
				rentDao.setCon(con);
				optBoxDao.setCon(con);
				eventBoxDao.setCon(con);
				//// 오토커밋 닫음
				con.setAutoCommit(false);
				
				//// 아래는 단기렌트 구현부 
				/*
				 * 예약하기 누를 시 DB변경 항목
				 * 1. 렌트(RENT) INSERT
				 * 2. 옵션(OPT_BOX) 체크한 종류별로 각각 INSERT
				 * 3. 예약한 회원의 할인/쿠폰(EVENT_BOX) 사용 했다면 UPDATE
				 * */
				
				// 1. 렌트(RENT) INSERT
				int rentInsert = rentDao.insertRent(rent);
				
				if( rentInsert==1 ) { // INSERT 성공하면
					Rent rentNo = rentDao.selectRecentByNo(); // 1번에서 삽입한 RENT_NO 가져옴
//					System.out.println("rentNo >>>" + rentNo.getRentNo());
					
					
					// 2. 옵션(OPT_BOX) 체크한 종류별로 각각 INSERT
					String optAll = rent.getOptAll();
					if( optAll.equals("0")) { // 옵션 선택 안했다면
						System.out.println("옵션 선택 안함");
					}else { // 선택 했다면
						System.out.println("옵션 선택함");

						List<String> optStr = new ArrayList<>();
						for(int i=0; i < optAll.length(); i++) {
							optStr.add(optAll.substring(i, i+1));
//							System.out.println(optStr.get(i));
							optBoxDao.insertOptByRent(Integer.parseInt(optStr.get(i)), rentNo.getRentNo());
						}
					}
				}
				
				// 3. 예약한 회원의 할인/쿠폰(EVENT_BOX) UPDATE
				Member userId = rent.getId();
				Event eventCode = rent.getEventCode();
				if(eventCode.getEventCode().equals("0")) {	// 쿠폰 사용 안했다면
					System.out.println("쿠폰 선택 안함");
				}else { // 사용 했다면
					System.out.println("쿠폰 선택함");
					EventBox eventBox = new EventBox();
					eventBox.setId(userId);
					eventBox.setEventCode(eventCode);
					int eventBoxUpdate = eventBoxDao.updateEventBoxEndIsEventFromMember(eventBox);
				}

				//// 오토커밋 살림
				con.commit();
				response.getWriter().print(1); // ajax에 성공 값 전송
				
			} catch (SQLException e) {
				rollbackUtil(con, e);
			}
			return null;
			
		}else { // GET	
			String id = request.getParameter("id");
			String carNo = request.getParameter("carNo");
			
			Rent rent = rentService.selectRecentByRent(id, carNo);
			
			// 추가옵션 불러옴
			int rentNo = rent.getRentNo();
			List<Integer> optList = optBoxService.selectOptByRent(rentNo);
			
			// 할인/쿠폰
//			int rentNo = rent.getRentNo();
//			List<Integer> optList = optBoxService.selectEventBoxFindCodeId(eventcode, id);
			
			
			System.out.println("optList>>>>>" + optList);
			System.out.println("rent >>>>>>>>" + rent);
			System.out.println("rent >>>>>>>>" + rent);
			
			
			request.setAttribute("optList", optList);
			request.setAttribute("rent", rent);
			
		}
		return "/rent/rent_end.jsp";
	}
		
	
	private void rollbackUtil(Connection con, SQLException e) {
		try {
			System.out.println("roll back");
			con.rollback();
			throw new RuntimeException();
		} catch (SQLException ex) {
			
		}
	}
	
}