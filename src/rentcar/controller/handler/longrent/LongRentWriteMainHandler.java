package rentcar.controller.handler.longrent;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class LongRentWriteMainHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("메인 get");
//			request.getParameter("m_name");
//			request.getParameter("m_tel");
//			
			
			
			
			return "/longrent/longrent_write_main.jsp";
		} else {
			System.out.println("메인 post");
			return null;
		}
	}

}
