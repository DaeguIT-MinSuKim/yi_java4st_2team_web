package rentcar.controller.handler.longrent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.LongRent;
import rentcar.service.LongRentSerivce;

public class LongRentPasswordHandler implements Command {
	private LongRentSerivce service = new LongRentSerivce();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		System.out.println("여기 nononono >>"+ no);
		
//		String pwd = request.getParameter("pwd").trim();
//		System.out.println("여기!!!!!!!!!!!!!!pwd" + pwd);
//
//		LongRent longrent = service.checkPwd(no, pwd);
//		System.out.println("longrent 비밀번호확인!!!!" + longrent);
//		if(longrent.getPwd().equals(pwd)) {
//			url = null;
//		}else {
//			url = "/longrent/longrent_password.jsp";
//			request.setAttribute("message", "비밀번호가 틀렸습니다.");
//		}
			return "/longrent/longrent_password.jsp";
//		return null;
		
//		if (request.getMethod().equalsIgnoreCase("get")) {
//			
//			return "/longrent/longrent_password.jsp";
//		} else {
//			
//			response.sendRedirect("longRentView.do");
//			return null;
//		}
	}

}
