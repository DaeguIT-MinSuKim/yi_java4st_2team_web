package rentcar.controller.handler.admin.option;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Opt;
import rentcar.service.OptService;

public class AdminOptDeleteHandler implements Command {
	private OptService service = new OptService();

	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		if (request.getMethod().equalsIgnoreCase("GET")) {

			int code = Integer.parseInt(request.getParameter("code"));
			int res = service.deleteOpt(new Opt(code));
			
			if( res==1 ) {
				response.getWriter().print("<script>alert('삭제했습니다.'); location.href='adminOptList.do'</script>");
			}else {
				response.getWriter().print("<script>alert('삭제 실패했습니다.'); location.href='adminOptList.do'</script>");
			}
		}
		return null; 
	}
}
