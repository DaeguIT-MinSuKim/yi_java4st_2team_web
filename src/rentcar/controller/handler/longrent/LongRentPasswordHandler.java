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
		// System.out.println("no >>>> " + no);

		String pwd = request.getParameter("pwd").trim();
		LongRent longrent = service.checkPwd(no, pwd);

		System.out.println("no >>>> " + no + "pwd >>>>>>>" + pwd);

		if (longrent != null) {
			System.out.println("비밀번호 일치");
			return "longRentView.do?no="+no;
//			url = null;
		} else {
			System.out.println("비밀번호 틀림");
			url = "/longrent/longrent_password.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
//			response.sendRedirect(url);
		}

		return url;
	}
}
