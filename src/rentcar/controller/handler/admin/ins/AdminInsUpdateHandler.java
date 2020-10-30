package rentcar.controller.handler.admin.ins;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Ins;
import rentcar.dto.Notice;
import rentcar.service.InsService;

public class AdminInsUpdateHandler implements Command {
	private InsService service = new InsService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		if(request.getMethod().equalsIgnoreCase("get")) {
			System.out.println("UpdateModel Get!!!");
			
			Ins ins = service.selectInsByNo(Integer.parseInt(request.getParameter("code")));
			request.setAttribute("Ins", ins );
			
			return "admin/ins/ins_update.jsp";
		}else {
			System.out.println("post admin ins");
			
			Gson gson= new Gson();
			Ins ins = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Ins.class);
			
			System.out.println("admin ins >>" + ins);
			
			int res = service.updateIns(ins);
			response.getWriter().print(res);
			
			
			System.out.println("admin res >>" + res);
			return null;
		}
	}
}
