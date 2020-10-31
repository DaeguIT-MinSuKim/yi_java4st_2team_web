package rentcar.controller.handler.admin.option;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Opt;
import rentcar.service.OptService;

public class AdminOptWriteHandler implements Command {

	private OptService service = new OptService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		if(request.getMethod().equalsIgnoreCase("GET")) {
			
			List<Opt> optList = service.selectOptByAll();
			request.setAttribute("optList", optList);
			
			return "/admin/opt/optWrite.jsp";
		}else {
			
			int optCode = Integer.parseInt(request.getParameter("optCode"));
			String optName = request.getParameter("optName");
			int optFare = Integer.parseInt(request.getParameter("optFare"));
			
			int res = service.insertOpt(new Opt(optCode, optName, optFare));
			
			if( res==1 ) {
				response.getWriter().print("<script>alert('옵션이 추가되었습니다.'); location.href='adminOptList.do'</script>");
			}else {
				response.getWriter().print("<script>alert('옵션 추가에 실패했습니다.'); location.href='adminOptWrite.do'</script>");
			}
		}
		return null;
	}
}
