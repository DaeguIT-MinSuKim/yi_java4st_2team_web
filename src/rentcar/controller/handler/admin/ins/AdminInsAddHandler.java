package rentcar.controller.handler.admin.ins;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rentcar.controller.Command;
import rentcar.dto.Ins;
import rentcar.service.InsService;

public class AdminInsAddHandler implements Command {
	private InsService service = new InsService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("get")) {
			
			
			return "admin/ins/ins_add.jsp";
		}else {
			Gson gson = new Gson();
			Ins ins = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Ins.class);
			
			int res = service.insertIns(ins);
			response.getWriter().print(res);
			return null;
			
		}
	}	
}
