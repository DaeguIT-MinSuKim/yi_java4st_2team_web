package rentcar.controller.handler.admin.notice;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class AdminNoticeUpdateHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
//		if(request.getMethod().equalsIgnoreCase("get")) {
//			System.out.println("UpdateModel Get!!!");
//			
//			LongRent longrent = service.getLongRent(Integer.parseInt(request.getParameter("no")));
//			System.out.println(longrent);
//			request.setAttribute("LongRent", longrent);
//			
//			return "/longrent/longrent_update.jsp";
//		}else {
//			Gson gson= new Gson();
//			LongRent longrent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), LongRent.class);
//			System.out.println("update >> "+ longrent);
//			
//			int res = service.updateLongRent(longrent);
//			response.getWriter().print(res);
			return null;
		}
//	}
}
