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

public class LongRentWriteHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("여기다");
			// 장기렌트 리스트에서 글쓰기 버튼 클릭 시
			return "/longrent/longrent_write.jsp";
		} else {
			// 장기렌트글쓰기에서 확인 했을 때
			Gson gson = new Gson();
			LongRent longrent = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), LongRent.class);
			System.out.println("longrent write>>여다! "+longrent);
			
			int res = service.addLongRent(longrent);
			response.getWriter().print(res);
			return null;
		}
	}

}
