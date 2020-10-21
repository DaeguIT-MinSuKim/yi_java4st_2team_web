package rentcar.controller.handler.brand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.service.BrandService;

public class BrandDeleteHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			int code = Integer.parseInt(request.getParameter("brandCode"));
			System.out.println("code > " + code);
			int res = service.deleteBrand(new Brand(code));
			request.setAttribute("res", res);
			
			response.sendRedirect("brandList.do");
			return null;
		} else {
			System.out.println("POST");
			
			return "brandList.do";
		}
	}
}
