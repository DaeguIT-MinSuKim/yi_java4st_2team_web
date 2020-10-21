package rentcar.controller.handler.brand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.service.BrandService;

public class BrandListHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			List<Brand> brandList = service.brandList();
			request.setAttribute("brandList", brandList);
			
			return "admin/brand/brandList.jsp";
		} else {
			System.out.println("POST");

			return "brandList.do";
		}
	}
}
