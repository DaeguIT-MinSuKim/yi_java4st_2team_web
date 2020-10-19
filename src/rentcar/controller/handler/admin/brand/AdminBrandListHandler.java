package rentcar.controller.handler.admin.brand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentcar.controller.Command;
import rentcar.dto.Brand;
import rentcar.service.BrandService;

public class AdminBrandListHandler implements Command {
	private BrandService service = new BrandService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");

			List<Brand> brandList = service.BrandList();
			request.setAttribute("brandList", brandList);
			
			return "Admin/brand/list.do";
		} else {
			System.out.println("POST");

			int code = (int) request.getAttribute("brandCode");
			Brand brand = service.BrandDetail(code);
			request.setAttribute("brand", brand);
			
			return "Admin/brand/update.do";
		}
	}
}
