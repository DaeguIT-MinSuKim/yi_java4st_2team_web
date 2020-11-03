package rentcar.controller.handler.admin.option;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Opt;
import rentcar.service.OptService;

public class AdminOptUpdateHandler implements Command {

	private OptService service = new OptService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		if(request.getMethod().equalsIgnoreCase("GET")) {
			int code = Integer.parseInt(request.getParameter("code"));
			Opt opt = service.selectOptByNo(code);
			request.setAttribute("opt", opt);

			return "/admin/opt/optUpdate.jsp";
		}else {
			
			int optCode = Integer.parseInt(request.getParameter("optCode"));
			String optName = request.getParameter("optName");
			int optFare = Integer.parseInt(request.getParameter("optFare"));
			
			System.out.println("optCode >>>" + optCode);
			System.out.println(optName);
			System.out.println(optFare);
			
			int res = service.updateOpt(new Opt(optCode, optName, optFare));
			
			if( res==1 ) {
				response.getWriter().print("<script>alert('수정이 완료되었습니다.'); location.href='adminOptList.do'; </script>");
			}else {
				response.getWriter().print("<script>alert('수정에 실패했습니다. 다시 시도해주세요'); location.href='/admin/opt/optUpdate.jsp'</script>");
			}
			return null;
		}
	}
}
