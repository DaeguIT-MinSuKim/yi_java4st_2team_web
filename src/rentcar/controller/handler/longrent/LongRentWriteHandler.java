package rentcar.controller.handler.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;

public class LongRentWriteHandler implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("get")) {
			// 장기렌트 리스트에서 글쓰기 버튼 클릭 시
			return "/longrent/longrent_write.jsp";
		} else {
			// 장기렌트글쓰기에서 확인 했을 때
			
			return null;
		}
	}

}
